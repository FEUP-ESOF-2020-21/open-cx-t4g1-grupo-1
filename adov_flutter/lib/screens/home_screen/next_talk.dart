import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../app.dart';
import '../../models/talk.dart';
import '../../style.dart';

class NextTalk extends StatelessWidget {
  final bool darkTheme;
  final EdgeInsets padding;
  final Talk talk = _getNextTalk();

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
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(128, 128, 128, 1),
                    borderRadius: BorderRadius.circular(7.5),
                  ),
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
                        DateFormat('dd/MM/yyyy ').format(talk.day) + talk.time.format(context),
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
                      Divider(
                        color: Colors.black,
                      ),
                      Text(
                        talk.details,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Body1TextStyle.copyWith(
                          fontSize: SmallTextSize
                        )
                      ),
                    ],
                  ),
                ),
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

  static Talk _getNextTalk() {
    var day = DateTime.now();
    var days = Talk.fetchDays();

    var talksDay = Talk.fetchByDay(DateTime(day.year, day.month, day.day));
    talksDay.sort((a, b) {
      return DateTime(2020, 1, 1, a.time.hour, a.time.minute).compareTo(DateTime(2020, 1, 1, b.time.hour, b.time.minute));
    });
    if (talksDay.isNotEmpty) {
      for (var talk in talksDay) {
        if (day.isBefore(DateTime(talk.day.year, talk.day.month, talk.day.day, talk.time.hour, talk.time.minute))) {
          return talk;
        }
      }
    }

    for ( var i = 0; i < days.length; i++ ) {
      if (days.elementAt(i).isAfter(day)) {
        return Talk.fetchByDay(days.elementAt(i))[0];
      }
    }
    return null;
  }
}