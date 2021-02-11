import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../db/users.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  String gender;
  String groupValue = "male";
  bool hidePass = true;
  bool loading = false;

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
                  // ****************Name TextField****************
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.4),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: _nameTextController,
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            icon: Icon(Icons.person_outline),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The Name field can't be Empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),

//**************** Gender Radio Button *********************** */
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Container(
                      color: Colors.white.withOpacity(0.4),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: ListTile(
                            title: Text("male",
                                textAlign: TextAlign.end,
                                style: TextStyle(color: Colors.white)),
                            trailing: Radio(
                                value: "male",
                                groupValue: groupValue,
                                onChanged: (e) => valueChanged(e)),
                          )),
                          Expanded(
                              child: ListTile(
                            title: Text("female",
                                textAlign: TextAlign.end,
                                style: TextStyle(color: Colors.white)),
                            trailing: Radio(
                                value: "female",
                                groupValue: groupValue,
                                onChanged: (e) => valueChanged(e)),
                          )),
                        ],
                      ),
                    ),
                  ),

                  // ****************Email TextField****************
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.4),
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
                      color: Colors.white.withOpacity(0.4),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          title: TextFormField(
                            controller: _passwordTextController,
                            obscureText: hidePass,
                            decoration: InputDecoration(
                              hintText: "Password",
                              icon: Icon(Icons.lock),
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
                          trailing: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  hidePass = false;
                                });
                              }),
                        ),
                      ),
                    ),
                  ),

                  // **************** Confirm Password TextField****************
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.4),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          title: TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: hidePass,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              icon: Icon(Icons.lock_outline),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The Password field can't be Empty";
                              } else if (value.length < 6) {
                                return "The Password has to be at least 6 Chatacters long";
                              } else if (_passwordTextController.text !=
                                  value) {
                                return 'The Password do not match';
                              }
                              return null;
                            },
                          ),
                          trailing: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  hidePass = false;
                                });
                              }),
                        ),
                      ),
                    ),
                  ),

                  // **************** Sign Up Button****************
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.red.shade700,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () async {
                            validateForm();
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        )),
                  ),

                  //*********** Login *****************/
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text('Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ),
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

  // ************ Method for Gender Radio *************
  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  Future validateForm() async {
    FormState formState = _formKey.currentState;

    if (formState.validate()) {
      formState.reset();
      FirebaseUser user = await firebaseAuth.currentUser();
      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
            .then((user) => {
                  _userServices.createUser({
                    "username": _nameTextController.text,
                    "email": _emailTextController.text,
                    "userId": user.user.uid,
                    "gender": gender,
                  })
                })
            .catchError((e) => {print(e.toString())});

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }
}
