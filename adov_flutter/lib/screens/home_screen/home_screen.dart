import 'package:adov_flutter/app.dart';
import 'package:adov_flutter/database/talks_database.dart';
import 'package:adov_flutter/screens/home_screen/conference_sponsors.dart';
import 'package:adov_flutter/screens/home_screen/conference_stats.dart';
import 'package:adov_flutter/screens/home_screen/next_talk.dart';
import '../../app.dart';
import '../../style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'conference_details.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: MainColor,
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: MainColor,
                ),
                child: Text(
                  'AdOv',
                  style: TitleTextStyle.copyWith(
                    color: Colors.white
                  )
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, TalksScheduleRoute);
                },
                leading: Icon(Icons.calendar_today),
                title: Text('Talks Schedule', style: ListItemDrawerStyle,),
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Talks', style: ListItemDrawerStyle,),
                onTap: () => Navigator.pop(context),
              ),
              /*
              ListTile(
                leading: Icon(Icons.developer_board),
                title: Text('Developer Option: Add Talks to Database', style: ListItemDrawerStyle,),
                onTap: () => TalksDatabase.auxiliar(),
              ),*/
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout', style: ListItemDrawerStyle,),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text(
                  'v0.1-alpha',
                  style: ListItemDrawerStyle.copyWith(
                    color: Colors.grey
                  ),
                ),
              ),
            ],
          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConferenceDetails(
              darkTheme: true,
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            NextTalk(
              darkTheme: true,
              padding: EdgeInsets.only(bottom: 20),
            ),
            ConferenceStats(
              darkTheme: true,
              padding: EdgeInsets.only(bottom: 20),
            ),
            ConferenceSponsors(
              darkTheme: true,
              padding: EdgeInsets.only(bottom: 20),
            ),
          ],
        ),
      )
    );
  }
}