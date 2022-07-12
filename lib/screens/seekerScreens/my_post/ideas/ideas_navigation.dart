import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/seekerScreens/my_post/commons/common_widgets.dart';
import 'package:projecta_frontend/screens/seekerScreens/my_post/ideas/screen_all_ideas.dart';
import 'package:projecta_frontend/screens/seekerScreens/my_post/ideas/screen_my_ideas.dart';
import 'package:textfield_tags/textfield_tags.dart';

class IdeasNavigation extends StatefulWidget {
  @override
  _IdeasNavigationState createState() => _IdeasNavigationState();
}

class _IdeasNavigationState extends State<IdeasNavigation> {
  bool enableSearch = false;

  List<Widget> tabPages = [AllIdeasScreen(), MyIdeasScreen()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.grey[300],
          child: TabBar(
            indicatorColor: Colors.green,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 5.0,
            tabs: [
              Tab(
                  child: Text(
                "Search Ideas",
                style: TextStyle(color: Colors.black),
              )),
              Tab(
                  child:
                      Text("My Ideas", style: TextStyle(color: Colors.black))),
            ],
          ),
        ),
        appBar: AppBar(
          title: enableSearch
              ? _searchTextField()
              : FittedBox(child: Text("Blogs")),
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
          ],
        ),
        body: TabBarView(
          children: tabPages,
        ),
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
}
