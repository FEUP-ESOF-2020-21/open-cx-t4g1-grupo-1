import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class ConferenceDetails extends StatelessWidget {
  final bool darkTheme;
  final EdgeInsets padding;

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
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Conference Alpha",
                style: Theme.of(context).textTheme.title.copyWith(color: textColor),
              ),
              Text(
                '10/10/2020 to 16/10/2020',
                style: Theme.of(context).textTheme.subtitle,
              ),
              Text(
                "Best conference around Mars, brought to you by Eleon Muskee",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: textColor),
              ),
            ]),
      ),
    );
  }
}