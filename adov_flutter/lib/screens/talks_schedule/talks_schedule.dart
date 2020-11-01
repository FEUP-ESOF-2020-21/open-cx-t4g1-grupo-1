import 'package:adov_flutter/app.dart';
import 'package:adov_flutter/models/talk.dart';
import 'package:adov_flutter/widgets/talk_container.dart';
import 'package:adov_flutter/widgets/talk_day.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class TalksSchedule extends StatelessWidget {
  final days = Talk.fetchDays();
  @override
  Widget build(BuildContext context) {
    final talks = Talk.fetchAll();

    return Scaffold(
        appBar: AppBar(
          title: Text('Schedule'),
        ),
        body: ListView.builder(
            itemCount: talks.length,
            itemBuilder: (context, index) =>
                _itemBuilder(context, talks[index])));
  }

  Widget _itemBuilder(BuildContext context, Talk talk) {
    return GestureDetector(
      key: Key('location_list_item_${talk.id}'),
      onTap: () => _onLocationTap(context, talk.id),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _displayDay(talk),

          Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(right: 20.0, top: 20.0),
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
              )
          ),
        ],
      )
    );
  }

  Widget _displayDay(Talk talk) {
    if (days.contains(talk.day.day)) {
      days.remove(talk.day.day);
      return TalkDay(talk, false);
    }
    return Container(
        padding: EdgeInsets.symmetric(horizontal: DefaultPaddingHorizontal),
        height: 50,
        width: 50,);
  }

  _onLocationTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, TalkDetailRoute,
        arguments: {"id": locationID});
  }
}
