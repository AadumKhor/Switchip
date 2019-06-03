import 'package:flutter/material.dart';
import 'package:switchip/screens/mainscreen.dart';

void main() => runApp(MyApp());

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
