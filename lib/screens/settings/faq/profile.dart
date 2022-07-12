import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/settings/commons/custom_widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),

      ),
      body: content(),
    );
  }

  Widget content(){
    return Column(
      children: [
        SizedBox(height: 20.0),
        _title(),
        SizedBox(height: 8.0),
        _itemContainer((){},"What is the status of my profile?", CupertinoIcons.chevron_forward),
        _divider(),
        SizedBox(height: 8.0),
        _itemContainer((){},"How much time will it take for profile to get approved?", CupertinoIcons.chevron_forward),
        _divider(),
        SizedBox(height: 8.0),
        _itemContainer((){},"I have once completed the application precess but the app is asking for re-upload of documents?", CupertinoIcons.chevron_forward),
        _divider(),
        SizedBox(height: 8.0),
        _itemContainer((){},"My profile is rejected, when can I re-apply?", CupertinoIcons.chevron_forward),
        _divider(),
        Spacer(),
        _messageUs(),
        SizedBox(height: 12.0),
        _socialBtns(),
        SizedBox(height: 22.0),

      ],
    );
  }

  _title(){
    return Text("Recent Issues and Questions",
    style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold
    ),);
  }

  _itemContainer(onTap,subtitle,icon){
    return ListTile(
      // isThreeLine: true,
      onTap: onTap,
      title: Text(subtitle),
      trailing: Icon(icon,color: Colors.blue,),
    );
  }

  _messageUs(){
    return CustomButton(
      title: "Didn't find your query? Message Us",
    );
  }

  _socialBtns(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(FontAwesome.twitter),radius: 20,
        ),
        SizedBox(width: 8.0),
        CircleAvatar(
          backgroundColor: Color(0xff3b5998),
          child: Icon(FontAwesome.facebook_f),radius: 20,
        ),

      ],
    );
  }

  _divider(){
    return Divider(
      height: 1,
      thickness: 0.5,
      color: Colors.grey,
    );
  }
}
