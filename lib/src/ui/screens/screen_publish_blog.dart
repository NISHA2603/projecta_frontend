import 'dart:async';

import 'package:flutter/material.dart';

class PublishBlogScreen extends StatefulWidget {
  @override
  _PublishBlogScreenState createState() => _PublishBlogScreenState();
}

class _PublishBlogScreenState extends State<PublishBlogScreen> {
  bool enableSearch = false;
  bool checkedValue = false;
  var circularRadius = 12.0;

  // StreamController<List<Results>> _streamController =
  // StreamController<List<Results>>();
  //
  // Stream<List<Results>> get _stream => _streamController.stream;
  //
  // _filter(String searchQuery) {
  //   List<Results> _filteredList = filteredList
  //       .where((Results data) => data.equipmentsName
  //       .toLowerCase()
  //       .contains(searchQuery.toLowerCase()))
  //       .toList();
  //   _streamController.sink.add(_filteredList);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title:
            enableSearch ? _searchTextField() : FittedBox(child: Text("Blogs")),
        actions: [
          IconButton(
              icon: Icon(
                enableSearch ? Icons.clear : Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  if (enableSearch == false) {
                    enableSearch = true;
                  } else {
                    enableSearch = false;
                  }
                });
              }),
          IconButton(
              icon: CircleAvatar(
                  backgroundColor: Colors.green,
                  maxRadius: 30,
                  child: Icon(
                    Icons.person,
                    size: 20,
                  )),
              onPressed: () {})
        ],
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
          _blogHeading(),
          _blogInfo(),
          _blogContent(),
          _sayings(),
          _tagged(),
          _publishedBy(),
          _commentSection(),
          _notify()
        ],
      ),
    );
  }

  _blogHeading() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
      child: Container(
        child: Text(
          "My First Blog",
          style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _blogInfo() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _commonInfoContainer(Icons.person_pin, "Alison Parker"),
              _commonInfoContainer(Icons.access_time, "1 Minute"),
            ],
          ),
          SizedBox(height: 8.0),
          _commonInfoContainer(Icons.calendar_today, "June 4, 2020"),
        ],
      ),
    );
  }

  _blogContent() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      child: Text(
        "I am Alison Parker and like writing reading blogs. "
        "A lot of my friends do it, so i thought of maintaining the legacy.",
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 22.0,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  _sayings() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.person,
              size: 33.0,
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
              child: Text(
            "I hope I keep my readers excited for my new blogs.",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.justify,
          ))
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
            "Alison, Parker, hi, blog, myself, introduction, motivated",
            style: TextStyle(color: Colors.grey[400]),
          )),
        ],
      ),
    );
  }

  _searchTextField() {
    return Container(
//      color: Colors.blue,
//      margin: EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: Colors.white,
        autofocus: true,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
//        controller: searchFieldController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search here",
          hintStyle: TextStyle(color: Colors.white70),
//          prefixIcon: Icon(
//            Icons.search,
//            color: Colors.deepOrangeAccent,
//          ),
        ),
        // onChanged:_filter,
      ),
    );
  }

  _publishedBy() {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 4.0, top: 4.0, left: 8.0, right: 8.0),
      child: Row(
        children: [
          Text("Published by Alison Parker",
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 8.0),
          TextButton(
            onPressed: () {},
            child: Text(
              "View all posts",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  _commentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 4.0),
          child: Text("Leave a Reply -",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Container(
          height: 55.0,
          color: Colors.tealAccent,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    cursorColor: Colors.black,
                    // style: titleTextStyle,
                    // obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: "Comment",
                        fillColor: Colors.white54,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(circularRadius),
                          borderSide: BorderSide(
                              color: Colors.teal,
                              width: 1.0,
                              style: BorderStyle.solid),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(circularRadius),
                          borderSide: BorderSide(
                              color: Colors.teal,
                              width: 1.0,
                              style: BorderStyle.solid),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(circularRadius),
                          borderSide: BorderSide(
                              color: Colors.teal,
                              width: 1.0,
                              style: BorderStyle.solid),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(circularRadius),
                          borderSide: BorderSide(
                              color: Colors.teal,
                              width: 1.0,
                              style: BorderStyle.solid),
                        ),
                        contentPadding:
                            EdgeInsets.fromLTRB(12.0, 4.0, 4.0, 4.0)),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("Post"),
                shape: Border.all(
                    color: Colors.teal, width: 1.0, style: BorderStyle.solid),
              ),
              SizedBox(width: 8.0)
            ],
          ),
        ),
      ],
    );
  }

  _notify() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: CheckboxListTile(
              title: Text("Notify me for new posts"),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue!;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
          )
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
          Text(
            txt,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[400],
                fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
