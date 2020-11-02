import 'package:adov_flutter/models/talk.dart';
import 'package:adov_flutter/screens/talk_detail/text_section.dart';
import 'package:adov_flutter/screens/talk_detail/tile_overlay.dart';
import 'package:adov_flutter/widgets/image_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TalkDetail extends StatelessWidget {
  final int _talkID;

  TalkDetail(this._talkID);

  @override
  Widget build(BuildContext context) {
    final talk = Talk.fetchByID(_talkID);

    return Scaffold(
      appBar: AppBar(
        title: Text(talk.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.0,
              child: (
                  Stack(
                    children: [
                      ImageBanner(assetPath: talk.imagePath, height: 200.0,),
                      TileOverlay(talk),
                    ],
                  )
              ),
            ),
          ]..addAll(textSections(talk)),
        )
      )
    );
  }

  List<Widget> textSections(Talk talk) {
    return [TextSection("Details", talk.details)];
  }
}