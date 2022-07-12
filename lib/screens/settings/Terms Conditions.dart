import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Terms & Conditions",
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.white,
      body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Text(
                "We welcome users to register on our digital platforms."
                " We offer the below mentioned registration services"
                " which may be subject to change in the future."
                " All changes will be appended in the terms "
                "and conditions page and communicated to existing users by email.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          )),
    );
  }
}
