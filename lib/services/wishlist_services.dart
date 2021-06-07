part of 'services.dart';

class WishlistServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static CollectionReference wishlistCollection =
      FirebaseFirestore.instance.collection("wishlist");
  static DocumentReference wishlistDocument;

  static Wishlists wishlists;
  static Reference ref;
  static UploadTask uploadTask;
  static String imgUrl;

  static Future<bool> addWishlist(Wishlists wishlists, PickedFile imgFile) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    wishlistDocument = await wishlistCollection.add({
      'wishlistId': wishlists.wishlistId,
      'wishlistName': wishlists.wishlistName,
      'wishlistBrand': wishlists.wishlistBrand,
      'wishlistType': wishlists.wishlistType,
      'wishlistPrice': wishlists.wishlistPrice,
      'wishlistTotal': wishlists.wishlistTotal,
      'wishlistImage': wishlists.wishlistImage,
      'wishlistChecked': wishlists.wishlistChecked,
      'addBy': auth.currentUser.uid,
      'createdAt': dateNow,
      'updatedAt': dateNow,
    });

    if (wishlistDocument != null) {
      ref = FirebaseStorage.instance
          .ref()
          .child("images")
          .child(wishlistDocument.id + ".jpg");
      uploadTask = ref.putFile(File(imgFile.path));

      await uploadTask.whenComplete(() => ref.getDownloadURL().then(
            (value) => imgUrl = value,
          ));

      wishlistCollection.doc(wishlistDocument.id).update({
        'wishlistId': wishlistDocument.id,
        'wishlistImage': imgUrl,
      });

      return true;
    } else {
      return false;
    }
  }

  static Future getWishlistById(String id) async {
    var doc = wishlistCollection.doc(id);
    return doc;
  }

  static Future<bool> deleteWishlist(String id) async {
    bool hsl = true;
    await Firebase.initializeApp();
    await wishlistCollection.doc(id).delete().then((value) {
      hsl = true;
    }).catchError((onError) {
      hsl = false;
    });

    return hsl;
  }

  static double addToCart(double total, double price){
    total = total + price;
    return total;

  }

  static double removeFromCart(double total, double price){
    total = total - price;
    return total;

  }

  
}
