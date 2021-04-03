import "package:flutter/material.dart";
import 'package:time_tracker_flutter_app/app/landing_page.dart';
import 'package:time_tracker_flutter_app/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Time Tracker",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}
