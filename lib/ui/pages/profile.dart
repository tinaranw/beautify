part of 'pages.dart';

class Profile extends StatefulWidget {
  final Users users;
  Profile({this.users});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = false;
  String msg = "Fail";
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  String currentUsername, currentEmail, currentBalance;

  @override
  Widget build(BuildContext context) {
    Users users;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFF6C9A8),
        child: Stack(
          children: [
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0.0),
                child: Container(
                    width: double.infinity,
                    height: 480,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Column(
                        children: [
                          FutureBuilder(
                            future: _username(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return Text(
                                '$currentUsername',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Color(0xFF636263),
                                    fontFamily: 'Nexa'),
                              );
                            },
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          FutureBuilder(
                            future: _email(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return Text(
                                '$currentEmail',
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF636263),
                                    fontFamily: 'SanFransisco'),
                              );
                            },
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          ElevatedButton.icon(
                              onPressed: () async {},
                              icon: Icon(Icons.account_box),
                              label: Text("Premium"),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF63CCD0),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)))),
                          Container(
                            height: 300,
                            child: ListView(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Settings',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Color(0xFF636263),
                                            fontFamily: 'Nexa'),
                                      ),
                                      BalanceCard(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: SizedBox(
                width: double.infinity,
                child:
                    Image.asset("assets/images/profileimage.png", height: 130),
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await AuthServices.signOut().then((value) {
                          if (value) {
                            setState(() {
                              isLoading = false;
                            });
                            ActivityServices.showToast(
                                "Logout success", Colors.greenAccent);
                            Navigator.pushReplacementNamed(
                                context, Login.routeName);
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                            ActivityServices.showToast(msg, Colors.redAccent);
                          }
                        });
                      },
                      icon: Icon(Icons.logout),
                      label: Text("Logout"),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFF9382),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)))),
                )),
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ),
      ),
    );
  }

  _username() async {
    // ignore: await_only_futures
    final myuser = await FirebaseAuth.instance.currentUser.uid;
    if (myuser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(myuser)
          .get()
          .then((ds) {
        currentUsername = ds.data()['name'];
        print("username" + currentUsername);
      });
    }
  }

  _email() async {
    // ignore: await_only_futures
    final myuser = await FirebaseAuth.instance.currentUser.uid;
    if (myuser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(myuser)
          .get()
          .then((ds) {
        currentEmail = ds.data()['email'];
      });
    }
  }
}
