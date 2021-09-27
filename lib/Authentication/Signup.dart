import 'dart:convert';
// import 'dart:html';
import 'dart:io';
import 'package:bloomzon/Authentication/Login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  static const String idScreen = "register";

  Key _formKey = GlobalKey<FormState>();

  bool isHiddenPassword = true;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var homeController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 20,),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  Future sendData() async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        homeController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty ) {
      final response = await http.post(
          Uri.parse("https://bloomzon.com/driver/register.php"),
          body: {
            "name": nameController.text,
            "email": emailController.text,
            "address": homeController.text,
            "phone": phoneController.text,
            "password": passwordController.text,
          });

      setState(() {
        Fluttertoast.showToast(msg:
        "Your Registration to Bloomzon Taxi is Successful. You can now login.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER);
      });

    }
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
                child: Image(
              image: AssetImage('assets/images/logo.png'),
            )),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Driver Registration',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                child: TextField(
                                  controller: nameController,
                                  keyboardType: TextInputType.name,
                                  // validator: validateEmail,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Full Name',
                                    prefixIcon: Icon(Icons.person),
                                    hintText: 'Full Name',
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                height: 50,
                                child: TextField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  // validator: validateEmail,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email Address',
                                    prefixIcon: Icon(Icons.email),
                                    hintText: 'Email Address',
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                height: 50,
                                child: TextField(
                                  controller: homeController,
                                  keyboardType: TextInputType.streetAddress,
                                  // validator: validateEmail,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Home Address',
                                    prefixIcon: Icon(Icons.location_on),
                                    hintText: 'Home Address',
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                height: 50,
                                child: TextField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Phone Number',
                                    prefixIcon: Icon(Icons.phone),
                                    hintText: 'Phone Number',
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                height: 50,
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: isHiddenPassword,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: isHiddenPassword
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility),
                                      onPressed: _togglePasswordView,
                                    ),
                                    hintText: 'Password',
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              // Container(
                              //   child: _image == null ? Text('No Image Selected') : Image.file(_image),
                              // ),
                              SizedBox(height: 20.0),
                              Container(
                                width: 330,
                                height: 50,
                                child: ElevatedButton(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Text(
                                      "Upload ID".toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    // uploadImage();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white30),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 50,
                                child: ElevatedButton(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Text(
                                      "Upload Driver's Licence".toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    // choiceImage();
                                    // sendData();
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => Login()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white30),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                width: 400,
                                height: 50,
                                child: ElevatedButton(
                                  // style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Text(
                                      'Register'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    showLoaderDialog(context);
                                    sendData();
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => Login()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.red),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(text: "Already have an account? "),
                                  TextSpan(
                                    text: 'Login',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
