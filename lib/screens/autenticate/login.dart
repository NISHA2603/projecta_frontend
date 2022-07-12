import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/home/main.dart';
import 'package:projecta_frontend/shared/loading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'landing.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email;
  String? password;
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  signIn(String email, String password) async {
    setState(() {
      _isLoading = true;
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': password};
    var jsonResponse;
    var response = await http.post(
        Uri.parse("https://projecta-bugdroid-v01.herokuapp.com/api/login/"),
        body: data);

    if (response.statusCode == 200) {
      jsonResponse = await json.decode(response.body);

      //print('Howdy, ${jsonResponse['access_token']}!');
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        await sharedPreferences.setString(
            "token", jsonResponse['access_token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => MainPage()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      await displayDialog();
    }
  }

  Future displayDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You Have Entered Wrong Credentials'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              backgroundColor: Colors.blue[300],
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              FloatingActionButton(
                                mini: true,
                                onPressed: () {},
                                child: Icon(Icons.home_filled),
                              ),
                              // SizedBox(width: 15),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  'Job App',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: 8),
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          // Padding(
                          //   padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                          //   // child: Container(
                          //   //   // height: 2,
                          //   //   // width: double.maxFinite,
                          //   //   // color: Colors.white,
                          //   // ),
                          // ),
                          // SizedBox(height: 9),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email id:',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    hintText: "johndoe",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.email_rounded,
                                      color: Colors.blueGrey,
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Email is Required';
                                    }
                                    if (!RegExp(
                                            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email Address';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    email = value;
                                  },
                                ),
                                // SizedBox(height: 9),
                                Text(
                                  'Passsword:',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                                 SizedBox(height: 9),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "********",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: const Icon(
                                      Icons.lock_rounded,
                                      color: Colors.blueGrey,
                                    ),
                                    border: new OutlineInputBorder(),
                                  ),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Password is Required';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    password = value;
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlatButton(
                                      textColor: Colors.white,
                                      onPressed: () {},
                                      child: Text(
                                        "forgot pasword?",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(height: 5),
                                Center(
                                  child: OutlineButton(
                                    padding:
                                        EdgeInsets.fromLTRB(130, 15, 130, 15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.white),
                                    onPressed: () async {
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      }
                                      _formKey.currentState?.save();
                                      await signIn(_emailController.text,
                                          _passwordController.text);
                                    },
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.blue[600],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Center(
                                  child: Text(
                                    '-- OR --',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                 SizedBox(height: 5),
                              ],
                            ),
                          ),
                           SizedBox(height: 10),
                        ],
                      ),

                      //bottom area
                      Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Column(
                            children: [
                              Text(
                                'Sign In With',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blue[600],
                                ),
                              ),
                               SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    heroTag: "btn1",
                                    mini: true,
                                    onPressed: () {},
                                    child: Image.asset(
                                      'assets/google.png',
                                      width: 40.0,
                                      height: 40.0,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    heroTag: "btn2",
                                    mini: true,
                                    onPressed: () {},
                                    child: Image.asset(
                                      'assets/linkenid.png',
                                      width: 40.0,
                                      height: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                          // SizedBox(height: 9),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Don\'t have an account?',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blue[600],
                                      ),
                                    ),
                                    FlatButton(
                                      textColor: Colors.white,
                                      onPressed: () {
                                        Navigator.of(context).pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    LandingPage()),
                                            (Route<dynamic> route) => false);
                                      },
                                      child: Text(
                                        "Register",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
