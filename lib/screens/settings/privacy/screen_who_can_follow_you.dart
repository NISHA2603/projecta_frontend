import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/settings/commons/custom_widgets.dart';

class WhoCanFollowYouScreen extends StatefulWidget {
  @override
  _WhoCanFollowYouScreenState createState() => _WhoCanFollowYouScreenState();
}

class _WhoCanFollowYouScreenState extends State<WhoCanFollowYouScreen> {
  var _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Who can follow you"),
      ),
      body: CommonPrivacyPageWidget(
        title: "Choose who can follow your updates.",
        body: "Choosing 'Everyone' lets, people outside your network follow your updates.",
        radioBTNLabelA: "Everyone",
        radioValueA: "everyone",
        selectedValue: _selectedValue,
        onChangedA: (everyone){
          setState(
                () => _selectedValue = everyone,
          );
        },
        radioBTNLabelB: "Your Connections",
        radioValueB: "connections",
        onChangedB: (connections){
          setState(
                () => _selectedValue = connections,
          );
        },
        onPressed: (){},
        btnName: "Save",
      ),
    );
  }
}
