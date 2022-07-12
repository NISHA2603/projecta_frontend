import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/settings/commons/custom_widgets.dart';

import '../commons/custom_widgets.dart';


class ConnectionsVisibilityScreen extends StatefulWidget {
  @override
  _ConnectionsVisibilityScreenState createState() => _ConnectionsVisibilityScreenState();
}

class _ConnectionsVisibilityScreenState extends State<ConnectionsVisibilityScreen> {
  var _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connections Visibility"),
      ),
      body: CommonPrivacyPageWidget(
        title: "Choose who can see your list of connections.",
        body: "Members will be able to see connections, who endorse you and "
            "connections they share with you. (Don't want your endorsement visible ? "
            "Choose to opt out)",
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
