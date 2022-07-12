import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
// import 'package:intl/intl.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../autenticate/login.dart';
import 'package:projecta_frontend/shared/loading.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUp> {
  //String first_name;
  // String last_name;
  String? email;
  String? password;
  String? country;
  // String phone_number;
  // String date_of_birth;
  // String country_code = '+91';
  bool _isLoading = false;
  String gender = 'male';

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text("Job App"),
            ),
            backgroundColor: Colors.blue,
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: SingleChildScrollView(
                    child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "First Name:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: _firstNameController,
                                  decoration: InputDecoration(
                                    hintText: "john",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (String? value) {
                                    if (value!.trim() == null ||
                                        value.trim().length <= 0) {
                                      return 'First Name is Required';
                                    }
                                    if (RegExp(
                                            r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid Name';
                                    }

                                    return null;
                                  },
                                  // onSaved: (String value) {
                                  //   first_name = value.trim();
                                  // },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Last Name:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: _lastNameController,
                                  decoration: InputDecoration(
                                    hintText: "doe",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (String? value) {
                                    if (value!.trim() == null ||
                                        value.trim().length <= 0) {
                                      return 'Last Name is Required';
                                    }
                                    if (RegExp(
                                            r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid Name';
                                    }
                                    return null;
                                  },
                                  // onSaved: (String value) {
                                  //   last_name = value.trim();
                                  // },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Email Id:",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: "johndoe@gmail.com",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                            ),
                            validator: (String? value) {
                              if (value!.trim() == null ||
                                  value.trim().length <= 0) {
                                return 'Email is Required';
                              }
                              if (!RegExp(
                                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(value)) {
                                return 'Please enter a valid email Address';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              email = value!.trim();
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Password:",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "********",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                            ),
                            validator: (String? value) {
                              if (value!.trim() == null ||
                                  value.trim().length <= 0) {
                                return 'Paasword is Required';
                              }
                              if (value.trim().length <= 6) {
                                return 'Paasword should be atleast 6 characters';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              password = value!.trim();
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact Number:",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(flex: 1, child: Icon(Icons.phone)),
                              Expanded(
                                flex: 3,
                                child: TextFormField(
                                  controller: _phoneNumberController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "987654321",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    fillColor: Colors.white,
                                  ),
                                  validator: (String? value) {
                                    if (value!.trim() == null ||
                                        value.trim().length <= 0) {
                                      return 'Phone Number is Required';
                                    }
                                    if (!RegExp(r'\d{10}').hasMatch(value)) {
                                      return 'Please enter only ten digits';
                                    }
                                    return null;
                                  },
                                  // onSaved: (String value) {
                                  //   phone_number = value.trim();
                                  // },
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: CountryCodePicker(
                                  onChanged: (value) {
                                    setState(() {
                                      // country_code = value.dialCode;
                                    });
                                  },
                                  hideMainText: false,
                                  showFlagMain: true,
                                  favorite: ['+91', 'IN'],
                                  showFlag: true,
                                  initialSelection: 'IN',
                                  hideSearch: false,
                                  showCountryOnly: false,
                                  showOnlyCountryWhenClosed: true,
                                  alignLeft: true,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //START RADIO BUTTON
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              "Gender:",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Radio(
                              value: 'male',
                              activeColor: Colors.white,
                              groupValue: gender,
                              onChanged: (String? value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Radio(
                              value: 'female',
                              activeColor: Colors.white,
                              groupValue: gender,
                              onChanged: (String? value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Radio(
                              value: 'other',
                              activeColor: Colors.white,
                              groupValue: gender,
                              onChanged: (String? value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Other",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

//END RADIO BUTTON
                      //END GENDER
                      SizedBox(
                        height: 10,
                      ),
                      //START DOB
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Date Of Birth:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                RaisedButton(
                                  // child: Text(date_of_birth == null
                                  //     ? 'Pick A Date'
                                  //     : date_of_birth.toString()),
                                  onPressed: () {
                                    // showDatePicker(
                                    //         context: context,
                                    //         // initialDate: date_of_birth == null
                                    //         //     ? DateTime.now()
                                    //         //     : date_of_birth,
                                    //         firstDate: DateTime(1940),
                                    //         lastDate: DateTime(2021))
                                    //     .then((date) {
                                    //   setState(() {
                                    //     final DateFormat formatter =
                                    //         DateFormat('yyyy-MM-dd');
                                    //     final String formatted =
                                    //         formatter.format(date);

                                    //     date_of_birth = formatted;
                                    //   });
                                    // });
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //END DOB
                      SizedBox(
                        height: 10,
                      ),
                      //START VERIFY BY
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Verify By:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                ToggleSwitch(
                                  minWidth: 89.4,
                                  cornerRadius: 20.0,
                                  activeBgColor: Colors.cyan,
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  labels: ['Phone', 'Email'],
                                  onToggle: (index) {
                                    print('switched to: $index');
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //END VERIFY BY
                      SizedBox(
                        height: 20,
                      ),
                      //START SUBMIT BUTTON
                      Container(
                        width: 250.0,
                        height: 60.0,
                        child: OutlineButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            _formKey.currentState?.save();
                          },
                          child: Text('Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 1),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
//start already a user
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already a user?",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FlatButton(
                            textColor: Colors.blue[200],
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Login()),
                                  (Route<dynamic> route) => false);
                            },
                            child: Text(
                              "login",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ],
                      )
//end already a user
                      //END SUBMIT BUTTON
                    ],
                  ),
                )),
              ),
            ));
  }
}
