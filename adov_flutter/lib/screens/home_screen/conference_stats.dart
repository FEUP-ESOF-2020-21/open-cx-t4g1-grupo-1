import 'package:adov_flutter/models/talk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class ConferenceStats extends StatelessWidget {
  final bool darkTheme;
  final EdgeInsets padding;

  ConferenceStats({this.darkTheme = false, this.padding});

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;

    return Padding(
      padding: this.padding,
      child: Container(
        width: 400,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  "Conference Details",
                  style: CardsTitleStyle.copyWith(
                    color: textColor,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(128, 128, 128, 1),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    height: 125,
                    width: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _numberOfDays(),
                          style: TitleTextStyle.copyWith(
                            color: Colors.black,
                            fontSize: 64,
                            fontWeight: FontWeight.w400,
                          )
                        ),
                        Text("Days"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(128, 128, 128, 1),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    height: 125,
                    width: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            _numberOfTalks(),
                            style: TitleTextStyle.copyWith(
                              color: Colors.black,
                              fontSize: 64,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                        Text("Talks"),
                      ],
                    ),
                  ),
                ],
              )
            ]
        ),
      ),
    );
  }

  String _numberOfDays() {
    return Talk.fetchDays().length.toString();
  }

  String _numberOfTalks() {
    return Talk.fetchAll().length.toString();
  }
}