import 'package:adov_flutter/models/Conference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../style.dart';

class ConferenceDetails extends StatelessWidget {
  final bool darkTheme;
  final EdgeInsets padding;

  final Conference conference = Conference.fetch();

  ConferenceDetails({
    this.darkTheme = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;

    return Padding(
      padding: padding,
      child: Container(
        width: 400,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: ComponentBoxStyle.create(radius: 15, shadow: true),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                conference.name,
                style: Theme.of(context).textTheme.title.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: VeryLargeTextSize
                ),
              ),
              Text(
                DateFormat('dd/MM/yyyy ').format(conference.start) + "to " + DateFormat('dd/MM/yyyy').format(conference.end),
                style: Theme.of(context).textTheme.subtitle,
              ),
              Padding(padding: EdgeInsets.only(bottom: 10.0)),
              Text(
                conference.description,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: textColor),
              ),
            ]),
      ),
    );
  }
}