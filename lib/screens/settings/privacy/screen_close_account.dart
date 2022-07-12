import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/settings/commons/custom_widgets.dart';

class CloseAccountScreen extends StatefulWidget {
  @override
  _CloseAccountScreenState createState() => _CloseAccountScreenState();
}

class _CloseAccountScreenState extends State<CloseAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Who can follow you"),
      ),
      body: CommonPrivacyPageWidget(
        title: "Alison, We're sorry to see you go.",
        body: "All the data related to this account will be deleted permanently",
          optionalText:"This action will delete your account permanently",
        // radioBTNLabelA: "Everyone",
        // radioValueA: "everyone",
        // selectedValue: _selectedValue,
        // onChangedA: (everyone){
        //   setState(
        //         () => _selectedValue = everyone,
        //   );
        // },
        // radioBTNLabelB: "Your Connections",
        // radioValueB: "connections",
        // onChangedB: (connections){
        //   setState(
        //         () => _selectedValue = connections,
        //   );
        // },
        onPressed: (){},
        btnName: "Continue",
      ),
    );
  }
}
