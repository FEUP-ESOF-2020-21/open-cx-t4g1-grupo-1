import 'package:adov_flutter/app.dart';
import 'package:adov_flutter/models/talk.dart';
import 'package:adov_flutter/widgets/talk_container.dart';
import 'package:adov_flutter/widgets/talk_day.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style.dart';


class TalksSchedule extends StatelessWidget {
  final days = Talk.fetchDays();
  final nextTalk = Talk.getNextTalk();


  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();

    int day = 1;
    return Scaffold(
        appBar: AppBar(
          title: Text('Schedule'),
          backgroundColor: MainColor,
        ),
        body: ListView(
          physics: const AlwaysScrollableScrollPhysics(), // new
          controller: _controller,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 20.0),
          children: <Widget>[
            for ( var i in days ) _dayWidget(context, day++, Talk.fetchByDay(i)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddTalkRoute);
          },
          child: Icon(Icons.add),
          backgroundColor: AccentColor,
        ),
    );
  }

  Widget _itemBuilder(BuildContext context, Talk talk) {
    return GestureDetector(
      key: Key('location_list_item_${talk.id}'),
      onTap: () => _onLocationTap(context, talk.id),
      child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.only(right: 20.0, bottom: 20.0),
            decoration: ComponentBoxStyle.create(
              radius: 8,
              color: (talk == nextTalk) ? Colors.red : MainColor
            ),
            width: 270,
            child: TalkContainer(talk: talk, darkTheme: true, nextTalk: (talk == nextTalk),),
          )
      ),
    );
  }

  Widget _dayWidget(BuildContext context, int day, List<Talk> talks) {
    return
      Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: TalkDay(talks[0], day, false),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => _itemBuilder(context, talks[index]),
              itemCount: talks.length,
            ),
          )
        ],
      );
  }

  _onLocationTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, TalkDetailRoute,
        arguments: {"id": locationID});
  }
}
