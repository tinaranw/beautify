import 'dart:io';

import 'package:beautify/shared/shared.dart';
import 'package:beautify/ui/pages/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isAndroid || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}



void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) => Container();
  enablePlatformOverrideForDesktop();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        Landing.routeName: (context) => Landing(),
        Login.routeName: (context) => Login(),
        Register.routeName: (context) => Register(),
        AddProduct.routeName: (context) => AddProduct(),
        EditProduct.routeName: (context) => EditProduct(),
        ProductDetail.routeName: (context) => ProductDetail(),
        Statistics.routeName: (context) => Statistics(),
        SummaryPage.routeName: (context) => SummaryPage(),
        Calendar.routeName: (context) => Calendar(),
        AddWishlist.routeName: (context) => AddWishlist(),
        EditBalance.routeName: (context) => EditBalance(),
        EditProfile.routeName: (context) => EditProfile(),
      },
    );
  }
}
