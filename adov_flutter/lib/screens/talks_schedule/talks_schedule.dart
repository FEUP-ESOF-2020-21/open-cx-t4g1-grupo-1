import 'package:adov_flutter/app.dart';
import 'package:adov_flutter/models/talk.dart';
import 'package:adov_flutter/screens/talk_detail/tile_overlay.dart';
import 'package:adov_flutter/widgets/image_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TalksSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final talks = Talk.fetchAll();

    return Scaffold(
        appBar: AppBar(
          title: Text('Locations'),
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
      child: Container(
        // height: 245.0,
        child: Stack(
          children: [
            // ImageBanner(assetPath: talk.imagePath, height: 245.0),
            TileOverlay(talk),
          ],
        ),
      ),
    );
  }

  _onLocationTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, TalkDetailRoute,
        arguments: {"id": locationID});
  }
}
