import 'package:flutter/material.dart';

class PostSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Setting"),
        actions: [
          IconButton(
              tooltip: "SAVE",
              icon: Icon(Icons.save), onPressed: (){

        })],
      ),
      body: content(),
    );
  }

  Widget content(){
    return Container(
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 12.0,),
            listHeading("Publish"),
           listItem("Status", "Draft"),
            divider(),
           listItem("Publish", "Immediately"),
            divider(),
            SizedBox(height: 12.0,),
            listHeading("More Options"),
           listItem("Post Format", "Standard"),
            divider(),
           listItem("Excerpt", "Not Set"),
            divider(),
           listItem("Slug", "Not Set"),
            divider()
          ],
        ),
      ),
    );
  }

  Widget listItem(title,subtitle){
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),

    );
  }

  Widget listHeading(heading){
    return Container(
      child: Text(heading,
      style: TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
    ); 
  }

  Widget divider(){
    return Divider(
      color: Colors.grey[300],
      height: 0.5,
      thickness: 0.5,
    );
  }
}
