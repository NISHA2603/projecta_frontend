import 'dart:io';

import 'package:animated_radio_buttons/animated_radio_buttons.dart';
// import 'package:documents_picker/documents_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projecta_frontend/src/ui/commons/custom_containers.dart';
import 'package:projecta_frontend/src/ui/screens/screen_idea_preview.dart';
import 'package:projecta_frontend/src/ui/screens/screen_success.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:video_box/video_box.dart';
import 'package:path/path.dart' as basename;

class PostIdeaScreen extends StatefulWidget {
  @override
  _PostIdeaScreenState createState() => _PostIdeaScreenState();
}

class _PostIdeaScreenState extends State<PostIdeaScreen> {
  List _selectItem = [];
  var _scrollController = ScrollController();
  Map<String, dynamic> _checkboxEntries = {
    "checkboxBody": [
      {"checkbox_id": "1", "checkbox_name": "Open for investors"},
      {"checkbox_id": "2", "checkbox_name": "Open for collaboration"},
      {"checkbox_id": "3", "checkbox_name": "Sell Idea"}
    ],
  };
  var budgetTextStyle = TextStyle(
    fontSize: 14.0,
    color: Colors.black,
  );
  List<String> _departments = ["Category"]; // Option 2
  String? _selectedDepartment;
  var isPrototypeVar = 0;
  var isPatentVar = 0;
  var budgetTextContentPadding = EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post your Idea"),
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),
      body: content(),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IdeaDetails(),
            SizedBox(height: 8.0),
            AttachmentsToolbar(),
            SizedBox(height: 8.0),
            _ideaOpenFor(),
            SizedBox(height: 8.0),
            _budget(),
            SizedBox(height: 8.0),
            _department(),
            SizedBox(height: 8.0),
            _isPrototype(),
            SizedBox(height: 8.0),
            _patentDetails(),
            SizedBox(height: 8.0),
            _buttons(),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }

// -------------------------------------------------------- _ideaOpenFor >>
  _ideaOpenFor() {
    return ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: _checkboxEntries['checkboxBody'].length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            value: _selectItem.contains(
                _checkboxEntries['checkboxBody'][index]['checkbox_id']),
            onChanged: (bool? selected) {
              _onCheckboxSelected(selected!,
                  _checkboxEntries['checkboxBody'][index]['checkbox_id']);
            },
            controlAffinity: ListTileControlAffinity.leading,
            title:
                Text(_checkboxEntries['checkboxBody'][index]['checkbox_name']),
          );
        });
  }

  void _onCheckboxSelected(bool selected, checkboxID) {
    if (selected == true) {
      setState(() {
        _selectItem.add(checkboxID);
      });
    } else {
      setState(() {
        _selectItem.remove(checkboxID);
      });
    }
  }

  Widget checkboxTileContainer(title, checkedValue) {
    return CheckboxListTile(
      title: Text(title),
      value: checkedValue,
      onChanged: (newValue) {
        setState(() {
          checkedValue = newValue;
        });
      },
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );
  }

  _budget() {
    return CustomTextField(
      style: budgetTextStyle,
      height: 60.0,
      hintText: "Enter budget in range (in rupee)",
      maxLines: 1,
      readOnly: false,
      contentPadding: budgetTextContentPadding,
      prefixIcon: Icon(FontAwesome.rupee),
    );
  }

  //--------------------------------------------------------- department >>
  _department() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Department:"),
        Container(
          height: 30.0,
          padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(
                  color: Colors.blue, width: 1.0, style: BorderStyle.solid)),
          child: DropdownButton(
            // isExpanded: true,
            hint: Text("Category"),
            underline: DropdownButtonHideUnderline(child: Container()),
            value: _selectedDepartment,
            onChanged: (String? newValue) {
              setState(() {
                _selectedDepartment = newValue;
              });
            },
            items: _departments.map((department) {
              return DropdownMenuItem(
                child: new Text(department),
                value: department,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  //-------------------------------------------------------- isPrototype >>
  _isPrototype() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text("Do you have a working prototype?")),
            Expanded(
              child: AnimatedRadioButtons(
                // backgroundColor: Colors.yellow[400],
                value: isPrototypeVar,
                layoutAxis: Axis.horizontal,
                buttonRadius: 20.0,
                items: [
                  AnimatedRadioButtonItem(
                      label: "YES",
                      color: Colors.green,
                      fillInColor: Colors.white),
                  AnimatedRadioButtonItem(
                      label: "NO",
                      color: Colors.red,
                      fillInColor: Colors.white),
                ],
                onChanged: (value) {
                  setState(() {
                    isPrototypeVar = value;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        CustomTextField(
          // style: budgetTextStyle,
          height: 100.0,
          hintText: "Add Description or link as applicable",
          maxLines: 22,
          readOnly: false,
          // contentPadding: budgetTextContentPadding,
          // prefixIcon: Icon(FontAwesome.rupee),
        )
      ],
    );
  }

  //-------------------------------------------------------- isPatent >>
  _patentDetails() {
    return Column(
      children: [_isPatent(), SizedBox(height: 8.0), _patentInfo()],
    );
  }

  _isPatent() {
    return Row(
      children: [
        Text("Do you have a patent?"),
        Expanded(
          child: AnimatedRadioButtons(
            // backgroundColor: Colors.yellow[400],
            value: isPatentVar,
            layoutAxis: Axis.horizontal,
            buttonRadius: 20.0,
            items: [
              AnimatedRadioButtonItem(
                  label: "YES", color: Colors.green, fillInColor: Colors.white),
              AnimatedRadioButtonItem(
                  label: "NO", color: Colors.red, fillInColor: Colors.white),
            ],
            onChanged: (value) {
              setState(() {
                isPatentVar = value;
              });
            },
          ),
        ),
      ],
    );
  }

  _patentInfo() {
    return Column(
      children: [
        CustomTextField(
          // style: style,
          height: 60.0,
          hintText: "Patent No.",
          maxLines: 1,
          readOnly: false,
          // contentPadding: contentPadding,
        ),
        SizedBox(height: 8.0),
        CustomTextField(
          // style: style,
          height: 60.0,
          hintText: "Serial No.",
          maxLines: 1,
          readOnly: false,
          // contentPadding: contentPadding,
        ),
        SizedBox(height: 8.0),
        CustomTextField(
          // style: style,
          height: 60.0,
          hintText: "Patent SoftCopy",
          maxLines: 1,
          readOnly: false,
          // contentPadding: contentPadding,
        ),
      ],
    );
  }

  _buttons() {
    return Row(
      children: [
        Spacer(),
        Expanded(
          flex: 4,
          child: CustomButton(
            height: 35.0,
            title: "Preview",
            onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) => IdeaPreviewScreen())),
          ),
        ),
        Spacer(),
        Expanded(
          flex: 4,
          child: CustomButton(
              height: 35.0,
              title: "Submit",
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) => SuccessScreen()))),
        ),
        Spacer(),
      ],
    );
  }
}

