import 'package:flutter/material.dart';

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({Key? key}) : super(key: key);

  @override
  _MyDrawerHeaderState createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      padding: EdgeInsets.only(top: 20),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/seun.png",),
              )
            ),
          ),

          Text(
            "Bloomzon Taxi",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
          ),
          Text(
            "bloomzom@gmail.com",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          )
        ],
      ),
    );
  }
}
