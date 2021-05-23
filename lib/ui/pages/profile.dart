part of 'pages.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = false;
  String msg = "Fail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Color(0xFFF6C9A8)),
            ),
            Expanded(
              child: Align(
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
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                    child: Align(
                  alignment: FractionalOffset.topCenter,
                  child: Container(
                      margin: EdgeInsets.only(top: 110),
                      // decoration: BoxDecoration(color: Color(0xFF636363)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/images/profileimage.png",
                              height: 130),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Tinara Nathania',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Color(0xFF636263),
                                fontFamily: 'Nexa'),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'tinaranathania@gmail.com',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF636263),
                                fontFamily: 'SanFransisco'),
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
                        ],
                      )),
                )),
              ],
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
              ),
            ),
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ));
  }
}
