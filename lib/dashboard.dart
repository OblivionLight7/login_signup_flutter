import 'package:flutter/material.dart';


class dashboard extends StatefulWidget {
  dashboard({Key key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text("Welcome to Generics",
            style:TextStyle(
                fontWeight: FontWeight.bold, fontSize: 50, color: Colors.white)),
      ),
    );
  }
}
