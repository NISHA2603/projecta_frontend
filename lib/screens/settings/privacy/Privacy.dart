import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/settings/privacy/screen_change_password.dart';
import 'package:projecta_frontend/screens/settings/privacy/screen_close_account.dart';
import 'package:projecta_frontend/screens/settings/privacy/screen_connections_visibility.dart';
import 'package:projecta_frontend/screens/settings/privacy/screen_who_can_follow_you.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  var isVisible= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Privacy",
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.white,
      body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text(
                  'Change Password',
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen()));
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                trailing: FlutterSwitch(
                  valueFontSize: 16.0,
                  width: 100,
                  // height: ,
                  activeText: "Private",
                  inactiveText: "Public",
                  showOnOff: true,
                  value: isVisible,
                  activeColor: Colors.green,
                  // activeIcon: Icon(Icons.done),
                  inactiveColor: Colors.grey[300],
                  onToggle: (val) {
                    setState(() {
                      isVisible = val;
                    });
                  },
                ),
                title: Text('Profile Visibility'),

                onTap: () {
                  // Navigator.pop(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Who Can Follow You'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WhoCanFollowYouScreen()));
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Who can see your connections'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConnectionsVisibilityScreen()));
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Close Accounts'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CloseAccountScreen()));
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
            ],
          )),
    );
  }
}
