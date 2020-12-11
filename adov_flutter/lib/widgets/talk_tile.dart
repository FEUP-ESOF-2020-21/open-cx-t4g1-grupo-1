import 'package:adov_flutter/models/talk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../style.dart';

const TalkTileHeight = 100.0;

class TalkTile extends StatelessWidget {
  final Talk talk;
  final bool darkTheme;

  TalkTile({this.talk, this.darkTheme = false});

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: DefaultPaddingHorizontal),
      height: 100,
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
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: textColor),
            ),
            Text(
              talk.title.toUpperCase(),
              key: Key('talk_tile_name_${talk.id}'),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style:
                  Theme.of(context).textTheme.title.copyWith(color: textColor),
            ),
          ]),
    );
  }
}
