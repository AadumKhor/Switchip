import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  String searchQuery = '';
  final Color iconColor = Color(0xff1f222b);
  int count = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Container(
                    width: 250.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 5.0),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        onSubmitted: (value) {
                          setState(() {
                            searchQuery = value;
                          });
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
                ),
                DropdownButton(
                  onChanged: (value) {
                    setState(() {
                      count = value;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: 100,
                      child: Text('100 items'),
                    ),
                    DropdownMenuItem(
                      value: 400,
                      child: Text('400 items'),
                    ),
                    DropdownMenuItem(
                      value: 800,
                      child: Text('800 items'),
                    ),
                    DropdownMenuItem(
                      value: 1000,
                      child: Text('1000 items'),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(),
            searchQuery == ''
                ? SizedBox(
                    height: 200,
                    width: 200.0,
                    child: Text(
                        'Select number of items from dropdown.\n Press done to execute query'),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height - 100,
                    child: StreamBuilder(
                        stream: Firestore.instance
                            .collection('switchip')
                            .where('County', isEqualTo: searchQuery)
                            .snapshots(),
                        builder: (context, snapshot) {
                          List<DocumentSnapshot> ds = snapshot.data.documents;
                          try {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                    'Error occured\n Please restart the app'),
                              );
                            }
                            if (!snapshot.hasData || snapshot.data == null) {
                              return Container(
                                width: 80.0,
                                height: 80.0,
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: count,
                              itemBuilder: (context, index) {
                                String name = ds[index]["Entity Name"];
                                String address = ds[index]["Location"];
                                address = address.replaceAll('{', '');
                                address = address.replaceAll('}', '');
                                address =
                                    address.replaceAll('human_address', '');
                                address = address.replaceAll('\'', '\"');
                                address = address.replaceAll(':', '');
                                address = address.replaceAll('\"address\"', '');
                                address = address.replaceAll('\"', '');
                                address = address.replaceAll('city', '');
                                address = address.replaceAll('state', '');
                                address = address.replaceAll('zip', '');
                                address = address.replaceAll(
                                    'needs_recoding False', '');
                                return ListTile(
                                  title: Text(
                                    name,
                                    style: TextStyle(
                                        color: iconColor,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  subtitle: Text(address,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400)),
                                );
                              },
                            );
                          } catch (e) {
                            return Center(
                              child: Text(
                                  'Please enter valid county.\n Check your spelling or capitalisation'),
                            );
                          }
                        }),
                  )
          ],
        ),
      ),
    );
  }
}
