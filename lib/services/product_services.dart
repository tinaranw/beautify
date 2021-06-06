part of 'services.dart';

class ProductServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");
  static DocumentReference productDocument;

  static Products products;
  static Reference ref;
  static UploadTask uploadTask;
  static String imgUrl;

  static Future<bool> addProduct(Products products, PickedFile imgFile) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    productDocument = await productCollection.add({
      'productId': products.productId,
      'productName': products.productName,
      'productBrand': products.productBrand,
      'productDate': products.productDate,
      'productType': products.productType,
      'productCondition': products.productCondition,
      'productDesc': products.productDesc,
      'productPrice': products.productPrice,
      'productImage': products.productImage,
      'addBy': auth.currentUser.uid,
      'createdAt': dateNow,
      'updatedAt': dateNow,
    });

    if (productDocument != null) {
      ref = FirebaseStorage.instance
          .ref()
          .child("images")
          .child(productDocument.id + ".jpg");
      uploadTask = ref.putFile(File(imgFile.path));

      await uploadTask.whenComplete(() => ref.getDownloadURL().then(
            (value) => imgUrl = value,
          ));

      productCollection.doc(productDocument.id).update({
        'productId': productDocument.id,
        'productImage': imgUrl,
      });

      return true;
    } else {
      return false;
    }
  }

  static Future getProductById(String id) async {
    var doc = productCollection.doc(id);
    return doc;
  }

  static Future<bool> deleteProduct(String id) async {
    bool hsl = true;
    await Firebase.initializeApp();
    await productCollection.doc(id).delete().then((value) {
      hsl = true;
    }).catchError((onError) {
      hsl = false;
    });

    return hsl;
  }

  
}
