import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/settings/commons/custom_widgets.dart';
import 'package:projecta_frontend/screens/settings/faq/profile.dart';
import 'package:projecta_frontend/screens/settings/privacy/screen_contact_us.dart';

class Faqs extends StatefulWidget {
  @override
  _FaqsState createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  var _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.arrow_back_ios),
          title: Text(
            "FAQ",
          ),
          backgroundColor: Colors.lightBlueAccent,
        ),
        backgroundColor: Colors.white,
        body: content());
  }

  Widget content() {
    return Container(
        padding: EdgeInsets.only(right: 20.0, left: 20.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              "What can We Help With You",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Giving us a bit of info now helps move"
                "things along more Quickly",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            _gridMenu(),
            _contactUs(),
            SizedBox(height: 20.0),
          ],
        ));
  }

  _gridMenu() {
    return Container(
      // color: Colors.blue,
      child: GridView.count(
        controller: _scrollController,
        shrinkWrap: true,
        crossAxisCount: 2,
        children: [
          _gridContainer(Icons.settings, "General", () {}),
          _gridContainer(Icons.person_pin, "Profile Verification", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
          }),
          _gridContainer(Icons.work, "jobs", () {}),
          _gridContainer(Icons.attach_money, "Investor", () {}),
          _gridContainer(Icons.note, "Documents", () {}),
          _gridContainer(Icons.card_membership, "Membership", () {}),
          _gridContainer(Icons.computer_sharp, "Collaboration", () {}),
          _gridContainer(Icons.group, "Organization", () {}),
        ],
      ),
    );
  }

  _gridContainer(icon, text, onTap) {
    return Container(
      margin: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.black12, boxShadow: [
        BoxShadow(
          color: Colors.grey[300]!,
        )
      ]),
      child: InkWell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(icon), SizedBox(height: 8.0), Text(text)],
        ),
        onTap: onTap,
      ),
    );
  }

  _contactUs() {
    return Row(
      children: [
        Expanded(child: Text("Still need help?")),
        CustomButton(
          height: 30.0,
          title: "Contact Us",
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactUsScreen()));
          },
        )
      ],
    );
  }
}
