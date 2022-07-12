import 'dart:io';


import 'package:animated_radio_buttons/animated_radio_buttons.dart';

// import 'package:country_picker/country_picker.dart'as Country;
import 'package:country_pickers/country.dart';

// import 'package:country_pickers/country.dart';
// import 'package:country_picker/country_picker.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/settings/Generalsettings.dart';
import 'package:projecta_frontend/screens/settings/commons/custom_widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  File? profileImg;
  bool suggestions = false;
  var isPrototypeVar = 0;
  var dob;
  var hintTextStyle = TextStyle(
    color: Colors.grey[400],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: () {})],
      ),
      body: content(),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _accountImage(),
            _accountDetails(),
            _genderNDOB(),
            _location()
          ],
        ),
      ),
    );
  }

  //------------------------------------------------------------- image >>
  Widget _accountImage() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black45,
            // borderRadius: BorderRadius.all(Radius.circular(45.0))
          ),
          // color: Colors.white,
          height: 120,
          width: 120,
          child: profileImg == null
              ? Icon(
                  Icons.person_rounded,
                  size: 55,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(60.0)),
                  child: Image.file(
                    profileImg!,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        Builder(builder: (context) {
          return Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
            child: InkWell(
                onTap: () => selectMedia(context),
                child: Icon(
                  Icons.camera_enhance,
                  size: 30.0,
                )),
          );
        })
      ],
    );
  }

  selectMedia(context) {
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
                onPressed: () => _photoPicker(ImageSource.camera)),
            IconButton(
                icon: Icon(Icons.photo_library),
                onPressed: () => _photoPicker(ImageSource.gallery)),
          ],
        ),
      ],
    )));
  }

  void _photoPicker(ImageSource img) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await ImagePicker.pickImage(source: img);
    if (!mounted) return;
    setState(() => profileImg = File(pickedFile.path));
    print(profileImg);
  }

  //------------------------------------------------------------- textfields >>
  Widget _accountDetails() {
    return Container(
      child: Column(
        children: [
          CustomTextField(
            prefixIcon: Icon(Icons.person),
            suffixText: Icon(Icons.edit),
            readOnly: false,
            maxLines: 1,
            hintText: "Alison Parker",
            hintTextStyle: hintTextStyle,
          ),
          CustomTextField(
            prefixIcon: Icon(Icons.email_outlined),
            suffixText: Icon(Icons.edit),
            readOnly: false,
            maxLines: 1,
            hintText: "Email Address",
            hintTextStyle: hintTextStyle,
          ),
          CustomTextField(
            prefixIcon: Icon(Icons.phone),
            suffixText: Icon(Icons.edit),
            readOnly: false,
            maxLines: 1,
            hintText: "Phone",
            hintTextStyle: hintTextStyle,
          ),
          _isStudentFun(),
          CustomTextField(
            prefixIcon: Icon(Icons.business),
            suffixText: Icon(Icons.edit),
            readOnly: false,
            maxLines: 1,
            hintText: "Organization Name",
            hintTextStyle: hintTextStyle,
          ),
          CustomTextField(
            prefixIcon: Icon(Icons.sticky_note_2_sharp),
            suffixText: Icon(Icons.edit),
            readOnly: false,
            maxLines: 1,
            hintText: "Designation",
            hintTextStyle: hintTextStyle,
          ),
        ],
      ),
    );
  }

  _isStudentFun() {
    return Container(
      child: Row(
        children: [
          Expanded(child: Text("I'm a Student")),
          FlutterSwitch(
            // showOnOff: true,
            value: suggestions,
            activeColor: Colors.green,
            // activeIcon: Icon(Icons.done),
            inactiveColor: Colors.grey[300],
            onToggle: (val) {
              setState(() {
                suggestions = val;
              });
            },
          )
        ],
      ),
    );
  }

  //------------------------------------------------------------- _genderNDOB >>
  Widget _genderNDOB() {
    return Row(
      children: [
        _gender(),
        _dob(),
      ],
    );
  }

  _gender() {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Gender:"),
            FittedBox(
              child: AnimatedRadioButtons(
                // backgroundColor: Colors.yellow[400],
                value: isPrototypeVar,
                layoutAxis: Axis.horizontal,
                buttonRadius: 20.0,
                items: [
                  AnimatedRadioButtonItem(
                      label: "MALE",
                      color: Colors.blue,
                      fillInColor: Colors.white),
                  AnimatedRadioButtonItem(
                      label: "FEMALE",
                      color: Colors.blue,
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
      ),
    );
  }

  _dob() {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Date of Birth:"),
            Container(
              width: 200.0,
              child: DateTimePicker(
                initialValue: '',
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                // dateLabelText: 'Date',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    dob = val;
                  });
                  print(val);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  //------------------------------------------------------------- _location >>
  _location() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountryPickerDropdown(
            initialValue: 'AR',
            itemBuilder: _buildDropdownItem,
            onValuePicked: (Country country) {
              print("${country.name}");
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Andheri, Mumbai"),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
        child: CountryPickerUtils.getDefaultFlagImage(country),
      );

// countryPicker(){
//   CountryPickerDropdown(
//     initialValue: 'AR',
//     itemBuilder: _buildDropdownItem,
//     priorityList:[
//       CountryPickerUtils.getCountryByIsoCode('GB'),
//       CountryPickerUtils.getCountryByIsoCode('CN'),
//     ],
//     sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
//     onValuePicked: (Country country) {
//       print("${country.name}");
//     },
//   );
// }
}

// class Account extends StatefulWidget {
//   @override
//   _AccountPage createState() => _AccountPage();
// }
//
// class _AccountPage extends State<Account> {
//   String _name;
//   String _lastname;
//   String _email;
//   String _password;
//   String _contact;
//
//   DateTime selectedDate = DateTime.now();
//
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//
//   Future navigateToGeneralSetting(context) async {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => GeneralSetting()));
//   }
//
//   Widget _buildname() {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: 'Name',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//       ),
//       keyboardType: TextInputType.name,
//       onSaved: (String value) {
//         _name = value;
//       },
//     );
//   }
//
//   Widget _buildlastname() {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: 'Last Name',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//       ),
//       keyboardType: TextInputType.name,
//       onSaved: (String value) {
//         _lastname = value;
//       },
//     );
//   }
//
//   Widget _buildemail() {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: 'Email',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//       ),
//       keyboardType: TextInputType.emailAddress,
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'Email is Required';
//         }
//         if (!RegExp(
//                 r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
//             .hasMatch(value)) {
//           return 'please enter valid email id';
//         }
//         return null;
//       },
//       onSaved: (String value) {
//         _email = value;
//       },
//     );
//   }
//
//   Widget _buildpassword() {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: 'Create Password',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//       ),
//       maxLength: 8,
//       keyboardType: TextInputType.visiblePassword,
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'Password is Required';
//         }
//         if (RegExp(
//                 r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
//             .hasMatch(value)) {
//           return 'please enter valid Password';
//         }
//         return null;
//       },
//       onSaved: (String value) {
//         _password = value;
//       },
//     );
//   }
//
//   Widget _buildcontact() {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: 'Contact Number',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//       ),
//       maxLength: 10,
//       keyboardType: TextInputType.phone,
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'Contact Number is Required';
//         }
//         if (RegExp(
//                 r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
//             .hasMatch(value)) {
//           return 'please enter valid Contact';
//         }
//         return null;
//       },
//       onSaved: (String value) {
//         _contact = value;
//       },
//     );
//   }
//
//   Future<Null> _selectDate(BuildContext context) async {
//     final DateTime picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(1950, 5),
//         lastDate: DateTime(2021));
//
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back_ios),
//         title: Text("My Account"),
//       ),
//       body: Container(
//           margin: EdgeInsets.all(20),
//           child: new SingleChildScrollView(
//             child: Form(
//               key: _formkey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "First Name:",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//
//                   _buildname(),
//                   Text(
//                     "Last Name:",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   _buildlastname(),
//
//                   Text(
//                     "Email id:",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//
//                   _buildemail(),
//                   Text(
//                     "Create Password:",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//
//                   _buildpassword(),
//                   Text(
//                     "Contact No:",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//
//                   _buildcontact(),
// //
//
//                   SizedBox(height: 0.5),
//                   Row(
//                     children: [
//                       Text(
//                         " Country:",
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 1,
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 0, right: 0, top: 0, bottom: 0),
//                         child: Text(
//                           " Gender:",
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 0, right: 0, top: 0, bottom: 0),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 70,
//                               child: Row(
//                                 children: <Widget>[
//                                   Radio(
//                                       value: Colors.blue,
//                                       groupValue: null,
//                                       onChanged: null),
//                                   Text('Other', style: TextStyle(fontSize: 5))
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 0.5),
//                   RaisedButton(
//                     onPressed: () => _selectDate(context),
//                     child: Text(
//                       "Date Of Birth",
//                       style: TextStyle(
//                         color: Colors.lightBlueAccent,
//                         fontSize: 16.0,
//                       ),
//                     ),
//                     color: Colors.white70,
//                   ),
//
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: "${selectedDate.toLocal()}".split(' ')[0],
//                     ),
//                   ),
//
//                   SizedBox(
//                     height: 0,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 0, right: 0, top: 10, bottom: 10),
//                         child: Text(
//                           "Verify By:",
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 0, right: 0, top: 10, bottom: 10),
//                         child: ToggleSwitch(
//                           minWidth: 89.4,
//                           cornerRadius: 20.0,
//                           activeBgColor: Colors.cyan,
//                           activeFgColor: Colors.white,
//                           inactiveBgColor: Colors.grey,
//                           inactiveFgColor: Colors.white,
//                           labels: ['Phone', 'Email'],
//                           onToggle: (index) {
//                             print('switched to: $index');
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 0),
//                   RaisedButton(
//                     child: Text(
//                       "Submit",
//                       style: TextStyle(
//                         color: Colors.lightBlueAccent,
//                         fontSize: 16,
//                       ),
//                     ),
//                     onPressed: () {
//                       if (!_formkey.currentState.validate()) {
//                         return;
//                       } else
//                         navigateToGeneralSetting(context);
//                       _formkey.currentState.save();
//
//                       print(_name);
//                       print(_lastname);
//                       print(_email);
//                       print(_password);
//                       print(_contact);
// //                  print(_date);
// //                  print(_country);
// //                  print(_gender);
// //                  print(_toggle);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
// }
