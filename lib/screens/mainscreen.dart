// import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:switchip/screens/search_result_page.dart';
import 'package:switchip/screens/search_result_page.dart' as prefix0;

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
                    Text(
                      'View more',
                      style: TextStyle(
                        color: linkColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Albany"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Broome"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Cattaraugus"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Cayuga"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Chautauqua"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Chemung"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Chenango"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Clinton"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Columbia"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Cortland"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Delaware"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Dutchess"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Erie"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Essex"),
                SizedBox(
                  height: 20.0,
                ),
                _buildList("Franklin")
              ],
            ),
          )
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Route map = new MaterialPageRoute();
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

  Widget _buildList(String place) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            place,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
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
              if (!snap.hasData) {
                return Container(
                    width: 80.0,
                    height: 80.0,
                    child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snap.data.documents.length,
                  itemBuilder: (context, index) {
                    Color _getColorFromIndex() {
                      switch (index % 5) {
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
                    String county = ds[index]["County"];
                    return Card(
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
                              child: Center(
                                child: Text(city + county),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onSubmitted: (value) {
                    searchQuery = value;
                    _doSearch(searchQuery);
                  },
                  decoration: InputDecoration.collapsed(
                      hintText: 'Search your county!',
                      hintStyle: TextStyle(
                          color: iconColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5)),
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
