import 'package:adov_flutter/models/talk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../style.dart';

class NextTalkContainer extends StatelessWidget {
  final Talk talk;
  final bool darkTheme;

  NextTalkContainer(this.talk, {this.darkTheme});

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;

    return Container(
      decoration: ComponentBoxStyle.create(radius: 7.5, color: InnerComponentColor),
      width: 400,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            talk.room.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle,
          ),
          Text(
            DateFormat('dd/MM/yyyy ').format(talk.day) +
                talk.time.format(context),
            style:
                Theme.of(context).textTheme.caption.copyWith(color: textColor),
          ),
          Text(
            talk.title.toUpperCase(),
            key: Key('talk_tile_name_${talk.id}'),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.title.copyWith(color: textColor),
          ),
          Divider(
            color: textColor,
          ),
          Text(talk.details,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Body1TextStyle.copyWith(
                  fontSize: SmallTextSize, color: textColor)),
        ],
      ),
    );
  }
}
