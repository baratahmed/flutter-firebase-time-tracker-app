import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_app/services/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({ @required this.auth});
  //final VoidCallback onSignOut;
  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    Future<void> _signOut() async{
      try{
        await auth.signOut();
      }catch(e){
        e.toString();
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          FlatButton(
              onPressed: _signOut,
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ))
        ],
      ),
    );
  }
}
