import 'package:bloomzon/Authentication/Login.dart';
import 'package:bloomzon/DeliveredOrder.dart';
import 'package:bloomzon/DrawerHeader.dart';
import 'package:bloomzon/IncomingOrder.dart';
import 'package:bloomzon/Profile.dart';
import 'package:bloomzon/ScanCode.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'LandingPage.dart';
import 'Wallet.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var currentPage = DrawerSections.Home;

  @override
  Widget build(BuildContext context) {

    var container;

    if(currentPage == DrawerSections.Home){
      container = LandingPage();
    } else if(currentPage == DrawerSections.Profile){
      container = EditProfile();
    } else if (currentPage == DrawerSections.Incoming_Order){
      container = IncomingOrder();
    } else if (currentPage == DrawerSections.Delivered_Order){
      container = DeliveredOrder();
    } else if (currentPage == DrawerSections.Wallet){
      container = BalanceTable();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Bloomzon Taxi"),
        ),
        body: container,

    drawer: Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              MyDrawerHeader(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    ),);
  }

  Widget MyDrawerList(){
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Home", Icons.home, currentPage == DrawerSections.Home ? true : false),
          menuItem(2, "Profile", Icons.person, currentPage == DrawerSections.Profile ? true : false),
          menuItem(3, "Incoming Orders", Icons.input, currentPage == DrawerSections.Incoming_Order ? true : false),
          menuItem(4, "Delivered Orders", Icons.check, currentPage == DrawerSections.Delivered_Order ? true : false),
          menuItem(5, "Review", Icons.reviews, currentPage == DrawerSections.Review ? true : false),
          menuItem(6, "Wallet", Icons.account_balance_wallet_outlined, currentPage == DrawerSections.Wallet ? true : false),
          menuItem(7, "Logout", Icons.logout, currentPage == DrawerSections.Logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected){
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
            if(id == 1){
              currentPage = DrawerSections.Home;
            } else if(id == 2){
              currentPage = DrawerSections.Profile;
            } else if (id == 3){
              currentPage = DrawerSections.Incoming_Order;
            } else if (id == 4){
              currentPage = DrawerSections.Delivered_Order;
            } else if (id == 5){
              currentPage = DrawerSections.Review;
            } else if (id == 6){
              currentPage = DrawerSections.Wallet;
            } else if (id == 7){
              currentPage = DrawerSections.Logout;
            }

          });
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                    icon,
                    size: 20,
                    color: Colors.black,
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.black, fontSize: 16
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

}

enum DrawerSections {
  Home,
  Profile,
  Incoming_Order,
  Delivered_Order,
  Review,
  Wallet,
  Logout

}
