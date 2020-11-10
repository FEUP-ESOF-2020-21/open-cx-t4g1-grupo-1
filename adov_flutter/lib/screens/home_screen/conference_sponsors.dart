import 'package:adov_flutter/models/Conference.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class ConferenceSponsors extends StatelessWidget {
  final bool darkTheme;
  final EdgeInsets padding;

  final List<String> sponsors = Conference.fetch().sponsors;

  ConferenceSponsors({this.darkTheme = false, this.padding});

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;

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
                  "Sponsors",
                  style: CardsTitleStyle.copyWith(
                    color: textColor,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: ComponentBoxStyle.create(radius: 7.5, color: InnerComponentColor),
                child: Text(
                  _getSponsors(),
                  style: Body1TextStyle.copyWith(
                    color: textColor
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ]
        ),
      ),
    );
  }

  String _getSponsors() {
    String string = "";
    for (var i = 0; i < this.sponsors.length - 1; i++) {
      string += this.sponsors[i].toString() + " | ";
    }
    string += this.sponsors[this.sponsors.length - 1];
    return string;
  }
}