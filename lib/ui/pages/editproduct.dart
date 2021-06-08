part of 'pages.dart';

class EditProduct extends StatefulWidget {
  static const String routeName = "/editproduct";
  final Products product;
  EditProduct({this.product});
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");
  DateTime _dateTime;
  bool isLoading = false;
  String productType;
  String productCondition;

  List listType = [
    'Not Selected',
    'Primer',
    'Foundation',
    'Concealer',
    'Setting Powder',
    'BB Cream',
    'Blush',
    'Contour',
    'Highlighter',
    'Eyeliner',
    'Mascara',
    'Eyeshadow',
    'Eyebrow',
    'Lip',
    'Setting Spray'
  ];
  String dropdownTypeValue = 'Not Selected';

  List listCondition = ['Not Selected', 'Perfect', 'Good', 'Bad'];

  String dropdownConditionValue = 'Not Selected';

  var _formKey = GlobalKey<FormState>();
  var ctrlName = TextEditingController();
  var ctrlBrand = TextEditingController();
  var ctrlDesc = TextEditingController();
  var ctrlPrice = TextEditingController();

  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();

  Future chooseFile(String type) async {
    ImageSource imgSrc;
    if (type == "camera") {
      imgSrc = ImageSource.camera;
    } else {
      imgSrc = ImageSource.gallery;
    }
    final selectedImage = await imagePicker.getImage(
      source: imgSrc,
      imageQuality: 50,
    );
    setState(() {
      imageFile = selectedImage;
    });
  }

  void showFileDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
              title: Text("Confirmation"),
              content: Text("Pick image from:"),
              actions: [
                ElevatedButton.icon(
                  onPressed: () {
                    chooseFile("camera");
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text("Camera"),
                  style: ElevatedButton.styleFrom(elevation: 0),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    chooseFile("gallery");
                  },
                  icon: Icon(Icons.folder_outlined),
                  label: Text("Gallery"),
                  style: ElevatedButton.styleFrom(elevation: 0),
                ),
              ]);
        });
  }

  @override
  void dispose() {
    ctrlName.dispose();
    ctrlBrand.dispose();
    ctrlDesc.dispose();
    ctrlPrice.dispose();
    super.dispose();
  }

  void clearForm() {
    ctrlName.clear();
    ctrlBrand.clear();
    ctrlDesc.clear();
    ctrlPrice.clear();
    setState(() {
      imageFile = null;
    });
  }

  var myFormat = DateFormat('d-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    Products product = ModalRoute.of(context).settings.arguments;
    // dropdownTypeValue = product.productType;
    // dropdownConditionValue = product.productCondition;
    // _dateTime = DateFormat('d-MM-yyyy').parse(product.productDate);

    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Product"),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.all(24),
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: ctrlName,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                labelText: "Product Name",
                                border: OutlineInputBorder(),
                                hintText: product.productName),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please fill in the field!";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: ctrlBrand,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "Product Brand",
                                border: OutlineInputBorder(),
                                hintText: product.productBrand),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please fill in the field!";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                child: Text(
                                  "Expiration Date",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Nexa',
                                      color: Color(0xFF636263)), // has impact
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _dateTime == null
                                        ? 'Nothing has been picked yet.'
                                        : _dateTime.toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'SanFransisco',
                                        color: Color(0xFF636263)), // has impact
                                  ),
                                  ElevatedButton.icon(
                                      onPressed: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2001),
                                                lastDate: DateTime(2222))
                                            .then((date) {
                                          setState(() {
                                            _dateTime = date;
                                          });
                                        });
                                      },
                                      icon: Icon(Icons.calendar_today),
                                      label: Text("Pick"),
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFFF9689),
                                          elevation: 0)),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Type',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF636263)), // has impact
                              ),
                              DropdownButton(
                                value: dropdownTypeValue,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(
                                    color: Color(0xFF636263),
                                    fontFamily: 'Nexa'),
                                onChanged: (newTypeValue) {
                                  setState(() {
                                    dropdownTypeValue = newTypeValue;
                                    productType = newTypeValue;
                                    print("product type: " + productType);
                                  });
                                },
                                items: listType.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Condition',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF636263)), // has impact
                              ),
                              DropdownButton(
                                value: dropdownConditionValue,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(
                                    color: Color(0xFF636263),
                                    fontFamily: 'Nexa'),
                                onChanged: (newConditionValue) {
                                  setState(() {
                                    dropdownConditionValue = newConditionValue;
                                    productCondition = newConditionValue;
                                    print("product condition: " +
                                        productCondition);
                                  });
                                },
                                items: listCondition.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: ctrlDesc,
                            keyboardType: TextInputType.text,
                            maxLines: 3,
                            decoration: InputDecoration(
                                labelText: "Product Description",
                                border: OutlineInputBorder(),
                                hintText: product.productDesc),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please fill in the field!";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: ctrlPrice,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Product Price",
                                border: OutlineInputBorder(),
                                hintText: product.productPrice),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please fill in the field!";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          imageFile == null
                              ? Row(
                                  children: [
                                    ElevatedButton.icon(
                                        onPressed: () {
                                          showFileDialog(context);
                                        },
                                        icon: Icon(Icons.photo_camera),
                                        label: Text("Take Photo"),
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xFFC8A6CB))),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text("File not found.")
                                  ],
                                )
                              : Row(
                                  children: [
                                    ElevatedButton.icon(
                                        onPressed: () {
                                          showFileDialog(context);
                                        },
                                        icon: Icon(Icons.photo_camera),
                                        label: Text("Retake Photo")),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Semantics(
                                        child: Image.file(
                                      File(imageFile.path),
                                      width: 100,
                                    ))
                                  ],
                                ),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: double.infinity, // <-- match_parent
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                // if (_formKey.currentState.validate() &&
                                //     imageFile != null) {
                                //   setState(() {
                                //     isLoading = true;
                                //   });
                                //   Products products = Products(
                                //       "",
                                //       ctrlName.text,
                                //       ctrlBrand.text,
                                //       (myFormat.format(_dateTime)).toString(),
                                //       productType,
                                //       productCondition,
                                //       ctrlDesc.text,
                                //       ctrlPrice.text,
                                //       "",
                                //       FirebaseAuth.instance.currentUser.uid,
                                //       "",
                                //       "");
                                //   await ProductServices.editProduct(
                                //           products, imageFile)
                                //       .then((value) {
                                //     if (value == true) {
                                //       ActivityServices.showToast(
                                //           "Edit product successful",
                                //           Colors.green);
                                //       clearForm();
                                //       Navigator.pushReplacementNamed(
                                //           context, MainMenu.routeName);
                                //       setState(() {
                                //         isLoading = false;
                                //       });
                                //     } else {
                                //       ActivityServices.showToast(
                                //           "Failed to edit product!",
                                //           Colors.red);
                                //     }
                                //   });
                                // } else {
                                //   ActivityServices.showToast(
                                //       "PLease fill in all fields!", Colors.red);
                                // }
                                 ActivityServices.showToast(
                                          "Mohon bersabar, ngab- Ini cobaan bagi saya :)",
                                          Colors.red);
                              },
                              icon: Icon(Icons.save),
                              label: Text("Edit Product"),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFFF9382),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0))),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                isLoading == true ? ActivityServices.loadings() : Container()
              ],
            )));
  }
}
