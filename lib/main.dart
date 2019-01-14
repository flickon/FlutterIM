import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterIM/IM_home.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "IM",
      theme: new ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.cyan[600],
        brightness: Brightness.light, // The theme is light by default
      ),
      debugShowCheckedModeBanner: false,
      home: new IMHome(cameras),
    );
  }
}
