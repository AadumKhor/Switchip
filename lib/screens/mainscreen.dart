import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';

final Color iconColor = Color(0xff1f222b);

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String path;
  bool isFileUploaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250.0,
            color: Colors.white,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xff11998e), Color(0xff38ef7d)],
                            tileMode: TileMode.clamp,
                            stops: [0.0, 2.0])),
                  ),
                ),
                Positioned(
                  right: -10,
                  top: -10,
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff22c1c3), Color(0xfffdbb2d)],
                            tileMode: TileMode.clamp,
                            stops: [0.0, 0.5])),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: -10,
                  child: Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff5614b0), Color(0xffDBD65C)],
                            tileMode: TileMode.clamp,
                            stops: [0.0, 0.5])),
                  ),
                ),
                Center(
                  child: Card(
                    color: Colors.white,
                    child: Container(
                      width: 300.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 10.0,
                                offset: Offset(0.0, -10.0)),
                            BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 20.0,
                                offset: Offset(0.0, 10.0)),
                            BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 15.0,
                                offset: Offset(10.0, 10.0))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 5.0),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          onChanged: (value){},
                          decoration: InputDecoration.collapsed(
                            hintText: 'Search Stores',
                            hintStyle: TextStyle(
                              color: iconColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5
                            )
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }

  void checkCSV() async {
    await _getPath();
    String _path = path;
    final File file = new File(_path);
    var res = await file.readAsString(encoding: utf8);
    res = res.replaceAll('\r', '');
    var js = json.encode(res);
    print(js);
    //     .transform(new LineSplitter()) // Convert stream to individual lines.
    //     .listen((jsonList) {
    //   // Process results.

    //   List row = jsonList.split(','); // split by comma

    //   String id = row[0];
    //   String email = row[1];
    //   String phone = row[2];

    //   List<String> line = [id, email, phone];
    //   data.add(line);

    //   //   print('$id, $symbol,$age');
    //   // }, onDone: () {
    //   //   print('File is now closed.');
    //   // }, onError: (e) {
    //   //   print(e.toString());
    // }).onDone(() {
    //   var json = jsonEncode(data);
    //   print(json);
    //   print("File is now closed");
    // });
  }

// function working fine
  Future<String> _getPath() async {
    String result;
    try {
      // setState(() {
      //   isFileUploaded = false;
      // });

      FlutterDocumentPickerParams params =
          FlutterDocumentPickerParams(allowedFileExtensions: ['pdf', 'csv']);

      result = await FlutterDocumentPicker.openDocument(params: params);
    } catch (e) {
      print(e);
      result = 'ERROR AA GYA BC: $e';
    } finally {
      setState(() {
        isFileUploaded = true;
      });
    }

    setState(() {
      path = result;
      print(path);
    });
    return path;
  }
}
