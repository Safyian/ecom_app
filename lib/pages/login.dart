import 'package:ecom_app/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = new TextEditingController();
  TextEditingController _passwordTextController = new TextEditingController();

  SharedPreferences preferences;
  bool loading = false;
  bool isLogedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    await firebaseAuth.currentUser().then((user) {
      if (user != null) {
        setState(() {
          isLogedIn = true;
        });
      }
    });
    if (isLogedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  // Future handleSignIn() async {
  //   preferences = await SharedPreferences.getInstance();

  //   setState(() {
  //     loading = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height/3;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/back.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/logo.png', width: 280.0, height: 240.0),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
                child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  // ****************Email TextField****************

                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.8),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: _emailTextController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            icon: Icon(Icons.alternate_email),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value))
                                return 'Please make sure your email address is valid';
                              else
                                return null;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),

                  // ****************Password TextField****************
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.8),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: _passwordTextController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            icon: Icon(Icons.lock_outline),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The Password field can't be Empty";
                            } else if (value.length < 6) {
                              return "The Password has to be at least 6 Chatacters long";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),

                  // ****************Login Button****************
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.red.shade700,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () {},
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        )),
                  ),

                  //*********** Forget Password *****************/
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Forget Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  Divider(
                    height: 10,
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "OR",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  //*********** Don't have account *****************/
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text('Sign up',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red)),
                    ),
                  ),

                  // Expanded(child: Container()),
                  // Divider(color: Colors.white,),
                  // Text("Other Login Options", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),

                  // ****************Google Button****************
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 4.0, 14.0, 8.0),
                    child: GoogleSignInButton(
                      onPressed: () {/* ... */},
                      splashColor: Colors.white,
                      darkMode: true, // default: false
                      borderRadius: 10.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: FacebookSignInButton(
                      onPressed: () {},
                      borderRadius: 10.0,
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Material(
                  //       borderRadius: BorderRadius.circular(20.0),
                  //       color: Colors.red.withOpacity(0.8),
                  //       elevation: 0.0,
                  //       child: MaterialButton(
                  //         onPressed: () {
                  //           // handleSignIn();
                  //         },
                  //         minWidth: MediaQuery.of(context).size.width,
                  //         child: Text(
                  //           "Google",
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 18.0),
                  //         ),
                  //       )),
                  // ),
                ],
              ),
            )),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
