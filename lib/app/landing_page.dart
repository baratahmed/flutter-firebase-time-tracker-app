import 'package:flutter/material.dart';
import 'dart:async';
import 'package:time_tracker_flutter_app/app/home_page.dart';
import 'package:time_tracker_flutter_app/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_flutter_app/services/auth.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.auth});
  final AuthBase auth;

  // User _user;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _checkCurrentUser();
  //   widget.auth.onAuthStateChanged.listen((user) {
  //     print('User: ${user?.uid}');
  //   });
  // }
  //
  // Future<void> _checkCurrentUser() async {
  //   User user = await widget.auth.currentUser();
  //   _updateUser(user);
  // }
  //
  // void _updateUser(User user) {
  //   setState(() {
  //     _user = user;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
    stream: auth.onAuthStateChanged,
    builder: (_, snapshot) {
        if(snapshot.connectionState == ConnectionState.active){
        User user = snapshot.data;
        if(user == null){
          return SignInPage(
          auth: auth,
          // onSignIn: _updateUser,
          );
        }else{
        return HomePage(
        auth: auth,
        // onSignOut: () => _updateUser(null),
        );
        }
        }else{
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
    },
    );
  }
}

//
// StreamBuilder(
// stream: widget.auth.onAuthStateChanged,
// builder: (context, snapshot){
// if(snapshot.hasData){
// User user = snapshot.data;
//
// }
// },
// );




// if(_user == null){
// return SignInPage(
// auth: widget.auth,
// onSignIn: _updateUser,
// );
// }else{
// return HomePage(
// auth: widget.auth,
// onSignOut: () => _updateUser(null),
// );
// }


// return StreamBuilder(
// stream: widget.auth.onAuthStateChanged,
// builder: (_, snapshot) {
// if(snapshot.hasData){
// User user = snapshot.data;
// if(user == null){
// return SignInPage(
// auth: widget.auth,
// onSignIn: _updateUser,
// );
// }else{
// return HomePage(
// auth: widget.auth,
// onSignOut: () => _updateUser(null),
// );
// }
// }else{
// return HomePage(
// auth: widget.auth,
// onSignOut: () => _updateUser(null),
// );
// }
// },
// );
