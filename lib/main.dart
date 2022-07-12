import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/seekerScreens/my_post/ideas/ideas_navigation.dart';
import 'package:projecta_frontend/screens/settings/Settings.dart';
// import 'file:///D:/Android%20Projs/YouthTechnology/frontend/lib/screens/settings/faq/FAQ.dart';
import 'package:projecta_frontend/screens/settings/privacy/Privacy.dart';

//import 'package:projecta_frontend/screens/wrapper.dart';
//import './screens/autenticate/login.dart';
import './screens/home/main.dart';
// import './screens/seekerScreens/post/feed.dart';

var routes = <String, WidgetBuilder>{
  "/LoginScreen": (BuildContext context) => MainPage(),
  // "/FeedPost": (BuildContext context) => FeedPost(),
};

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false, home: MainPage(), routes: routes));
}
