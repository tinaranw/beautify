part of 'services.dart';

class ActivityServices {
  static String dateNow() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
    String hasil = formatter.format(now);
    return hasil;
  }

  static void showToast(String text, Color myColor) {
    Fluttertoast.showToast(msg: text, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, backgroundColor: myColor, textColor: Colors.white, fontSize: 14);
  }

  static Container loadings(){
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.black26,
      child: SpinKitFadingCircle(
        size: 50,
        color: Colors.deepOrange,
      ),
    );
  }
  
  static String toIDR(String price){
    final priceFormat = NumberFormat.currency(locale: 'ID');
    return priceFormat.format(double.parse(price));
  }
}
