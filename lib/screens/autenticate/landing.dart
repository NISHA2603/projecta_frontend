import 'package:flutter/material.dart';

import 'jobSeekerRegister.dart';
import 'signu_up.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Center(
            child: Text("Job App", style: TextStyle(color: Colors.white))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Welcome to the Job App',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Please Help us Identify your interest so that we can serve you',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          // This expands the row element vertically because it's inside a column
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Register as:',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                //START BUTTON SECTION

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.pink,
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignUp()),
                                (Route<dynamic> route) => false);
                          },
                          child: Text(
                            "Job Seeker",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        height: 50,
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.green[800],
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OrganizationRegister()),
                                (Route<dynamic> route) => false);
                          },
                          child: Text(
                            "organization",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
      //drawer: Drawer(),
    );
  }
}
