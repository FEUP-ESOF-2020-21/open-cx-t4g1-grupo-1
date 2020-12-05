import 'package:adov_flutter/database/talks_database.dart';
import 'package:adov_flutter/models/talk.dart';
import 'package:adov_flutter/screens/home_screen/next_talk_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import '../../style.dart';

class NextTalk extends StatelessWidget {
  final bool darkTheme;
  final EdgeInsets padding;

  NextTalk({
    this.darkTheme = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    var textColor = this.darkTheme ? TextColorLight : TextColorDark;

    return StreamBuilder<QuerySnapshot>(
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

          if (nextTalk == null) return Container();

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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Text(
                        "Next Talk",
                        style: CardsTitleStyle.copyWith(
                          color: textColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => _onTalkTap(context, nextTalk.id),
                        child: NextTalkContainer(
                          nextTalk,
                          darkTheme: darkTheme,
                        ))
                  ]),
            ),
          );
        });
  }

  _onTalkTap(BuildContext context, DocumentReference talkID) {
    Navigator.pushNamed(context, TalkDetailRoute, arguments: {"id": talkID});
  }
}
