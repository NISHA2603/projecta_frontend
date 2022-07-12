import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/seekerScreens/my_post/commons/common_widgets.dart';


class MyIdeasScreen extends StatefulWidget {
  @override
  _MyIdeasScreenState createState() => _MyIdeasScreenState();
}

class _MyIdeasScreenState extends State<MyIdeasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myIdeasListContent(),
    );
  }

  Widget myIdeasListContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          IdeasListCommonWidget(
            title: "Smart Fridge",
            desc: "IoT based Smart Fridge - A great support for grocery buyers.",
            name: "Employee",
            date: "June 4, 2020",
          ),
        ],
      ),
    );
  }
}
