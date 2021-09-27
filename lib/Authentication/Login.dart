
import 'dart:convert';
import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:bloomzon/Authentication/Signup.dart';
import 'package:bloomzon/Home.dart';
import 'package:bloomzon/LandingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget{
  const Login({Key? key}): super(key:key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{

  bool _isLoading = false;

  static const String idScreen = "login";

  Key _formKey = GlobalKey<FormState>();

  bool isHiddenPassword = true;

  var emailController = TextEditingController();
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

  Future login() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse('https://bloomzon.com/driver/login.php'),
          body: {
            "email": emailController.text,
            "password": passwordController.text,
          }
      );
      Navigator.pop(context);
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home(),),);

      setState(() {
        Fluttertoast.showToast(msg:
        "Your Login is Successful.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER);
      });


      // var msg = json.decode(response.body);
      // if (msg == "OKK") {
      //   Fluttertoast.showToast(
      //       msg: "Your Login is Succesful", toastLength: Toast.LENGTH_LONG,
      //       gravity: ToastGravity.CENTER);
      //   Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Home(),),);
      // } else {
      //   Fluttertoast.showToast(
      //       msg: "Email and password invalid!", toastLength: Toast.LENGTH_LONG,
      //       gravity: ToastGravity.CENTER);
      // }
      // print(msg);

    }


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Container(
              child: Image(
                image: AssetImage('assets/images/logo.png'),
            )),

            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Driver Login',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
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
                              SizedBox(height: 30.0),
                              Container(
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: isHiddenPassword,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon:
                                      isHiddenPassword ? Icon(Icons.visibility_off) : Icon(
                                          Icons.visibility),
                                      onPressed: _togglePasswordView,
                                    ),
                                    hintText: 'Password',
                                  ),
                                ),
                              ),
                              SizedBox(height: 25.0),
                              Container(
                                width: 400,
                                height: 50,
                                child: ElevatedButton(
                                  // style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Text('Sign In'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                  ),
                                  onPressed: (){
                                    showLoaderDialog(context);
                                    login();
                                    //After successful login we will redirect to profile page. Let's create profile page now
                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.fromLTRB(10,20,10,20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(
                                    TextSpan(
                                        children: [
                                          TextSpan(text: "Don\'t have an account? "),
                                          TextSpan(
                                            text: 'Sign Up',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                                              },
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                          ),
                                        ]
                                    )
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );

  }

  Future<void> loginDriver() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var jsonResponse;
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("https://bloomzon.com/driver/login.php"),
          body: ({
            'password': passwordController.text,
            'email': emailController.text
          }));
      if(response.statusCode==200){
        Map<String, dynamic> responseJson = json.decode(response.body);

        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));

        // await storage.write(key: "token", value: responseJson["data"]["token"]);
        // String? storedToken = await storage.read(key: "token");
        //
        // print(storedToken);
        Flushbar(
          message:  '${responseJson['message']}',
          leftBarIndicatorColor: Colors.blue.shade300,
          duration:  Duration(seconds: 3),
        )..show(context);
        // jsonResponse = json.decode(response.body);
        // print("Response Status: ${response.statusCode}");
        // print('access token is -> ${json.decode(response.body)['token']}');
        print(responseJson["data"]["token"]);
        // print("Response status: ${response.body}");

        if (jsonResponse !=null){
          setState(() {
            _isLoading = false;
          });
          sharedPreferences.setString("token", jsonResponse['token']);
        }

        log('data: $response');

      } else {
        setState(() {
          _isLoading = false;
        });

        Map<String, dynamic> responseJson = json.decode(response.body);

        if (response.statusCode == 400) {
          print("Response status: ${response.body}");
          Navigator.pop(context);
          Flushbar(
            title: "Access Denied",
            message: '${responseJson['message']}',
            icon: Icon(
              Icons.info_outline,
              size: 28,
              color: Color.fromRGBO(255, 46, 0, 1),
            ),
            leftBarIndicatorColor: Colors.blue.shade300,
            duration: Duration(seconds: 3),
          )
            ..show(context);
          // log('Invalid error: "Invalid Details"');
        }
      }
    } else {
      Flushbar(
        title:  "Access Denied",
        message:  "Please, fill all fields",
        icon: Icon(
          Icons.info_outline,
          size: 28,
          color: Color.fromRGBO(255, 46, 0, 1),
        ),
        leftBarIndicatorColor: Colors.blue.shade300,
        duration:  Duration(seconds: 3),
      )..show(context);
      log('error: "Fill all fields"');
    }
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}