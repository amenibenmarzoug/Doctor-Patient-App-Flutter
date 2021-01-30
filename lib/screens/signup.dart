import 'dart:convert';

import 'package:doctor_patient_app/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:doctor_patient_app/constant.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  Patient user = Patient();
  String url = "http://192.168.1.55:8080/api/auth/signup";

  Future save() async {
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': user.username,
          'password': user.password,
          'email':user.email,
          'firstName': user.firstName,
          'lastName': user.lastName,
          'gender': user.gender
        }));
    print(res.body);
    if (res.body != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
           child: Form(
            key: _formKey,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontSize: 70.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 70.0,
                            fontWeight: FontWeight.bold,
                            color: kOrangeColor),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: TextEditingController(text: user.firstName),
                        onChanged: (val) {
                          user.firstName = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'FirstName is Empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'FIRSTNAME',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kOrangeColor))),
                      ),
                      SizedBox(height: 6.0),
                      TextFormField(
                        controller: TextEditingController(text: user.lastName),
                        onChanged: (val) {
                          user.lastName = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'LastName is Empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'LASTNAME',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kOrangeColor))),
                      ),
                      SizedBox(height: 6.0),
                      TextFormField(
                        controller: TextEditingController(text: user.gender),
                        onChanged: (val) {
                          user.gender = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Gender is Empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'GENDER',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kOrangeColor))),
                      ),
                      SizedBox(height: 6.0),
                      TextFormField(
                        controller: TextEditingController(text: user.email),
                        onChanged: (val) {
                          user.email = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email is Empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kOrangeColor))),
                      ),
                      SizedBox(height: 6.0),
                      TextFormField(
                        controller: TextEditingController(text: user.username),
                        onChanged: (val) {
                          user.username = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Username is Empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'USERNAME ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kOrangeColor))),
                      ),
                      SizedBox(height: 6.0),
                      TextFormField(
                        obscureText: true,
                        controller: TextEditingController(text: user.password),
                        onChanged: (val) {
                          user.password = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password is Empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'PASSWORD ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kOrangeColor))),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: kOrangeColor,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                if (_formKey.currentState.validate()) {
                                  save();
                               }
                              },
                              child: Center(
                                child: Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text('Go Back',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ]),),));
  }
}
