import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/settings/commons/custom_widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Mail Us"),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text("help@domain.com",style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),),
                ),
                Text("copy",style: TextStyle(color: Colors.blue),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(child: Text("For faster resolution,reach out to us on ")),
                SizedBox(width: 8.0),
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
            ),
          ),
          SizedBox(height: 20.0),
          _divider(),
          //
          Spacer(),
          Center(
            child: CustomButton(
              height: 30.0,
              title: "Contact Us",
              onPressed: (){},

            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
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
