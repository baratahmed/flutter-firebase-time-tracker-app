import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_app/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color textColor,
    Color color,
    VoidCallback onPressed,
  }) : assert(assetName!=null),assert(text != null), super(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(assetName),
        Text(text, style: TextStyle(color: textColor, fontSize: 15.0),),
        Opacity(opacity: 0.0, child: Image.asset(assetName)),
      ],
    ),
    color: color,
    borderRadius: 5.0,
    onPressed: onPressed,
  );

}


