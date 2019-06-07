import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:switchip/screens/mainscreen.dart';
import 'package:switchip/screens/more_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

Color mainColor = Color(0xffb3f442);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins', primaryColor: mainColor),
        home: MainScreen());
  }
}
