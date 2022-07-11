import 'package:flutter/material.dart';

class IdeaPreviewScreen extends StatefulWidget {
  @override
  _IdeaPreviewScreenState createState() => _IdeaPreviewScreenState();
}

class _IdeaPreviewScreenState extends State<IdeaPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview"),
      ),
      body: content(),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ideaHeading(),
          _tagged(),
          _ideaInfo(),
          _ideaTitle(),
          _ideaContent(),
          _links(),
          _category(),
          _buttons()
        ],
      ),
    );
  }

  _ideaHeading() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
      child: Container(
        child: Text(
          "Smart Fridge",
          style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _ideaInfo() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _commonInfoContainer(Icons.person_pin, "Alison Parker"),
              // _commonInfoContainer(Icons.access_time, "1 Minute"),
            ],
          ),
          // SizedBox(height: 8.0),
          // _commonInfoContainer(Icons.calendar_today, "June 4, 2020"),
        ],
      ),
    );
  }

  _ideaTitle() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      child: Text(
        "IoT based smart fridge- A great support for grocery buyers",
        style: TextStyle(
          fontSize: 22.0,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  _ideaContent() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      child: Text(
        "The proposed idea solves the problem of making list while giving to buy groceries."
        "At present there is no such technology present in market. We are first to do so",
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 18.0,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  _links() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      child: Column(
        children: [
          _commonLinkContainer("Prototype Link:", "http://link"),
          _commonLinkContainer("Patent Link:", "http://link"),
        ],
      ),
    );
  }

  _tagged() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tags:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          SizedBox(width: 8.0),
          Expanded(
              child: Text(
            "Alison, Parker, hi, idea, myself, introduction, motivated",
            style: TextStyle(color: Colors.grey[400]),
          )),
        ],
      ),
    );
  }



  _category() {
    return Padding(
      padding:
      const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
      child: Column(
        children: [
          Text("Category:",
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  _buttons(){
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
      child: Row(
        children: [
          _commonBTN("Suggestions", Icons.bubble_chart_outlined),
          SizedBox(width: 12.0),
          _commonBTN("Message",Icons.messenger),
        ],
      ),
    );
  }

  //---------------------------------------- commons >>
  _commonInfoContainer(icon, txt) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            size: 25,
          ),
          SizedBox(width: 8.0),
          TextButton(
            onPressed: (){},
            child: Text(
              txt,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                  fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }

  _commonLinkContainer(title, link) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          flex: 2,
          child: Text(link,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  decoration: TextDecoration.underline)),
        ),
      ],
    );
  }

  _commonBTN(title,icon){
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue,width: 1.0,style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        child: TextButton.icon(
            onPressed: (){},
            icon:Icon(icon), label: Text(title)),
      ),
    );
  }
}
