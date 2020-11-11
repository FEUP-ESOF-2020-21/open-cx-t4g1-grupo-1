import 'package:adov_flutter/app.dart';
import 'package:adov_flutter/database.dart';
import 'package:adov_flutter/models/talk.dart';
import 'package:adov_flutter/widgets/talk_container.dart';
import 'package:adov_flutter/widgets/talk_day.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TalksSchedule extends StatelessWidget {
  List talks = [];

  fetchDatabaseTalks() async {
    dynamic talksResult = await getTalks();

    talks = talksResult;
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();

    fetchDatabaseTalks();

    int day = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('talks').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(), // new
              controller: _controller,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              children: <Widget>[
                for (var i in talks)
                  _dayWidget(context, day++, i),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddTalkRoute);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
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
            decoration: BoxDecoration(
              color: const Color(0xff474747),
              borderRadius: BorderRadius.circular(8),
            ),
            width: 300,
            child: Stack(
              children: [
                // ImageBanner(assetPath: talk.imagePath, height: 245.0),
                TalkContainer(talk: talk, darkTheme: true),
              ],
            ),
          )),
    );
  }

  Widget _dayWidget(BuildContext context, int day, Talk talk) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: TalkDay(talk, day, false),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => _itemBuilder(context, talk),
            itemCount: 1,
          ),
        )
      ],
    );
  }

  _onLocationTap(BuildContext context, var locationID) {
    Navigator.pushNamed(context, TalkDetailRoute,
        arguments: {"id": locationID});
  }
}
