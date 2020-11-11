import 'package:adov_flutter/database.dart';
import 'package:adov_flutter/screens/home_screen/next_talk_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import '../../style.dart';

class NextTalk extends StatelessWidget {
  final bool darkTheme;
  final EdgeInsets padding;
  Color textColor;

  NextTalk({
    this.darkTheme = false,
    this.padding,
  }) {
    this.textColor = this.darkTheme ? TextColorLight : TextColorDark;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('talks').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new Text("There is no next Talk");
          return _getNextTalk(snapshot, context)[0];
        });
  }

  // TODO - Fetch next talk -> find a way to do this
  _getNextTalk(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
    return snapshot.data.docs.map((doc) {
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    "Next Talk",
                    style: CardsTitleStyle.copyWith(
                      color: textColor,
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () => _onTalkTap(
                        context,
                        FirebaseFirestore.instance
                            .collection('talks')
                            .doc(doc.id)),
                    child: NextTalkContainer(createTalk(doc.data(), doc.id),
                        darkTheme: darkTheme))
              ]),
        ),
      );
    }).toList();
  }

  _onTalkTap(BuildContext context, DocumentReference talkID) {
    print("_onTalkTap: " + talkID.toString());
    Navigator.pushNamed(context, TalkDetailRoute, arguments: {"id": talkID});
  }
}
