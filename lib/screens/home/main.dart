import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/autenticate/login.dart';
import 'package:projecta_frontend/screens/home/drawer.dart';
// import 'package:projecta_frontend/screens/seekerScreens/post/Idea/searchIdea.dart';
// import 'package:projecta_frontend/screens/seekerScreens/post/blog.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:projecta_frontend/screens/seekerScreens/post/feed.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import '../settings/Settings.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  SharedPreferences? sharedPreferences;
  Animation<double>? _animation;
  late AnimationController _animationController;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Network',
      style: optionStyle,
    ),
    Text(
      'Index 2: Message',
      style: optionStyle,
    ),
    Text(
      'Index 3: Jobs Page',
      style: optionStyle,
    ),
  ];

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Stack(children: [
          Positioned(
              top: 0,
              right: 15,
              child: Container(
                width: 300,
                child: Dialog(
                    child: Column(
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) => Settings()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            size: 25,
                          ),
                          Text("Settings")
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        sharedPreferences?.clear();
                        //sharedPreferences.commit();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) => Login()),
                            (Route<dynamic> route) => false);
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.login_outlined),
                          Text("Logout")
                        ],
                      ),
                    ),
                  ],
                )),
              )),
        ]);
      },
    );
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences?.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Login()),
          (Route<dynamic> route) => false);
    }
  }

  Future navigateToFeedPost(context) async {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => FeedPost()));
  }

  Future navigateToBlogPost(context) async {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => BlogPost()));
  }

  Future navigateToSearchIdea(context) async {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => SearchIdea()));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //title: Text('Home Page', style: TextStyle(color: Colors.white)),
        // actions: <Widget>[
        //   FlatButton(
        //     onPressed: () {
        //       sharedPreferences.clear();
        //       sharedPreferences.commit();
        //       Navigator.of(context).pushAndRemoveUntil(
        //           MaterialPageRoute(builder: (BuildContext context) => Login()),
        //           (Route<dynamic> route) => false);
        //     },
        //     child: Text("Log Out", style: TextStyle(color: Colors.white)),
        //   ),
        // ],

        actions: [
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.black,
                size: 30.0,
              ),
              onPressed: () {
                _showMyDialog();
              })
        ],
        title: Container(
          height: 42,
          child: TextField(
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(15.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[700]),
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white70),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionBubble(
        backGroundColor: Colors.redAccent,
        iconData: Icons.add,
        items: <Bubble>[
          Bubble(
            title: "Idea",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.highlight,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              navigateToSearchIdea(context);
            },
          ),
          // Floating action menu item
          Bubble(
            title: "Blog",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.article_rounded,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              navigateToBlogPost(context);
            },
          ),
          //Floating action menu item
          Bubble(
            title: "Feed",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.rss_feed,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              navigateToFeedPost(context);
            },
          ),
        ],
        animation: _animation!,

        // On pressed change animation state
        onPress: _animationController.isCompleted
            ? _animationController.reverse
            : _animationController.forward,

        // Floating Action button Icon color
        iconColor: Colors.blue,

        // Flaoting Action button Icon
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red[50],
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 12,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_alt_rounded,
              size: 30,
            ),
            label: 'Network',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_travel,
              size: 30,
            ),
            label: 'Jobs',
          ),
        ],
        currentIndex: _selectedIndex,
        //notchedShape: CircularNotchedRectangle(),
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 14),
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
      drawer: MyDrawer(),
    );
  }
}
