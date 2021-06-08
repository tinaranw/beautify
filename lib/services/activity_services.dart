part of 'services.dart';

class ActivityServices {
  static String dateNow() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
    String hasil = formatter.format(now);
    return hasil;
  }

  static void showToast(String text, Color myColor) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: myColor,
        textColor: Colors.white,
        fontSize: 14);
  }

  static Container loadings() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        width: 500,
        height: 500,
        color: Colors.black26,
        child: SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Color(0xFFF19B8E) : Color(0xFF99E4F9),
              ),
            );
          },
        ));
  }

  static String toIDR(String price) {
    final priceFormat = NumberFormat.currency(locale: 'ID');
    return priceFormat.format(double.parse(price));
  }
}
