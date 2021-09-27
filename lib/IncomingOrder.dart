import 'package:flutter/material.dart';

import 'ScanCode.dart';

class IncomingOrder extends StatefulWidget {
  const IncomingOrder({Key? key}) : super(key: key);

  @override
  _IncomingOrderState createState() => _IncomingOrderState();
}

class _IncomingOrderState extends State<IncomingOrder> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(70, 10, 0, 20),
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
          padding: const EdgeInsets.only(top: 70.0),
          child: incomingOrder(),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 160.0),
          child: incomingOrder(),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 250.0),
          child: incomingOrder(),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 340.0),
          child: incomingOrder(),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 430.0),
          child: incomingOrder(),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 520.0),
          child: incomingOrder(),
        )
      ],
    );
  }

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
