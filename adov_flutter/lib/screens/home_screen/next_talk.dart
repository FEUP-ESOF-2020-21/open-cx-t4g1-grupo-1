import 'package:adov_flutter/screens/home_screen/next_talk_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import '../../models/talk.dart';
import '../../style.dart';

class NextTalk extends StatelessWidget {
  final bool darkTheme;
  final EdgeInsets padding;
  final Talk talk = Talk.getNextTalk();

  NextTalk({
    this.darkTheme = false,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;

    return Padding(
      padding: this.padding,
      child: Container(
        width: 400,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: ComponentBoxStyle.create(radius: 15, shadow: true),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  "Next Talk",
                  style: CardsTitleStyle.copyWith(
                    color: textColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _onTalkTap(context, talk.id),
                child: NextTalkContainer(talk, darkTheme: darkTheme,)
              )
            ]
        ),
      ),
    );
  }

  _onTalkTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, TalkDetailRoute,
        arguments: {"id": locationID});
  }
}