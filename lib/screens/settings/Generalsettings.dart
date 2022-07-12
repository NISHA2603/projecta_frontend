import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'commons/alerts.dart';

class GeneralSetting extends StatefulWidget {
  @override
  _GeneralSettingState createState() => _GeneralSettingState();
}

class _GeneralSettingState extends State<GeneralSetting> {


  List<String> _status = ["Standard", "Bright Sight", "Dark Theme"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "General Settings",
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.white,
      body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.local_library),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Theme'),
                onTap: () {
                  Alerts().customDialog(
                      dismissOnBackPressed: true,
                      title: "Select Theme",
                      context: context,
                      content: Builder(
                        builder: (context) {
                          String _verticalGroupValue = "";
                          return Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                // color: Colors.red,
                                child: RadioGroup<String>.builder(
                                  direction: Axis.vertical,
                                  groupValue: _verticalGroupValue,
                                  onChanged: (value) => setState(() {
                                    _verticalGroupValue = value!;
                                  }),
                                  items: _status,
                                  itemBuilder: (item) => RadioButtonBuilder(
                                    item,
                                    // textPosition: RadioButtonTextPosition.left,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      ));
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.language),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Language'),
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.my_location),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Privacy'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Push Notifications'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.attach_money),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Paid Membership'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.info),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('About Us'),
                onTap: () {
                  Navigator.pop(context);
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
