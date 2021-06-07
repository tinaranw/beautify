part of 'pages.dart';

class EditBalance extends StatefulWidget {
  static const String routeName = "/editbalance";
  final Users users;
  EditBalance({this.users});
  @override
  _EditBalanceState createState() => _EditBalanceState();
}

class _EditBalanceState extends State<EditBalance> {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  bool isLoading = false;
  String currentBalance;

  var _formKey = GlobalKey<FormState>();
  var ctrlBalance = TextEditingController();

  @override
  void dispose() {
    ctrlBalance.dispose();
    super.dispose();
  }

  void clearForm() {
    ctrlBalance.clear();
  }

  @override
  Widget build(BuildContext context) {
    final myuser = FirebaseAuth.instance.currentUser.uid;
    if (myuser != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(myuser)
          .get()
          .then((ds) {
        currentBalance = ds.data()['balance'];
        print("currBal: " + currentBalance);
        ctrlBalance.text = currentBalance;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Balance"),
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
                          TextFormField(
                            controller: ctrlBalance,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Current Balance",
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
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity, // <-- match_parent
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await AuthServices.updateBalance(myuser, ctrlBalance.text).then((value) {
                                    if (value == true) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      ActivityServices.showToast(
                                          "Update balance successful", Colors.greenAccent);
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
                              label: Text("Update Balance"),
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
