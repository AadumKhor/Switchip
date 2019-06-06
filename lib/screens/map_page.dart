import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// final LatLng initialPos = new LatLng(42.6526, 73.7562);
final Color iconColor = Color(0xff1f222b);
final Color linkColor = Color(0xffac1eff);
String searchQuery = '';
var collection = Firestore.instance.collection('switchip');
Future<QuerySnapshot> doc =
    Firestore.instance.collection('switchip').getDocuments();
Stream<QuerySnapshot> stream =
    Firestore.instance.collection('switchip').snapshots();

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            width: double.infinity,
            height: 300.0,
            child: Center(
              child: Text(
                  'I wish I had Google Maps API.\n It would have been amazing with it.\nSorry about this :)',
                  style: TextStyle(
                    color: iconColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  )),
            )),
      ),
    );
  }

  // Widget _buildList(String place) {
  //   return Column(
  //     children: <Widget>[
  //       Align(
  //         alignment: Alignment.centerLeft,
  //         child: Text(
  //           place,
  //           textAlign: TextAlign.left,
  //           style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 22.0,
  //               fontWeight: FontWeight.w600,
  //               letterSpacing: 1.5),
  //         ),
  //       ),
  //       Container(
  //         height: 250.0,
  //         // width: 400.0,
  //         child: StreamBuilder(
  //           stream: collection.where('County', isEqualTo: place).snapshots(),
  //           builder: (context, snap) {
  //             if (snap.hasError) {
  //               return Center(
  //                 child: Text(
  //                   'There was an error fetching the data.\n Restart the app.',
  //                   style: TextStyle(
  //                       color: iconColor,
  //                       fontSize: 20.0,
  //                       fontWeight: FontWeight.bold,
  //                       letterSpacing: 1.2),
  //                 ),
  //               );
  //             }
  //             if (!snap.hasData) {
  //               return Container(
  //                   width: 20.0,
  //                   height: 20.0,
  //                   child: CircularProgressIndicator());
  //             } else {
  //               return ListView.builder(
  //                 shrinkWrap: true,
  //                 scrollDirection: Axis.horizontal,
  //                 itemCount: snap.data.documents.length,
  //                 itemBuilder: (context, index) {
  //                   Color _getColorFromIndex() {
  //                     switch (index % 5) {
  //                       case (0):
  //                         return Color(0xff00f773);
  //                         break;
  //                       case (1):
  //                         return Color(0xff3afcd5);
  //                         break;
  //                       case (2):
  //                         return Color(0xff6b2dfc);
  //                         break;
  //                       case (3):
  //                         return Color(0xfff42eda);
  //                         break;
  //                       case (4):
  //                         return Color(0xfff42e79);
  //                         break;
  //                       default:
  //                         return Colors.black;
  //                     }
  //                   }

  //                   List<DocumentSnapshot> ds = snap.data.documents;
  //                   String city = ds[index]["City"];
  //                   String county = ds[index]["County"];
  //                   return Card(
  //                     color: Colors.white,
  //                     child: Container(
  //                       margin: EdgeInsets.symmetric(
  //                           vertical: 10.0, horizontal: 10.0),
  //                       width: 300.0,
  //                       height: 230.0,
  //                       child: Column(
  //                         children: <Widget>[
  //                           Container(
  //                             height: 175,
  //                             width: 300.0,
  //                             child: Center(
  //                               child: Text(city + county),
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 10.0,
  //                           ),
  //                           Container(
  //                             height: 30,
  //                             width: 300.0,
  //                             color: _getColorFromIndex().withAlpha(100),
  //                             child: Text(
  //                               "City Name : $city",
  //                               style: TextStyle(
  //                                   color: iconColor,
  //                                   fontSize: 20.0,
  //                                   fontWeight: FontWeight.bold),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               );
  //             }
  //           },
  //         ),
  //       )
  //     ],
  //   );
  // }
}
