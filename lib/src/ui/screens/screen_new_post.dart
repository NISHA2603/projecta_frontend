import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projecta_frontend/src/business_logic/blocs/blocs.dart';
import 'package:projecta_frontend/src/ui/commons/alerts.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:video_box/video.controller.dart';
import 'package:video_box/video_box.dart';
import 'package:video_player/video_player.dart';
import 'package:zefyr/zefyr.dart';
import 'package:path/path.dart' as basename;

class NewPostScreen extends StatefulWidget {
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  VideoPlayerController? _videoPlayerController;
  List<VideoController> vcs = [];
  ScrollController _scrollController = ScrollController();
  ZefyrController? _textAreaController;
  FocusNode? _focusNode;
  File? _video;

  bool isWritePost = false;
  bool _isOpened = false;
  bool _isBold = false;
  bool _isItalic = false;
  bool _isBullets = false;

  String stylingString = "";
  GlobalKey _key = GlobalKey();

  // var _textAreaController = ZefyrController(document);
  var _textTitleController = TextEditingController();

  // AnimateIconController _animationController;
   Animation<double>? _progress;
  List<Asset> images = <Asset>[];
  List<File> videos = <File>[];
  List<String>? docPaths;
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String? _selectedLocation;
  var circularRadius = 16.0;
  var txtAreaBorderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(18.0),
      bottomRight: Radius.circular(18.0),
      topRight: Radius.circular(8.0),
      topLeft: Radius.circular(8.0));

  TextStyle titleTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    // fontWeight: FontWeight.bold
  );
  TextStyle postTextStyle = TextStyle(
    color: Colors.white,
    // fontSize: 16.0,
    // fontWeight: FontWeight.bold
  );

  List<String> dropdownList = ["Tags", "Save", "Preview", "Post Setting"];

  var _selection;

  @override
  void initState() {
    // _animationController = AnimateIconController();
    // ..addListener(() {
    //   setState(() {});
    // });

    // _progress =
    //     Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    super.initState();
    final document = _loadDocument();
    _textAreaController = ZefyrController(document);
    _focusNode = FocusNode();
  }

  NotusDocument _loadDocument() {
    // For simplicity we hardcode a simple document with one line of text
    // saying "Zefyr Quick Start".
    // (Note that delta must always end with newline.)
    final Delta delta = Delta()..insert("Write a post here\n");
    return NotusDocument.fromDelta(delta);
  }

  @override
  void dispose() {
    for (var vc in vcs) {
      vc.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: ZefyrScaffold(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                customAppBar(),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  child: Column(
                    children: [
                      titleTextField(),
                      SizedBox(height: 12.0),
                      contentTextArea(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPost() {}

  Widget customAppBar() {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0),
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
              onPressed: () => Alerts().customDialog(
                  dismissOnBackPressed: false,
                  title: "Exit!!",
                  titleColor: Colors.red,
                  context: context,
                  content: Text("Exit the Application?"),
                  icon: Icons.report_gmailerrorred_outlined,
                  iconColor: Colors.blue,
                  btnNameA: "No",
                  onTapA: () {
                    Navigator.of(context).pop();
                  },
                  btnNameB: "Yes",
                  onTapB: () => exit(0)),
            ),
            Text("New Post", style: TextStyle(color: Colors.white)),
            Builder(builder: (context) {
              return IconButton(
                icon: Icon(Icons.send_outlined, color: Colors.white),
                onPressed: () async {
                  if (_textTitleController.text == null ||
                      _textTitleController.text.isEmpty) {
                    Scaffold.of(context).showSnackBar(
                        Alerts().customSnackBar("Please enter title", Colors.red));
                  } else if (_textAreaController?.plainTextEditingValue.text ==
                          null ||
                      _textAreaController!.plainTextEditingValue.text.isEmpty) {
                    Scaffold.of(context).showSnackBar(Alerts().customSnackBar(
                        "Post content should not be empty", Colors.red));
                  } else {
                    await EasyLoading.show(
                      status: 'loading...',
                      maskType: EasyLoadingMaskType.black,
                    );
                    print('EasyLoading show');
                    feedBloc.fetchFeed(_textTitleController.text,
                        _textAreaController!.plainTextEditingValue.text);
                    feedBloc.feedStream.listen((event) async {
                      print("event >> ");
                      if (event != null) {
                        await EasyLoading.dismiss();
                      }
                    });
                  }

                  // Alerts().customDialog(
                  //     title: "Done",
                  //     content: Text("Successfully posted!"),
                  //     context: context,
                  //     btnNameA: "HOME",
                  //     onTapA: () {
                  //       Navigator.of(context).pop();
                  //     },
                  //     btnNameB: "VIEW POST",
                  //     onTapB: () {
                  //       Navigator.of(context).pop();
                  //     },
                  //     dismissOnBackPressed: true,
                  //     titleColor: Colors.black,
                  //     icon: Icons.check_circle_rounded,
                  //     iconColor: Colors.green);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget titleTextField() {
    return Container(
      child: TextField(
        controller: _textTitleController,
        cursorColor: Colors.white,
        style: titleTextStyle,
        // obscureText: true,
        decoration: InputDecoration(
          filled: true,
          hintText: "Enter Title",
          fillColor: Colors.white54,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circularRadius),
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circularRadius),
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circularRadius),
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circularRadius),
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget contentTextArea(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2 + 100,
      child: Column(
        children: [
          AnimatedSwitcher(
              duration: Duration(milliseconds: 1000),
              switchInCurve: Curves.bounceInOut,
              child: isWritePost ? textStylingToolBar() : SizedBox.shrink()),
          textArea(context),
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
      ),
    );
  }

  textStylingToolBar() {
    return Container(
      height: 40.0,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(33.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: IconButton(
                  icon: Icon(Icons.format_size_sharp), onPressed: () {})),
          Expanded(
            child: IconButton(
                color: stylingString.contains("bold")
                    ? Colors.amber
                    : Colors.black,
                icon: Icon(Icons.format_bold),
                onPressed: () {
                  setState(() {
                    if (stylingString.contains("bold")) {
                      stylingString = "";
                    } else {
                      stylingString = "bold";
                      // _textAreaKey.currentWidget.
                      // _textAreaController.text.buildTextSpan(
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold
                      //   )
                      // );
                    }
                  });
                  _txtStyling(stylingString);
                }),
          ),
          Expanded(
            child: IconButton(
                color: stylingString.contains("italic")
                    ? Colors.amber
                    : Colors.black,
                icon: Icon(Icons.format_italic),
                onPressed: () {
                  setState(() {
                    if (stylingString.contains("italic")) {
                      stylingString = "";
                    } else {
                      stylingString = "italic";
                    }
                  });
                }),
          ),
          Expanded(
              child: IconButton(
                  icon: Icon(Icons.format_underline), onPressed: () {})),
          Expanded(
            child: IconButton(
                color: stylingString.contains("bullets")
                    ? Colors.amber
                    : Colors.black,
                icon: Icon(Icons.format_list_bulleted),
                onPressed: () {
                  setState(() {
                    if (stylingString.contains("bullets")) {
                      stylingString = "";
                    } else {
                      // if (_textAreaController.text.contains(".")) {}
                      // stylingString = "bullets";
                    }
                  });
                }),
          ),
          Expanded(child: IconButton(icon: Icon(Icons.link), onPressed: () {})),
        ],
      ),
    );
  }

  attachments(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // InkWell(
            //   borderRadius: BorderRadius.all(Radius.circular(22.0)),
            //   onTap: (){
            //     setState(() {
            //       isWritePost=true;
            //     });
            //   },
            //   child: Container(
            //       padding: EdgeInsets.all(8.0),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.all(Radius.circular(22.0)),
            //           color: Colors.white54),
            //       child: Row(
            //         children: [
            //           Icon(Icons.edit_outlined),
            //           SizedBox(width: 8.0),
            //           Text("Write a post"),
            //         ],
            //       ),
            //   ),
            // ),
            // IconButton(icon: Icon(Icons.add,color: Colors.white,), onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.camera_alt,
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
                  _selectMedia(context);
                }),
            IconButton(
                icon: Icon(
                  Icons.sticky_note_2_sharp,
                  color: Colors.white,
                ),
                onPressed: () {}),
            // Container(
            //   // width: 50,
            //   child: PopupMenuButton<String>(
            //     icon: Icon(
            //       Icons.more_vert,
            //       color: Colors.white,
            //     ),
            //     onSelected: (result) {
            //       print("hello");
            //       setState(() {
            //         _selection = result;
            //       });
            //       print(result.toString() + "hello");
            //       // popUpMenuNavigation(result);
            //     },
            //     itemBuilder: (BuildContext context) => [
            //       const PopupMenuItem(
            //         child: Text('Tags'),
            //       ),
            //       const PopupMenuItem(
            //         // value: ,
            //         child: Text('Save'),
            //       ),
            //       const PopupMenuItem(
            //         // value: ,
            //         child: Text('Preview'),
            //       ),
            //       const PopupMenuItem(
            //         // value: ,
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

  textArea(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          //   ZefyrField(
          //   height: 200.0, // set the editor's height
          //   decoration: InputDecoration(
          //       fillColor: Colors.white70,
          //       filled: true,
          //       labelText: 'Description'),
          //   controller: _controller,
          //   focusNode: _focusNode,
          //   autofocus: false,
          //   physics: ClampingScrollPhysics(),
          // ),
          // Container(
          //   height: 150.0,
          //   child: ZefyrEditableText(
          //     padding: EdgeInsets.all(16),
          //     controller: _controller,
          //     focusNode: _focusNode, imageDelegate: null,

          ZefyrField(
            controller: _textAreaController,
            focusNode: _focusNode,
            autofocus: false,
            physics: ClampingScrollPhysics(),
            // textCapitalization: TextCapitalization.sentences,
            // onChanged: (val) {
            // print("on changed");
            // if (val.contains(".")){
            //   var listText=_textAreaController.text.split(".");
            //   var strg= listText.join(".\n");
            //   print(strg);
            //   setState(() {
            //     _textAreaController.text= strg.split(".").join();
            //   });
            //
            //   print(_textAreaController.text);
            //
            // }
            // },

            // key: _textAreaKey,
            // style:
            // TextStyle(
            //     fontStyle: stylingString.contains("italic")
            //         ? FontStyle.italic
            //         : FontStyle.normal,
            //     color: Colors.white,
            //     fontWeight: stylingString.contains("bold")
            //         ? FontWeight.bold
            //         : FontWeight.normal),
            // cursorColor: Colors.white,
            // onTap: () {
            //   setState(() {
            //     isWritePost = true;
            //   });
            // },
            // keyboardType: TextInputType.multiline,
            // maxLines: 25,
            // obscureText: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(16.0, 120.0, 16.0, 10.0),
              filled: true,
              // labelText: "Write a post",
              // hintText: "Write a post",
              alignLabelWithHint: true,
              fillColor: Colors.white54,
              focusedBorder: OutlineInputBorder(
                borderRadius: txtAreaBorderRadius,
                borderSide: BorderSide(
                  style: BorderStyle.none,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: txtAreaBorderRadius,
                borderSide: BorderSide(
                  style: BorderStyle.none,
                  // color: Colors.white,
                  // width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: txtAreaBorderRadius,
                borderSide: BorderSide(
                  style: BorderStyle.none,
                  // color: Colors.white,
                  // width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: txtAreaBorderRadius,
                borderSide: BorderSide(
                  style: BorderStyle.none,
                  // color: Colors.white,
                  // width: 2.0,
                ),
              ),
            ),
          ),
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0))),
            height: 55.0,
            child: attachments(context),
          )
        ],
      ),
    );
  }

  _selectMedia(BuildContext context) {
    return Scaffold.of(context).showSnackBar(
      SnackBar(
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
        ),
      ),
    );
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
          margin: EdgeInsets.only(top: 4.0, right: 1.0, bottom: 1.0, left: 8.0),
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
    PickedFile? video = await _picker.getVideo(source: src);
    _video = File(video!.path);
    _videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {});
        // _videoPlayerController.play();
      });
  }

  void _txtStyling(style) {
    switch (style) {
      case "bold":
        break;
      case "italic":
        break;
      case "bullets":
    }
  }
}
