part of 'pages.dart';

class Splash extends StatefulWidget {
  static const String routeName = "/splash";
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  String checkDate = DateFormat('d-MM-yyyy').format(DateTime.now());
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");
  String currentUsername, currentBalance;
  String productName;
  String listExpiredProducts = "[!]";

  @override
  void initState() {
    super.initState();
    _loadSplash();
    localNotifyManager.setOnNotificationReceive(onNotificationReceive);
    localNotifyManager.setOnNotificationClick(onNotificationClick);
  }

  onNotificationReceive(ReceiveNotification notification) {
    print('Notification Received: ${notification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
  }

  _loadSplash() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, checkAuth);
  }

  void checkAuth() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      listExpiredProducts = getListExpiredProducts();
      Navigator.pushReplacementNamed(context, MainMenu.routeName);
      ActivityServices.showToast(
          "Welcome back " + auth.currentUser.email, Colors.blue);
      await localNotifyManager.showNotification("Your item(s) is expiring soon!");
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

  String getListExpiredProducts() {
    productCollection
        .where('productDate', isEqualTo: checkDate)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        listExpiredProducts =
            listExpiredProducts + ", " + result.get("productName");
        // print(listExpiredProducts);
      });
    });
    return listExpiredProducts;
  }
}
