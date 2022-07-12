import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/seekerScreens/my_post/ideas/ideas_navigation.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                trailing: Icon(Icons.backspace),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'My Portfollio',
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.local_activity),
                title: Text('Activity log'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.call_missed_outgoing),
                title: Text('Outsource'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ExpansionTile(
                leading: Icon(Icons.post_add),
                title: Text("My Posts"),
                backgroundColor: Colors.black12,
                childrenPadding: EdgeInsets.only(left: 12.0),
                children: [
                  ListTile(
                    leading: Icon(Icons.dynamic_feed),
                    title: Text('Feed'),
                    onTap: () {
                      // Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.speaker_notes),
                    title: Text('Blog'),
                    onTap: () {
                      // Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.bubble_chart_outlined),
                    title: Text('Idea'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IdeasNavigation()));
                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.save_alt),
                title: Text('Saved'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help & support'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text('Feedback'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
