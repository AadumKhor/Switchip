import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ansicolor/ansicolor.dart';

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

class SearchResult extends StatefulWidget {
  String query;

  SearchResult({this.query});

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  // String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: collection.where('City', isEqualTo: widget.query).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
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
          if (!snapshot.hasData) {
            return Center(
              child: Container(
                width: 80.0,
                height: 80.0,
                child: CircularProgressIndicator(),
              ),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 50,
            itemBuilder: (context, index) {
              List<DocumentSnapshot> ds = snapshot.data.documents;
              String name = ds[index]["eName"];
              return Card(
                child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  width: double.infinity,
                  height: 250.0,
                  child: Text(name),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
