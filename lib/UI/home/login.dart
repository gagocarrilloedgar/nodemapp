import 'package:flutter/material.dart';
import 'package:getflutter/components/toggle/gf_toggle.dart';
import 'package:getflutter/getflutter.dart';
import 'package:nodemappweb/Services/Data/res_api.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/Shared/colors.dart';
import 'package:nodemappweb/Shared/not_found.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:nodemappweb/UI/home/mainUI.dart';
import 'package:nodemappweb/UI/home/sigin.dart';
import 'package:nodemappweb/UI/screens/loading.dart';
import 'package:nodemappweb/ViewModels/brandViewModel.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';
//import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>(); // form validation key
  bool _isloading = false;
  bool isCheck = false;
  String email;
  String password;
  String error = ""; // Sigin validation
  RestDataSource restAPI = RestDataSource();
  @override
  Widget build(BuildContext context) {
    //UserMockViewModel _userViewModel = Provider.of<UserMockViewModel>(context);
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    BrandViewModel _brandViewModel = Provider.of<BrandViewModel>(context);
    var screenWidht = MediaQuery.of(context).size.width.toDouble();
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
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      Center(
                        child: logo,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          'Welcome',
                          style: titleFontBig,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          'Please fill the email and password to login',
                          style: subtitleFont,
                        ),
                      ),
                      SizedBox(height: 30),
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
                          obscureText: true,
                          enableSuggestions: true,
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
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GFToggle(
                              onChanged: (bool value) {},
                              value: null,
                              type: GFToggleType.ios,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Remember me',
                              style: subtitleFont,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 120),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'New around here?',
                                  style: subtitleFont,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () => gotoSignIn(context),
                                  child: Text(
                                    'Sign in here',
                                    style: subtitleClickableFont,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: screenWidht * 3 / 4,
                        height: 50,
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                _isloading = true;
                              });
                              var result = await _userViewModel.logInWithEmail(
                                  email, password);
                              if (result == false) {
                                setState(() {
                                  _isloading = false;
                                });
                                print(result.toString());
                                showMyDialog(
                                    context,
                                    NotFound("Sorry",
                                        "We could not find your user. Please try again"));
                              } else {
                                await _brandViewModel.getBrandsFromDB();
                                gotoMain(context);
                                _isloading = false;
                              }
                            }
                          },
                          shape: roundButtonShape,
                          color: turqeusaoscurologo,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Log In',
                                style: roundButtonTextStyle,
                              ),
                              SizedBox(width: screenWidht * 3 / 4 - 100),
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
          );
  }

  Future gotoSignIn(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  Future gotoMain(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MainUI()));
  }
}
