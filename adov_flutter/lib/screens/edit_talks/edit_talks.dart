import 'package:adov_flutter/app.dart';
import 'package:adov_flutter/database/talks_database.dart';
import 'package:adov_flutter/models/talk.dart';
import 'package:adov_flutter/widgets/talk_container.dart';
import 'package:adov_flutter/widgets/talk_day.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class EditTalks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Talks'),
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

            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _controller,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              itemBuilder: (context, index) =>
                  _itemBuilder(context, talks[index], nextTalk),
              itemCount: talks.length,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddTalkRoute);
        },
        child: Icon(Icons.add),
        backgroundColor: MainColor,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, Talk talk, Talk nextTalk) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                key: Key('talk_list_item_${talk.id}'),
                onTap: () => _onTalkTap(context, talk.id),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  decoration: ComponentBoxStyle.create(
                      radius: 8,
                      color: (talk == nextTalk) ? Colors.red : MainColor),
                  width: 200,
                  child: TalkContainer(
                      talk: talk,
                      darkTheme: true,
                      nextTalk: (talk == nextTalk)),
                )),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(MainColor),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                minimumSize: MaterialStateProperty.all<Size>(Size(70, 70)),
              ),
              onPressed: () => Navigator.pushNamed(context, EditTalkRoute,
                  arguments: {"id": talk}),
              child: Icon(Icons.edit),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                minimumSize: MaterialStateProperty.all<Size>(Size(70, 70)),
              ),
              onPressed: () => TalksDatabase.deleteTalk(talk),
              child: Icon(Icons.delete),
            ),
          ],
        ));
  }

  _onTalkTap(BuildContext context, var locationID) {
    Navigator.pushNamed(context, TalkDetailRoute,
        arguments: {"id": locationID});
  }
}
