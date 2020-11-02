import 'package:adov_flutter/models/talk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../style.dart';

class TalkDay extends StatelessWidget {
  final Talk talk;
  final int day;
  final bool darkTheme;

  TalkDay(this.talk, this.day, this.darkTheme);

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: DefaultPaddingHorizontal),
      height: 50,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Day " + day.toString(),
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              DateFormat('dd/MM').format(talk.day).toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: textColor),
            ),
          ]),
    );
  }


}