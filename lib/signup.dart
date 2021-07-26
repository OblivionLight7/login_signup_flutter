import 'package:flutter/material.dart';
import 'package:login_signup_app/signin.dart';
import 'package:login_signup_app/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'dart:convert';

class signup extends StatefulWidget {
  signup({Key key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formKey = GlobalKey<FormState>();

  Future<http.Response> postData(String name,String email,String password,String contact) {
    return http.post(
      'http://0.0.0.0:5000/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
        'contact': contact,


      }),
    );
  }

  /*Future save() async {
    /*var res = await http.post("localhost:5000/api/logins",
        headers: <String, String>{'Context-Type': 'application/json'},
        body: <String, String>{'email': self.email, 'password': self.password});
    print(res.body);*/
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => signin()));
  }*/
  String name = "";
  String email = "";
  String password = "";
  String contact = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  //Login self = Login('', '');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Container(
        decoration: new BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/1.JPEG'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: <Widget>[
                      TextFormField(
                        controller: TextEditingController(text: nameController.text),
                        onChanged: (value) {
                          nameController.text = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.verified_user,
                              color: Colors.red,
                            ),
                            hintText: "Enter Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        keyboardType: TextInputType.text,
                      ),

                      /*RaisedButton(
    color:Theme.of(context).primaryColorDark,
    textColor: Theme.of(context).primaryColorLight,
    onPressed: (){
    setState(() {
    name = nameController.text;
    var data = postData(nameController.text);
    print(data);
    print(data.toString());
    });
    },
    ),*/
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(children: <Widget>[
                          TextFormField(
                            controller: TextEditingController(text: emailController.text),
                            onChanged: (value) {
                              emailController.text = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Email';
                              } else if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return null;
                              } else {
                                return 'Enter valid email';
                              }
                            },
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.red,
                                ),
                                hintText: "Enter Email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                            keyboardType: TextInputType.text,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(children: <Widget>[
                              TextFormField(
                                controller:
                                    TextEditingController(text: nameController.text),
                                onChanged: (value) {
    nameController.text = value;
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter Password';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.vpn_key,
                                      color: Colors.red,
                                    ),
                                    hintText: "Enter Password",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                keyboardType: TextInputType.text,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      controller: TextEditingController(
                                          text: nameController.text),
                                      onChanged: (value) {
    nameController.text = value;
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Contact';
                                        }
                                        return null;
                                      },
                                      //controller: nameController,
                                      decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.call,
                                            color: Colors.red,
                                          ),
                                          hintText: "Enter Contact",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0))),
                                      keyboardType: TextInputType.text,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(55, 16, 16, 0),
                                      child: Container(
                                        height: 50,
                                        width: 300,
                                        child: FlatButton(
                                            color: Colors.lightGreen,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0)),
                                            onPressed: () {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                //save();
                                                Navigator.push(
                                                    context,
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            signin()));
                                              } else {
                                                print("not ok");
                                              }
                                              if (_formKey.currentState
                                                  .validate()) {
                                            child: Text(
                                              "Signup",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          95, 20, 0, 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Already have Account ? ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  new MaterialPageRoute(
                                                      builder: (context) =>
                                                          signin()));
                                            },
                                            child: Text(
                                              "Signin",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ]),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
