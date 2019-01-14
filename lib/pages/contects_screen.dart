import 'package:flutter/material.dart';

class ContectsScreen extends StatefulWidget {
  @override
  ContectsScreenState createState() => new ContectsScreenState();
}

class ContectsScreenState extends State<ContectsScreen> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(
        "Contects",
        style: new TextStyle(fontSize: 20.0),
      ),
    );
  }
}
