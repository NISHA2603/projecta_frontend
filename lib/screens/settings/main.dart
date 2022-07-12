// import 'package:drawerapp/My%20Accounts.dart';
// import 'package:drawerapp/Settings.dart';
// import 'package:flutter/material.dart';
// import 'pages.dart';
// import 'package:drawerapp/Privacy.dart';
// import 'Change Password.dart';
// import 'General Settings.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   final appTitle = 'Search Job';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: appTitle,
//       home: MyHomePage(),
//     );
//   }
// }

// class Home extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return MyHomePage();
//  }
// }

// class MyHomePage extends State<Home> {
//  int _currentIndex = 0;
//  final List<Widget> _children = [
//    HomeView(),
//    SearchPage(),
//    WorkPage(),
//    ProfilePage(),
//  ];

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        actions: [
//          IconButton(
//              icon: Icon(
//                Icons.person,
//                color: Colors.black,
//                size: 30.0,
//              ),
//              onPressed: () {
//                showDialog(
//                    context: context,
//                    builder: (BuildContext context) {
//                      return Padding(
//                        padding: const EdgeInsets.only(left: 49, bottom: 550),
//                        child: AlertDialog(
//                          content: new ListView(
//                            children: <Widget>[
//                              new Column(
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.only(left: 100),
//                                    child: new DropdownButton<String>(
//                                      items: <String>[
//                                        'Settings',
//                                        'Log Out',
//                                      ].map((String value) {
//                                        return new DropdownMenuItem<String>(
//                                          value: value,
//                                          child: new Text(value),
//                                        );
//                                      }).toList(),
//                                      onChanged: (_) {},
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ],
//                          ),
//                        ),
//                      );
//                    });
//              })
//        ],
//        title: Padding(
//          padding: const EdgeInsets.all(2.0),
//          child: TextField(
//            decoration: new InputDecoration(
//                border: new OutlineInputBorder(
//                  borderRadius: const BorderRadius.all(
//                    const Radius.circular(20.0),
//                  ),
//                ),
//                filled: true,
//                hintStyle: new TextStyle(color: Colors.grey[800]),
//                hintText: "Search Job",
//                prefixIcon: Icon(Icons.search),
//                fillColor: Colors.white70),
//          ),
//        ),
//      ),
//      body: _children[_currentIndex],
//      bottomNavigationBar:
//          BottomNavigationBar(onTap: onTabTapped, currentIndex: 0, items: [
//        BottomNavigationBarItem(
//          icon: new Icon(Icons.home),
//          title: new Text("Home"),
//          backgroundColor: Colors.white70,
//        ),
//        BottomNavigationBarItem(
//          icon: new Icon(Icons.people),
//          title: new Text("Network"),
//          backgroundColor: Colors.lightGreenAccent,
//        ),
//        BottomNavigationBarItem(
//          icon: new Icon(
//            Icons.add_circle_outline,
//            size: 40,
//          ),
//          title: new Text("Add"),
//          backgroundColor: Colors.lightGreenAccent,
//        ),
//        BottomNavigationBarItem(
//          icon: new Icon(Icons.email),
//          title: new Text("Message"),
//          backgroundColor: Colors.lightGreenAccent,
//        ),
//        BottomNavigationBarItem(
//          icon: new Icon(Icons.work),
//          title: new Text("Job"),
//          backgroundColor: Colors.lightGreenAccent,
//        ),
//      ]),
//      drawer: Row(
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: [
//          Drawer(
//            child: ListView(
//              children: <Widget>[
//                ListTile(
//                  trailing: Icon(Icons.backspace),
//                  onTap: () {
//                    Navigator.pop(context);
//                  },
//                ),
//                ListTile(),
//                Divider(
//                  height: 1,
//                  thickness: 0.5,
//                  color: Colors.grey,
//                ),
//                ListTile(
//                  leading: Icon(Icons.person),
//                  title: Text(
//                    'My Portfollio',
//                  ),
//                  onTap: () {
//                    Navigator.pop(context);
//                  },
//                ),
//                Divider(
//                  height: 1,
//                  thickness: 0.5,
//                  color: Colors.grey,
//                ),
//                ListTile(
//                  leading: Icon(Icons.notifications),
//                  title: Text('Notifications'),
//                  onTap: () {
//                    Navigator.pop(context);
//                  },
//                ),
//                Divider(
//                  height: 1,
//                  thickness: 0.5,
//                  color: Colors.grey,
//                ),
//                ListTile(
//                  leading: Icon(Icons.local_activity),
//                  title: Text('Activity log'),
//                  onTap: () {
//                    Navigator.pop(context);
//                  },
//                ),
//                Divider(
//                  height: 1,
//                  thickness: 0.5,
//                  color: Colors.grey,
//                ),
//                ListTile(
//                  leading: Icon(Icons.call_missed_outgoing),
//                  title: Text('Outsource'),
//                  onTap: () {
//                    Navigator.pop(context);
//                  },
//                ),
//                Divider(
//                  height: 1,
//                  thickness: 0.5,
//                  color: Colors.grey,
//                ),
//                ListTile(
//                  leading: Icon(Icons.wb_incandescent),
//                  title: Text('Ideas'),
//                  onTap: () {
//                    Navigator.pop(context);
//                  },
//                ),
//                Divider(
//                  height: 1,
//                  thickness: 0.5,
//                  color: Colors.grey,
//                ),
//                ListTile(
//                  leading: Icon(Icons.save_alt),
//                  title: Text('Saved'),
//                  onTap: () {
//                    Navigator.pop(context);
//                  },
//                ),
//                Divider(
//                  height: 1,
//                  thickness: 0.5,
//                  color: Colors.grey,
//                ),
//                ListTile(
//                  leading: Icon(Icons.help),
//                  title: Text('Help & support'),
//                  onTap: () {
//                    Navigator.pop(context);
//                  },
//                ),
//                Divider(
//                  height: 1,
//                  thickness: 0.5,
//                  color: Colors.grey,
//                ),
//                ListTile(
//                  leading: Icon(Icons.feedback),
//                  title: Text('Feedback'),
//                  onTap: () {
//                    Navigator.pop(context);
//                  },
//                ),
//                Divider(
//                  height: 1,
//                  thickness: 0.5,
//                  color: Colors.grey,
//                ),
//                ListTile(
//                  leading: Icon(Icons.share),
//                  title: Text('Share'),
//                  onTap: () {
//                    Navigator.pop(context);
//                  },
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }

//  void onTabTapped(int index) {
//    setState(() {
//      _currentIndex = index;
//    });
//  }

//  void choiceAction(String choice) {
//    print('Working');
//  }
// }
