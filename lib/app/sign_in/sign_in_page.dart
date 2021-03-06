import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:time_tracker_flutter_app/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_app/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_app/services/auth.dart';

class SignInPage extends StatelessWidget {

  SignInPage({@required this.auth});
  //final Function(User) onSignIn;
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
      try{
        await auth.signInAnonymously();
      }catch(e){
        print(e.toString());
      }
  }

  Future<void> _signInWithGoogle() async {
    try{
      await auth.signInWithGoogle();
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    try{
      await auth.signInWithFacebook();
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Time Tracker",
        ),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 40.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: _signInWithGoogle,
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: _signInWithFacebook,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          Text(
            'or',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Go Anonymous',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }
}
