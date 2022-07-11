import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool suggestions = false;
  bool directMsgs = false;
  String? suggestionsValue;
  String? directMsgsValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Setting"),
        actions: [
          IconButton(tooltip: "SAVE", icon: Icon(Icons.save), onPressed: () {})
        ],
      ),
      body: content(),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          listHeading("Post Setting"),
          ListTile(
            title: Text("Suggestions"),
            subtitle: Text(suggestions?"ON":"OFF"),
            trailing: FlutterSwitch(
              showOnOff: true,
              value: suggestions,
              activeColor: Colors.green,
              activeIcon: Icon(Icons.done),
              inactiveColor: Colors.grey[300]!,
              onToggle: (val) {
                setState(() {
                  suggestions = val;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Suggestions"),
            subtitle: Text(directMsgs?"ON":"OFF"),
            trailing: FlutterSwitch(
              showOnOff: true,
              activeColor: Colors.green,
              activeIcon: Icon(Icons.done),
              inactiveColor: Colors.grey[300]!,

              value: directMsgs,
              onToggle: (val) {
                setState(() {
                  directMsgs = val;
                });
              },
            ),
          ),
          // listItem("Suggestions", suggestions?"ON":"OFF", suggestions),
          // listItem("Allow Direct Messege", directMsgs?"ON":"OFF", directMsgs),
          divider(),
          SizedBox(height: 8.0),
          listHeading("More Options")
        ],
      ),
    );
  }

  Widget listItem(title, subtitle, bool status) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: FlutterSwitch(
        value: status,
        onToggle: (val) {
          setState(() {
            status = val;
          });
        },
      ),
    );
  }

  Widget listHeading(heading) {
    return Container(
      child: Text(
        heading,
        style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20.0),
      ),
    );
  }

  Widget divider() {
    return Divider(
      color: Colors.grey[300],
      height: 0.5,
      thickness: 0.5,
    );
  }
}
