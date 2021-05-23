part of 'pages.dart';

class Splash extends StatefulWidget {
  static const String routeName = "/splash";
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _loadSplash();
  }

  _loadSplash() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, checkAuth);
  }

  void checkAuth() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      Navigator.pushReplacementNamed(context, MainMenu.routeName);
      ActivityServices.showToast(
          "Welcome back " + auth.currentUser.email, Colors.blue);
    } else {
      Navigator.pushReplacementNamed(context, Landing.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(24),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Image.asset(
                  "assets/images/beautifylogo.png",
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Text(
                    "bea(u)tify",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFFccaacb)), // has impact
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
