part of 'pages.dart';

class AddWishlist extends StatefulWidget {
  static const String routeName = "/addwishlist";
  @override
  _AddWishlistState createState() => _AddWishlistState();
}

class _AddWishlistState extends State<AddWishlist> {
  bool isLoading = false;
  String wishlistType;

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

  final _formKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlBrand = TextEditingController();
  final ctrlTotal = TextEditingController();
  final ctrlPrice = TextEditingController();

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
    ctrlTotal.dispose();
    ctrlPrice.dispose();
    super.dispose();
  }

  void clearForm() {
    ctrlName.clear();
    ctrlBrand.clear();
    ctrlTotal.clear();
    ctrlPrice.clear();
    setState(() {
      imageFile = null;
    });
  }

  var myFormat = DateFormat('d-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Your Dream Product"),
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
                            ),
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
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: "Product Brand",
                              border: OutlineInputBorder(),
                            ),
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
                                    wishlistType = newTypeValue;
                                    print("wishlist type: " + wishlistType);
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
                            height: 24,
                          ),
                          TextFormField(
                            controller: ctrlPrice,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Product Price",
                              border: OutlineInputBorder(),
                            ),
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
                            controller: ctrlTotal,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Number of Product",
                              border: OutlineInputBorder(),
                            ),
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
                                if (_formKey.currentState.validate() &&
                                    imageFile != null) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  Wishlists wishlists = Wishlists(
                                      "",
                                      ctrlName.text,
                                      ctrlBrand.text,
                                      wishlistType,
                                      ctrlPrice.text,
                                      "1",
                                      "",
                                      "1",
                                      FirebaseAuth.instance.currentUser.uid,
                                      "",
                                      "");
                                  await WishlistServices.addWishlist(
                                          wishlists, imageFile)
                                      .then((value) {
                                    if (value == true) {
                                      ActivityServices.showToast(
                                          "Add product successful",
                                          Colors.green);
                                      clearForm();
                                      Navigator.pushReplacementNamed(
                                          context, MainMenu.routeName);
                                      setState(() {
                                        isLoading = false;
                                      });
                                    } else {
                                      ActivityServices.showToast(
                                          "Failed to add product!", Colors.red);
                                    }
                                  });
                                } else {
                                  ActivityServices.showToast(
                                      "PLease fill in all fields!", Colors.red);
                                }
                              },
                              icon: Icon(Icons.save),
                              label: Text("Save Product"),
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
