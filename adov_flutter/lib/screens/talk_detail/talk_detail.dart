import 'package:adov_flutter/database.dart';
import 'package:adov_flutter/models/talk.dart';
import 'package:adov_flutter/screens/talk_detail/text_section.dart';
import 'package:adov_flutter/screens/talk_detail/tile_overlay.dart';
import 'package:adov_flutter/widgets/image_banner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../style.dart';

class TalkDetail extends StatelessWidget {
  final DocumentReference _talkID;

  TalkDetail(this._talkID);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: _talkID.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading...");
          }
          print("stream builder: " + snapshot.data.toString());
          var talk = createTalkFromSnapshot(snapshot.data);
          return Scaffold(
              appBar: AppBar(
                title: Text(talk.title),
                backgroundColor: MainColor,
              ),
              body: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    height: 200.0,
                    child: (Stack(
                      children: [
                        ImageBanner(
                          assetPath: talk.imagePath,
                          height: 200.0,
                        ),
                        TileOverlay(talk),
                      ],
                    )),
                  ),
                ]..addAll(textSections(talk)),
              )));
        });
  }

  List<Widget> textSections(Talk talk) {
    return [TextSection("Details", talk.details)];
  }
}
