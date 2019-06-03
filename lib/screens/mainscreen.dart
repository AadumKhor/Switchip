import 'package:flutter/material.dart';

final Color iconColor = Color(0xff1f222b);

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: iconColor,
          ),
          onPressed: () {
            //TODO:setup drawer if you have time
          },
        ),
        title: Text(
          'Switchip',
          style: TextStyle(
              color: iconColor,
              letterSpacing: 1.75,
              fontSize: 20.0,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(),
    );
  }
}
