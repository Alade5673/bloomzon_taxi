import 'package:bloomzon/Home.dart';
import 'package:bloomzon/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: 375,
          height: 730,
          child: Stack(children: <Widget>[

            Positioned(
                top: 30,
                left: 120,
                child: Text(
                  'Edit Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 34, 1),
                      fontFamily: 'Oxygen',
                      fontSize: 24,
                      letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                )),

            Positioned(
              top: 40,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: 0.5,
                  width: 600.0,
                  color: Colors.black,
                  margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                ),
              ),
            ),

            Positioned(
                top: 200,
                left: 100,
                child: GestureDetector(
                  // onTap: () => showModalBottomSheet(
                  //   context: context,
                  //   isScrollControlled: true,
                  //   builder: (context) => ChangeProfilePicture(),
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(30),
                  //       topRight: Radius.circular(30),
                  //     ),
                  //   ),),
                  child: Container(
                    child: Text(
                      'Change profile picture',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 34, 1),
                          fontFamily: 'Oxygen',
                          fontSize: 18,
                          letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                  ),
                )),

            //Profile Picture
            Positioned(
                top: 85,
                left: 137,
                child: GestureDetector(
                  // onTap: () => showModalBottomSheet(
                  //   context: context,
                  //   isScrollControlled: true,
                  //   builder: (context) => ChangeProfilePicture(),
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(30),
                  //       topRight: Radius.circular(30),
                  //     ),
                  //   ),),
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(196, 196, 196, 1),
                        image: DecorationImage(
                            image: AssetImage('assets/images/seun.png'),
                            fit: BoxFit.fitWidth),
                        borderRadius:
                        BorderRadius.all(Radius.elliptical(100, 100)),
                      )),
                )),

            // Name
            Positioned(
                top: 250,
                left: 24,
                child: Container(
                    width: 327,
                    height: 52,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 327,
                              height: 52,
                              child: Stack(children: <Widget>[
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: 327,
                                        height: 52,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          ),
                                          color:
                                          Color.fromRGBO(245, 246, 248, 1),
                                        ))),

                                Positioned(
                                    top: 17,
                                    left: 12,
                                    child: Text(
                                      'Falana Elijah',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 34, 1),
                                          fontFamily: 'Oxygen',
                                          fontSize: 16,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    )),
                              ]))),
                    ]))),

            //email
            Positioned(
                top: 320,
                left: 23,
                child: Container(
                    width: 327,
                    height: 54,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 327,
                              height: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                                color: Color.fromRGBO(245, 246, 248, 1),
                              ))),
                      Positioned(
                          top: 18,
                          left: 12,
                          child: Text(
                            'alade5673@gmail.com',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 34, 1),
                                fontFamily: 'Oxygen',
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          )),
                    ]))),

            //phone
            Positioned(
                top: 390,
                left: 24,
                child: Container(
                    width: 327,
                    height: 54,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 327,
                              height: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                                color: Color.fromRGBO(245, 246, 248, 1),
                              ))),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 327,
                          height: 54,
                          child: TextField(
                            // controller: firstNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'phone number',
                              prefixIconConstraints: BoxConstraints(
                                minHeight: 18,
                                minWidth: 40,
                              ),
                              hintText: 'website',
                            ),
                          ),
                        ),
                      ),
                    ]))),

            //address
            Positioned(
                top: 463,
                left: 24,
                child: Container(
                    width: 327,
                    height: 54,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 327,
                              height: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                                color: Color.fromRGBO(245, 246, 248, 1),
                              ))),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 327,
                          height: 54,
                          child: TextField(
                            // controller: firstNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIconConstraints: BoxConstraints(
                                minHeight: 18,
                                minWidth: 40,
                              ),
                              hintText: 'address',
                            ),
                          ),
                        ),
                      ),
                    ]))),

            //Button
            Positioned(
                top: 579,
                left: 24,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      color: Color.fromRGBO(255, 46, 0, 1),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 145, vertical: 17),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Save',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Oxygen',
                              fontSize: 16,
                              letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      ],
                    ),
                  ),
                )),

            // Positioned(
            //     top: 85,
            //     left: 0,
            //     child: SvgPicture.asset(
            //         'assets/images/badge.svg',
            //         semanticsLabel: 'vector51'
            //     )
            // ),
          ])),
    );
  }
}
