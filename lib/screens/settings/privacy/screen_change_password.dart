import 'package:flutter/material.dart';
import 'package:projecta_frontend/screens/settings/commons/custom_widgets.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var hintTextStyle= TextStyle(
    color: Colors.grey,

  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
      ),
      body: content(),
    );
  }

  Widget content(){
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,left: 12.0,right: 12.0
      ),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height-100
          ),
          child: Container(
            // color: Colors.grey,
            child: Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    _caseSensitive(),
                    _passwordFields(),
                    // Spacer(),
                    // _saveButton(),
                    // _forgotPassword()
                  ],
                ),
                Positioned(
                  bottom: 60,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      _saveButton(),
                      _forgotPassword()
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  _caseSensitive(){
    return Container(
      child: Text("Passwords are case sensitive and must be atleast 8 characters"),
    );
  }

  _passwordFields(){
    return Column(
      children: [
        CustomTextField(
          // prefixIcon: Icon(Icons.person),
          // suffixText: Icon(Icons.edit),
          readOnly: false,
          maxLines: 1,
          hintText: "Existing Password",
          hintTextStyle: hintTextStyle,
        ),
        CustomTextField(
          // prefixIcon: Icon(Icons.person),
          // suffixText: Icon(Icons.edit),
          readOnly: false,
          maxLines: 1,
          hintText: "New Password",
          hintTextStyle: hintTextStyle,
        ),
        CustomTextField(
          // prefixIcon: Icon(Icons.person),
          // suffixText: Icon(Icons.edit),
          readOnly: false,
          maxLines: 1,
          hintText: "Retype New Password",
          hintTextStyle: hintTextStyle,
        ),
        // _saveButton()

      ],
    );

  }

  _saveButton(){
    return CustomButton(
      title: "SAVE",
      height: 40.0,
      onPressed: (){},
    );
  }

  _forgotPassword(){
    return Container(
      child: Text("Forgot your password?",
      style: TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.underline
      ),),
    );
  }
}
