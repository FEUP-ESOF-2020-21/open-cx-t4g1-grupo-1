import 'package:adov_flutter/app.dart';
import 'package:adov_flutter/database/talks_database.dart';
import 'package:adov_flutter/models/talk.dart';
import 'package:adov_flutter/widgets/talk_container.dart';
import 'package:adov_flutter/widgets/talk_day.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class TalksSchedule extends StatelessWidget {
  TalksSchedule() : super(key: Key("Schedule_Screen"));

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
        backgroundColor: MainColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('talks').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            List<Talk> talks = [];
            snapshot.data.docs.forEach((element) {
              talks.add(TalksDatabase.createTalkFromSnapshot(element));
            });
            talks.sort((a, b) {
              return DateTime(a.day.year, a.day.month, a.day.day, a.time.hour,
                      a.time.minute)
                  .compareTo(DateTime(b.day.year, b.day.month, b.day.day,
                      b.time.hour, b.time.minute));
            });
            List<DateTime> days = Talk.getDays(talks);
            Talk nextTalk = Talk.getNextTalk(talks, days);
            int day = 1;

            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _controller,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              children: <Widget>[
                for (var i in days)
                  _dayWidget(
                      context, day++, Talk.getTalksOnDay(talks, i), nextTalk),
              ],
            );
          }),
    );
  }

  Widget _itemBuilder(BuildContext context, Talk talk, Talk nextTalk) {
    return GestureDetector(
      key: Key('talk_list_item_${talk.id}'),
      onTap: () => _onTalkTap(context, talk.id),
      child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.only(right: 20.0, bottom: 20.0),
            decoration: ComponentBoxStyle.create(
                radius: 8, color: (talk == nextTalk) ? Colors.red : MainColor),
            width: 300,
            child: TalkContainer(
              talk: talk,
              darkTheme: true,
              nextTalk: (talk == nextTalk),
            ),
          )),
    );
  }

  Widget _dayWidget(
      BuildContext context, int day, List<Talk> talks, Talk nextTalk) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: TalkDay(talks[0], day, false),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                _itemBuilder(context, talks[index], nextTalk),
            itemCount: talks.length,
          ),
        )
      ],
    );
  }

  _onTalkTap(BuildContext context, var locationID) {
    Navigator.pushNamed(context, TalkDetailRoute,
        arguments: {"id": locationID});
  }
}
