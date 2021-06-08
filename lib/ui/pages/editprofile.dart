part of 'pages.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = "/editprofile";
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  String id = FirebaseAuth.instance.currentUser.uid;
  String currentName, currentNumber;
  var _formKey = GlobalKey<FormState>();
  var ctrlName = TextEditingController();
  var ctrlPhone = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile"),
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
                          FutureBuilder(
                            future: _name(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return TextFormField(
                                controller: ctrlName,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    labelText: "Full Name",
                                    border: OutlineInputBorder(),
                                    hintText: ('$currentName')),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please fill in the field!";
                                  } else {
                                    return null;
                                  }
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          FutureBuilder(
                            future: _number(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return TextFormField(
                                controller: ctrlPhone,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Phone Number",
                                    border: OutlineInputBorder(),
                                    hintText: ('$currentNumber')),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please fill in the field!";
                                  } else {
                                    return null;
                                  }
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await AuthServices.editProfile(
                                          id, ctrlName.text, ctrlPhone.text)
                                      .then((value) {
                                    if (value) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      ActivityServices.showToast(
                                          "Update Profile Successful",
                                          Colors.green);
                                      Navigator.pushReplacementNamed(
                                          context, MainMenu.routeName);
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  });
                                } else {
                                  ActivityServices.showToast(
                                      "PLease fill in all fields!", Colors.red);
                                }
                              },
                              icon: Icon(Icons.save),
                              label: Text("Edit Profile"),
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

  _name() async {
    // ignore: await_only_futures
    final myuser = await FirebaseAuth.instance.currentUser.uid;
    if (id != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(myuser)
          .get()
          .then((ds) {
        currentName = ds.data()['name'];
      });
     
    }
  }

  _number() async {
    // ignore: await_only_futures
    final myuser = await FirebaseAuth.instance.currentUser.uid;
    if (id != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(myuser)
          .get()
          .then((ds) {
        currentNumber = ds.data()['phone'];
      });
      
    }
  }
}
