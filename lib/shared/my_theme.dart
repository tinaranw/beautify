part of 'shared.dart';

class MyTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: Colors.redAccent[300],
      backgroundColor: Color(0xFFf19b8e),
      primaryColor:Color(0xFFff9382),
      accentColor: Color(0xFF63ccd0),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      fontFamily: 'Nexa',
    );
  }
  static ThemeData darkTheme() {
    return ThemeData(
      primarySwatch: Colors.redAccent[300],
      backgroundColor: Color(0xFFf2f2f2),
      primaryColor:Color(0xFFff9382),
      accentColor: Color(0xFF63ccd0),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.lato().fontFamily,
    );
  }
}
