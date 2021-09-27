import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ScanCode.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late GoogleMapController _controller;

  late Position position;
  late Widget _child;

  @override
  void initState() {
    // _child = RippleIndicator("Getting Location");
    // getCurrentLocation();
    super.initState();
  }

  // void getCurrentLocation() async {
  //   Position res = await Geolocator.getCurrentPosition();
  //   setState(() {
  //     position = res;
  //     _child = mapWidget();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 430,
          width: 370,
          child: GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(9.0765, 7.3986),
              // target: LatLng(position.latitude, position.longitude),
              zoom: 15.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(70, 450, 0, 20),
          child: Text(
            "Incoming Orders",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 490.0),
          child: incomingOrder(),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 580.0),
          child: incomingOrder(),
        )



        // Positioned(
        //   top: 270,
        //   child: Container(
        //     width: 370,
        //     height: 80,
        //     // decoration: BoxDecoration(color: Colors.white),
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 8.0),
        //       child: Row(
        //         children: [
        //           GestureDetector(
        //             onTap: null,
        //             child: Container(
        //               width: 110,
        //               height: 100,
        //               color: Colors.green,
        //               child: Padding(
        //                 padding: const EdgeInsets.only(left: 18.0),
        //                 child: Stack(
        //                   children: [
        //                     IconButton(
        //                         icon: const Icon(
        //                           Icons.check,
        //                           size: 40,
        //                           color: Colors.white,
        //                         ),
        //                         onPressed: () {}),
        //                     Padding(
        //                       padding: const EdgeInsets.only(top: 45.0),
        //                       child: Text(
        //                         'Accept',
        //                         style: TextStyle(
        //                             fontSize: 20,
        //                             fontWeight: FontWeight.normal,
        //                             color: Colors.white),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //           SizedBox(
        //             width: 5,
        //           ),
        //           GestureDetector(
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => ScanQR()),
        //               );
        //             },
        //             child: Container(
        //               width: 110,
        //               height: 80,
        //               color: Colors.white,
        //               child: Padding(
        //                 padding: const EdgeInsets.only(left: 18.0),
        //                 child: Stack(
        //                   children: [
        //                     IconButton(
        //                         icon: const Icon(
        //                           Icons.qr_code_scanner,
        //                           size: 40,
        //                           color: Colors.black,
        //                         ),
        //                         onPressed: () {}),
        //                     Padding(
        //                       padding: const EdgeInsets.fromLTRB(5, 45, 0, 0),
        //                       child: Text(
        //                         'Scan',
        //                         style: TextStyle(
        //                             fontSize: 20,
        //                             fontWeight: FontWeight.normal,
        //                             color: Colors.black),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //           SizedBox(
        //             width: 5,
        //           ),
        //           GestureDetector(
        //             onTap: null,
        //             child: Container(
        //               width: 110,
        //               height: 80,
        //               color: Colors.red,
        //               child: Padding(
        //                 padding: const EdgeInsets.only(left: 18.0),
        //                 child: Stack(
        //                   children: [
        //                     IconButton(
        //                         icon: const Icon(
        //                           Icons.cancel,
        //                           size: 40,
        //                           color: Colors.white,
        //                         ),
        //                         onPressed: () {}),
        //                     Padding(
        //                       padding: const EdgeInsets.fromLTRB(5, 45, 0, 0),
        //                       child: Text(
        //                         'Cancel',
        //                         style: TextStyle(
        //                             fontSize: 20,
        //                             fontWeight: FontWeight.normal,
        //                             color: Colors.white),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }

// Widget mapWidget() {
//   return GoogleMap(
//     mapType: MapType.normal,
//     initialCameraPosition: CameraPosition(
//       target: LatLng(9.0765, 7.3986),
//       // target: LatLng(position.latitude, position.longitude),
//       zoom: 15.0,
//     ),
//     onMapCreated: (GoogleMapController controller) {
//       _controller = controller;
//     },
//   );
// }

Widget incomingOrder(){
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Row(
              children: [
                Text(
                  "Order from Admin at: Area 1 Warehouse to: Garki",
                  style: TextStyle(color: Colors.black,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: [
                ElevatedButton(
                  child: Text(
                    'Accept',
                    style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),

                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
                SizedBox(width: 20,),

                ElevatedButton(
                  child: Text(
                    'Scan',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScanQR()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                ),

                SizedBox(width: 20,),

                ElevatedButton(
                  child: Text(
                    'Decline',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScanQR()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
}

}
