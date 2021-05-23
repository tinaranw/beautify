part of 'pages.dart';

class Landing extends StatefulWidget {
  
  static const String routeName = "/landing";
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(
                    "bea(u)tify",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Color(0xFF8ad5aa)), // has impact
                  ),
                  SizedBox(height: 5),
                  new Text(
                    "Start your journey today.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF636263),
                        fontFamily: 'SF'), // has impact
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, Login.routeName);
                        },
                        icon: Icon(Icons.arrow_forward_outlined),
                        label: Text("Next"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFff7a66)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )))),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: new Image.asset(
                    "assets/images/girls.png",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
