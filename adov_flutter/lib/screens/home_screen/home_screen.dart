import 'package:adov_flutter/app.dart';
import 'package:adov_flutter/widgets/conference_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConferenceDetails(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () => Navigator.pushNamed(context, TalksScheduleRoute),
                child: Text('Talks Schedule'),
              ),
              RaisedButton(
                onPressed: () => null,
                child: Text('Change Talk'),
              ),
            ],
          )
        ],
      )
    );
  }
}