import 'package:beautify/shared/shared.dart';
import 'package:beautify/ui/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bea(u)tify",
      theme: MyTheme.lightTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        Splash.routeName: (context) => Splash(),
        MainMenu.routeName: (context) => MainMenu(),
        Login.routeName: (context) => Login(),
        Register.routeName: (context) => Register(),
      },
    );
  }
}
