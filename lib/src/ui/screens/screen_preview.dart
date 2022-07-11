import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Text("Edit"),
            onPressed: () {},
          ),
          IconButton(
            icon: FittedBox(child: Text("Publish")),
            onPressed: () {},
          ),
          // Text("Publish"),
        ],
      ),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [_blogHeading(), _blogContent(), _sayings(), _tagged()],
    );
  }

  _blogHeading() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
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

  _blogContent() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
      padding: const EdgeInsets.all(20.0),
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
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tagged:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          SizedBox(width: 8.0),
          Expanded(
              child: Text(
                  "Alison, Parker, hi, blog, myself, introduction, motivated")),
        ],
      ),
    );
  }
}
