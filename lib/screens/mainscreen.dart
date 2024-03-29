import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:switchip/screens/search_result_page.dart';
import 'package:switchip/screens/search_result_page.dart' as prefix0;

import 'map_page.dart';
import 'more_page.dart';

final Color iconColor = Color(0xff1f222b);
final Color linkColor = Color(0xffac1eff);
AnsiPen error = new AnsiPen()..red(bold: true);
AnsiPen ok = new AnsiPen()..green();
String searchQuery = '';
var collection = Firestore.instance.collection('switchip');
Future<QuerySnapshot> doc =
    Firestore.instance.collection('switchip').getDocuments();
Stream<QuerySnapshot> stream =
    Firestore.instance.collection('switchip').snapshots();

// var dr = FirebaseDatabase.instance.reference();

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String path;
  bool isFileUploaded = false;

  @override
  void initState() {
    super.initState();
  }

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
      body: ListView(
        children: <Widget>[
          _topPart(),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Popular Stores : ',
                      style: TextStyle(
                          color: iconColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.75),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MorePage()));
                      },
                      child: Text(
                        'View more',
                        style: TextStyle(
                          color: linkColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(place: "Albany"),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(
                  place: "Broome",
                  shift: 2,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(
                  place: "Cattaraugus",
                  shift: 4,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(
                  place: "Cayuga",
                  shift: 2,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(
                  place: "Chautauqua",
                  shift: 1,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(
                  place: "Chemung",
                  shift: 3,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(
                  place: "Chenango",
                  shift: 4,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(
                  place: "Clinton",
                  shift: 1,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(
                  place: "Columbia",
                  shift: 4,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(
                  place: "Cortland",
                  shift: 3,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(
                  place: "Delaware",
                  shift: 2,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(
                  place: "Dutchess",
                  shift: 4,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                StoreList(
                  place: "Erie",
                  shift: 2,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(
                  place: "Essex",
                  shift: 0,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                StoreList(
                  place: "Franklin",
                  shift: 4,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => MainScreen()));
                  },
                  child: Container(
                    width: 300.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xff11998e), Color(0xff38ef7d)],
                            stops: [0.0, 2.0],
                            tileMode: TileMode.clamp)),
                    child: Center(
                      child: Text(
                        'Search more stores?',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Route map = new MaterialPageRoute(builder: (context) => MapPage());
          Navigator.push(context, map);
        },
        backgroundColor: Color(0xff45d17a),
        tooltip: 'Look on Map',
        elevation: 5.0,
        child: Icon(
          Icons.map,
          color: iconColor,
        ),
      ),
    );
  }

  Widget _topPart() {
    return Container(
      width: double.infinity,
      height: 250.0,
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 100.0,
              width: 100.0,
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
              width: 50.0,
              height: 50.0,
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
              width: 85.0,
              height: 85.0,
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
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MorePage()));
                },
                child: Container(
                  width: 300.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 5.0),
                      child: Text(
                        'Search your county!',
                        style: TextStyle(
                            color: iconColor,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future _doSearch(String query) async {
    Route searchRoute = MaterialPageRoute(
        builder: (context) => SearchResult(
              query: query,
            ));
    await Navigator.push(context, searchRoute);
  }
}

class StoreList extends StatelessWidget {
  final String place;
  int shift;

  StoreList({this.place, this.shift = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            place,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black,
                fontSize: 32.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5),
          ),
        ),
        Container(
          height: 250.0,
          // width: 400.0,
          child: StreamBuilder(
            stream: collection.where('County', isEqualTo: place).snapshots(),
            builder: (context, snap) {
              if (snap.hasError) {
                return Center(
                  child: Text(
                    'There was an error fetching the data.\n Restart the app.',
                    style: TextStyle(
                        color: iconColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2),
                  ),
                );
              }
              if (!snap.hasData) {
                return Container(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snap.data.documents.length,
                  itemBuilder: (context, index) {
                    Color _getColorFromIndex() {
                      switch ((index + shift) % 5) {
                        case (0):
                          return Color(0xff00f773);
                          break;
                        case (1):
                          return Color(0xff3afcd5);
                          break;
                        case (2):
                          return Color(0xff6b2dfc);
                          break;
                        case (3):
                          return Color(0xfff42eda);
                          break;
                        case (4):
                          return Color(0xfff42e79);
                          break;
                        default:
                          return Colors.black;
                      }
                    }

                    List<DocumentSnapshot> ds = snap.data.documents;
                    String city = ds[index]["City"];
                    String opType = ds[index]["Operation Type"];
                    String address = ds[index]["Location"];
                    String establishment = ds[index]["Establishment Type"];
                    String eName = ds[index]["Entity Name"];
                    String dbaName = ds[index]["DBA Name"];
                    var licence = ds[index]["Licence Number"];
                    var area = ds[index]["Square Footage"];
                    var zip = ds[index]["Zip Code"];

                    address = address.replaceAll('{', '');
                    address = address.replaceAll('}', '');
                    address = address.replaceAll('human_address', '');
                    address = address.replaceAll('\'', '\"');
                    address = address.replaceAll(':', '');
                    address = address.replaceAll('\"address\"', '');
                    address = address.replaceAll('\"', '');
                    address = address.replaceAll('city', '');
                    address = address.replaceAll('state', '');
                    address = address.replaceAll('zip', '');
                    address = address.replaceAll('needs_recoding False', '');
                    return GestureDetector(
                      onTap: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30.0, left: 20.0, right: 20.0),
                                        child: Center(
                                          child: Container(
                                            width: double.infinity,
                                            height: 300.0,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Color(0xffc0e7f7),
                                                      Color(0xffc9ffe7)
                                                    ],
                                                    tileMode: TileMode.clamp,
                                                    stops: [0.0, 0.5])),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 10.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "DBA Name : $dbaName",
                                                    style: TextStyle(
                                                        color: iconColor,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    "Address : $address",
                                                    style: TextStyle(
                                                        color: iconColor,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    "Area : $area",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: iconColor,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    "Licence: $licence",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: iconColor,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    "Zip Code: $zip",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: iconColor,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MapPage()));
                                        },
                                        child: Container(
                                          color: Colors.black,
                                          width: 200.0,
                                          height: 50.0,
                                          child: Center(
                                            child: Text(
                                              'View on Map',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25.0),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => AlertWithDetails(address: address,)));
                      },
                      child: Card(
                        color: Colors.white,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          width: 300.0,
                          height: 230.0,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 175,
                                width: 300.0,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        eName,
                                        style: TextStyle(
                                            color: iconColor,
                                            backgroundColor:
                                                _getColorFromIndex()
                                                    .withAlpha(150),
                                            letterSpacing: 1.2,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            width: 50.0,
                                            height: 50.0,
                                            color: Colors.red,
                                            child: Center(
                                              child: Text(
                                                establishment,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            width: 100.0,
                                            height: 50.0,
                                            color: Colors.green,
                                            child: Center(
                                              child: Text(
                                                opType,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            width: 100.0,
                                            height: 50.0,
                                            color: Colors.deepPurple,
                                            child: Center(
                                              child: Text(
                                                "$area",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 30,
                                width: 300.0,
                                color: _getColorFromIndex().withAlpha(100),
                                child: Text(
                                  "City Name : $city",
                                  style: TextStyle(
                                      color: iconColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }
}

class AlertWithDetails extends Dialog {
  String address;

  AlertWithDetails({this.address});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          height: 300.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Text(address),
        ),
      ),
    );
  }
}