class IdeaDetails extends StatelessWidget {
  final style = TextStyle(
    fontSize: 14.0,
    color: Colors.black,
  );

  final contentPadding = EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            style: style,
            height: 40.0,
            hintText: "Name Your Idea",
            maxLines: 1,
            readOnly: false,
            contentPadding: contentPadding,
          ),
          SizedBox(height: 8.0),
          Text("One Line Description:"),
          CustomTextField(
            style: style,
            height: 40.0,
            hintText: "This will be displayed to users",
            maxLines: 1,
            readOnly: false,
            contentPadding: contentPadding,
          ),
          SizedBox(height: 8.0),
          CustomTextField(
            style: style,
            height: 40.0,
            hintText: "Tags",
            maxLines: 1,
            readOnly: false,
            contentPadding: contentPadding,
          ),
          SizedBox(height: 8.0),
          CustomTextField(
            style: style,
            height: 100.0,
            hintText:
                "What problems are you solving & how is it different from existing?",
            maxLines: 5,
            readOnly: false,
            contentPadding: contentPadding,
          ),
        ],
      ),
    );
  }
}

//---------------------------------------------------------- attachments >>
class AttachmentsToolbar extends StatefulWidget {
  @override
  _AttachmentsToolbarState createState() => _AttachmentsToolbarState();
}

