import 'package:adov_flutter/app.dart';
import 'package:adov_flutter/screens/home_screen/next_talk.dart';
import '../../app.dart';
import '../../style.dart';
import '../../style.dart';
import '../../style.dart';
import '../../style.dart';
import '../../style.dart';
import '../../style.dart';
import '../../style.dart';
import 'file:///C:/Users/skidr/OneDrive/Desktop/open-cx-t4g1-grupo-1/adov_flutter/lib/screens/home_screen/conference_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConferenceDetails(
            padding: EdgeInsets.symmetric(vertical: 40),
          ),
          NextTalk(
            padding: EdgeInsets.only(bottom: 40),
          ),
        ],
      )
    );
  }
}