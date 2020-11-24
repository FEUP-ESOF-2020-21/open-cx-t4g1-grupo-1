import 'package:adov_flutter/screens/edit_talk/edit_talk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

double opacity = 1.0;

class AnimatedText extends StatefulWidget {
  final String text;

  AnimatedText(this.text);

  @override
  State<StatefulWidget> createState() {
    return AnimatedTextState(text);
  }
}

class AnimatedTextState extends State<AnimatedText> {
  final String text;

  AnimatedTextState(this.text);

  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  changeOpacity() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        changeOpacity();
      });
    });
  }

  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: opacity,
        duration: Duration(seconds: 1),
        child: Text(
          this.text,
          style: Body1TextStyle.copyWith(color: Colors.white),
        )
    );
  }
}