class _AttachmentsToolbarState extends State<AttachmentsToolbar> {
  List<Asset> images = <Asset>[];
  File? _video;
  File? document;
  List<String>? docPaths;
  ScrollController _scrollController = ScrollController();
  VideoPlayerController? _videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          height: 55.0,
          child: attachments(),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: Row(
            children: [
              _video != null ? showSelectedVideo() : Container(),
              images == null || images.isEmpty ? Container() : _getPhotos()
            ],
          ),
        ),
        docPaths != null
            ? docPaths!.isEmpty
                ? Container()
                : showSelectedDocument()
            : Container()
      ],
    );
  }

  attachments() {
    return Builder(builder: (context) {
      return Container(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Text(
              "ATTACHMENTS:",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            IconButton(
                icon: Icon(
                  Icons.photo_library_sharp,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Scaffold.of(context).showSnackBar(SnackBar(content: Text("Processing ...")));
                  _multiImagePicker();
                }),
            IconButton(
                icon: Icon(
                  Icons.videocam,
                  color: Colors.white,
                ),
                onPressed: () {
                  // _pickVideo();
                  _selectMedia(context);
                }),
            IconButton(
                icon: Icon(
                  Icons.sticky_note_2_sharp,
                  color: Colors.white,
                ),
                onPressed: () {
                  // _pickDocument()
                }
            ),
            // Container(
            //   // width: 50,
            //   child: PopupMenuButton<String>(
            //     icon: Icon(
            //       Icons.more_vert,
            //       color: Colors.white,
            //     ),
            //     onSelected: (result) {
            //       popUpMenuNavigation(result);
            //       // setState(() {
            //       //   _selection = result;
            //       // });
            //     },
            //     itemBuilder: (BuildContext context) => [
            //       const PopupMenuItem(
            //         child: Text('Tags'),
            //         value: "tags",
            //       ),
            //       const PopupMenuItem(
            //         value: "save",
            //         child: Text('Save'),
            //       ),
            //       const PopupMenuItem(
            //         value: "preview",
            //         child: Text('Preview'),
            //       ),
            //       const PopupMenuItem(
            //         value: "post_setting",
            //         child: Text('Post Setting'),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      );
    });
  }

  _selectMedia(BuildContext context) {
    return Scaffold.of(context).showSnackBar(SnackBar(
        content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Select from"),
        Row(
          children: [
            IconButton(
                icon: Icon(Icons.camera),
                onPressed: () => _pickVideo(ImageSource.camera)),
            IconButton(
                icon: Icon(Icons.photo_library),
                onPressed: () => _pickVideo(ImageSource.gallery)),
          ],
        ),
      ],
    )));
  }

  _getPhotos() {
    return Container(
      height: 100.0,
      // color: Colors.cyanAccent,
      child: ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return showSelectedImage(index);
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  showSelectedImage(int index) {
//    File file = File(images[index]);
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            child: AssetThumb(
              asset: images[index],
              width: 80,
              height: 85,
            ),
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(top: 4.0, right: 1.0, bottom: 8.0, left: 10.0),
          width: 80.0,
          height: 85.0,
//          color: Colors.red,
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                setState(() {
//                  imageList.removeAt(index);
                  images.removeAt(index);
                });

                print(index);
              },
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Icon(
                  Icons.clear,
                  size: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  showSelectedVideo() {
//    File file = File(images[index]);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              border: Border.all(
                  color: Colors.white70, style: BorderStyle.solid, width: 1.0)),
          width: 80,
          height: 85,
          margin: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            child: AspectRatio(
              aspectRatio: _videoPlayerController!.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController!),
            ),
            // AssetThumb(
            //   asset: videos[index],
            //   width: 80,
            //   height: 85,
            // ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 4.0, right: 1.0, bottom: 8.0, left: 8.0),
          width: 80.0,
          height: 85.0,
          color: Colors.black26,
          child: Icon(
            Icons.play_arrow_rounded,
            color: Colors.white70,
            size: 35,
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(top: 4.0, right: 1.0, bottom: 8.0, left: 10.0),
          width: 80.0,
          height: 85.0,
//          color: Colors.red,
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _video = null;
//                  imageList.removeAt(index);
//                   videos.removeAt(index);
                });

                // print(index);
              },
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Icon(
                  Icons.clear,
                  size: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  showSelectedDocument() {
    var base = basename.basename(docPaths!.first);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        child: ListTile(
          tileColor: Colors.white70,
          title: Text(base ??= ""),
          subtitle: Text(
            docPaths!.first,
            style: TextStyle(fontSize: 9.5),
          ),
        ),
      ),
    );
  }

  void _multiImagePicker() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Dectected';

    print("inside multi picker ");
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          statusBarColor: "#ffe77726",
          actionBarColor: "#ffe77726",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
//    if (!mounted) return;

    setState(() {
      images = resultList;
//      _error = error;
      print("inside multi picker error $error");
    });
  }

  _pickVideo(ImageSource src) async {
    final _picker = ImagePicker();
    PickedFile? video = await _picker.getVideo(source: ImageSource.gallery);
    _video = File(video!.path);
    _videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {});
        // _videoPlayerController.play();
      });
  }

  // void _pickDocument() async {
  //   docPaths = await DocumentsPicker.pickDocuments;
  //   print("document >> $docPaths");
  //
  //   if (!mounted) return;
  //   setState(() {});
  // }
}
