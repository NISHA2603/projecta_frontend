import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projecta_frontend/src/ui/screens/screen_settings.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  var style = TextStyle(
      color: Colors.grey[400], fontSize: 20.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Status"),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) => SettingsScreen())))
        ],
      ),
      body: content(),
    );
  }

  Widget content() {
    return Container(
      // color: Colors.blue,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Wait For Approval",
            style: style,
          ),
          Image.asset(
            "images/check-circle.gif",
            height: 125.0,
            width: 125.0,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("This usually takes an hour or two."),
                Text("You will be notified after the"),
                Text("Verification is done"),
              ],
            ),
          ),
          Text(
            "Your Idea is sent for Approval.",
            style: style,
          ),
        ],
      ),
    );
  }
}
