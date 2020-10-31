import 'package:adov_flutter/models/talk.dart';
import 'package:adov_flutter/widgets/talk_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TileOverlay extends StatelessWidget {
  final Talk talk;

  TileOverlay(this.talk);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: TalkTile(talk: talk, darkTheme: true),
        ),
      ],
    );
  }
}
