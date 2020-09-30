import 'package:flutter/material.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/Shared/colors.dart';
import 'package:nodemappweb/Shared/not_found.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/UI/home/mainUI.dart';
import 'package:nodemappweb/UI/screens/loading.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>(); // form validation key

  bool _isloading = false;
  String email = "";
  String name = "";
  String phone = "";
  String password = "";
  String error = ""; // Sigin validation

  @override
  Widget build(BuildContext context) {
    var screenWidht = MediaQuery.of(context).size.width;
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    return _isloading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: linearGradiengBox,
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: 400,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 50),
                        Center(
                          child: logo,
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            'Create your account',
                            style: titleFontBig,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Do you already have an account?',
                                    style: subtitleFont,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    gotoLogin(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      'Log In',
                                      style: subtitleClickableFont,
                                    ),
                                  ),
                                )
                              ],
                            )),
                        SizedBox(height: 30),
                        Container(
                          width: screenWidht * 3 / 4,
                          height: 50,
                          child: TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Name'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter your name' : null,
                            onChanged: (val) {
                              setState(() {
                                name = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: screenWidht * 3 / 4,
                          height: 50,
                          child: TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'email'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter an Email' : null,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: screenWidht * 3 / 4,
                          height: 50,
                          child: TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Phone'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter your phone' : null,
                            onChanged: (val) {
                              setState(() {
                                phone = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: screenWidht * 3 / 4,
                          height: 50,
                          child: TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password'),
                            validator: (val) => val.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 70.0,
                        ),
                        Container(
                          width: screenWidht * 3 / 4,
                          height: 50,
                          child: RaisedButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  _isloading = true;
                                });
                                var result = await _userViewModel.signInWithEmail(
                                    name, email, phone, password);
                                if (result == false) {
                                  setState(() {
                                    _isloading = false;
                                  });
                                  error =
                                      "Some error occurd while trying to create your account. Please try later"; // changing error state if fireabse can register the email

                                  showMyDialog(context, NotFound("Sorry", error));
                                } else {
                                  setState(() {
                                    _isloading = false;
                                  });
                                  gotoMain(context);
                                }
                              }
                            },
                            shape: roundButtonShape,
                            color: turqeusaoscurologo,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Create account',
                                  style: roundButtonTextStyle,
                                ),
                                SizedBox(width: screenWidht * 3 / 4 - 175),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Future gotoLogin(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  Future gotoMain(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MainUI()));
  }
}
