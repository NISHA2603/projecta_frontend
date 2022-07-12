import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/seekerScreens/my_post/commons/common_widgets.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AllIdeasScreen extends StatefulWidget {
  @override
  _AllIdeasScreenState createState() => _AllIdeasScreenState();
}

class _AllIdeasScreenState extends State<AllIdeasScreen> {
  var _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _sortingTypes(),
            SizedBox(height: 8.0),
            _tags(),
            SizedBox(height: 8.0),
            _list(),
          ],
        ),
      ),
    );
  }

  _sortingTypes() {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            // color: Colors.grey,
            child: CountryPickerDropdown(
              initialValue: 'IN',
              itemBuilder: _buildDropdownItem,
              onValuePicked: (Country country) {
                print("${country.name}");
              },
            ),
          ),
        ),
        Expanded(
          child: PopupMenuButton<String>(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Sort By"),
              Icon(
                Icons.arrow_drop_down,
              )
            ]),

            // icon:
            //   // color: Colors.white,

            onSelected: (result) {
              // popUpMenuNavigation(result);
              // setState(() {
              //   _selection = result;
              // });
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                child: Text('Latest'),
                value: "latest",
              ),
              const PopupMenuItem(
                value: "oldest",
                child: Text('Oldest'),
              ),
              // const PopupMenuItem(
              //   value: "preview",
              //   child: Text('Preview'),
              // ),
              // const PopupMenuItem(
              //   value: "post_setting",
              //   child: Text('Post Setting'),
              // ),
            ],
          ),
          // GestureDetector(
          //   child: Container(
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text("Sort By "),
          //         Icon(Icons.arrow_drop_down)
          //       ],
          //     ),
          //   ),
          //   onTap: (){},
          // ),
        )
      ],
    );
  }

  _tags() {
    return Container(
      child: TextFieldTags(
          initialTags: ['IoT projects', 'Eco Friendly'],
          tagsStyler: TagsStyler(
              tagTextStyle: TextStyle(fontWeight: FontWeight.bold),
              tagDecoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              tagCancelIcon:
                  Icon(Icons.cancel, size: 18.0, color: Colors.blue[900]),
              tagPadding: const EdgeInsets.all(6.0)),
          textFieldStyler: TextFieldStyler(helperText: "", hintText: ""),
          onTag: (tag) {},
          onDelete: (tag) {}),
    );
  }

  _list() {
    return Container(
      child: ListView(
        controller: _scrollController,
        shrinkWrap: true,
        children: [
          IdeasListCommonWidget(
            title: "Home Automation",
            desc: "IoT based Automation of Housing appliances.",
            name: "Johny Jack",
            date: "Jan 20, 2021",
            suggestionsTxt: "3 Suggestions",
          ),
          SizedBox(height: 8.0),
          IdeasListCommonWidget(
            title: "E-waste Recycle India",
            desc: "Keeping environment clean and green.",
            name: "Johny Jack",
            date: "Jan 20, 2021",
            suggestionsTxt: "3 Suggestions",
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
        child: CountryPickerUtils.getDefaultFlagImage(country),
      );
}
