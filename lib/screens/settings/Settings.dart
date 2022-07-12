import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/settings/screen_my_account.dart';
import './Generalsettings.dart';
import './screen_my_account.dart';
import 'privacy/Privacy.dart';
import './Terms Conditions.dart';
import 'faq/FAQ.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

Future navigateToGeneralSetting(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => GeneralSetting()));
}

Future navigateToAccounts(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccountScreen()));
}

Future navigateToPrivacy(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Privacy()));
}

Future navigateToTerms(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Terms()));
}

Future navigateToFaqs(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Faqs()));
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Settings",
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.white,
      body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text(
                  'General Settings',
                ),
                onTap: () {
                  navigateToGeneralSetting(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Accounts'),
                onTap: () {
                  navigateToAccounts(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.security),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Privacy'),
                onTap: () {
                  navigateToPrivacy(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.question_answer),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Terms & Conditions'),
                onTap: () {
                  navigateToTerms(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.help),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('FAQ'),
                onTap: () {
                  navigateToFaqs(context);
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
