import 'package:adov_flutter/app.dart';
import 'package:adov_flutter/screens/login/animated_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pushReplacementNamed(context, HomeScreenRoute),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Ad\nOv",
                style: TitleTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 100,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 125)),
            AnimatedText("tap to continue"),
            Padding(padding: EdgeInsets.only(top: 50)),
            OutlineButton(
              onPressed: () => Navigator.pushReplacementNamed(context, LoginScreenRoute),
              child: Text(
                "Staff",
                style: TitleTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26.0),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            Text(
              "Adapt, Overcome",
              style: Body1TextStyle.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30))
          ],
        ),
      )
    );
  }

}