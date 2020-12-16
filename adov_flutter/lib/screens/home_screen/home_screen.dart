import 'package:adov_flutter/app.dart';
import 'package:adov_flutter/screens/home_screen/conference_sponsors.dart';
import 'package:adov_flutter/screens/home_screen/conference_stats.dart';
import 'package:adov_flutter/screens/home_screen/next_talk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import '../../style.dart';
import '../../database/talks_database.dart';
import 'conference_details.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen() : super(key: Key("Home_Screen"));

  @override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isLoggedIn;

  @override
  void initState() {
    isLoggedIn = false;
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        isLoggedIn = user != null;
      });
    });
    super.initState();
  }

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
                child: Text('AdOv',
                    style: TitleTextStyle.copyWith(color: Colors.white)),
              ),
              ListTile(
                key: Key("scheduleButton"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, TalksScheduleRoute);
                },
                leading: Icon(Icons.calendar_today),
                title: Text(
                  'Talks Schedule',
                  style: ListItemDrawerStyle,
                ),
              ),
              /*ListTile(
                leading: Icon(Icons.developer_board),
                title: Text(
                  'Developer Option: Add Talks to Database',
                  style: ListItemDrawerStyle,
                ),
                onTap: () => TalksDatabase.addTalksToDatabase(),
              ),
              ListTile(
                leading: Icon(Icons.developer_board),
                title: Text(
                  'Developer Option: Remove Talks from Database',
                  style: ListItemDrawerStyle,
                ),
                onTap: () => TalksDatabase.removeTalksFromDatabase(),
              ),*/
              for (var widget in _getDrawerItems()) widget,
              ListTile(
                title: Text(
                  'v0.4-alpha',
                  style: ListItemDrawerStyle.copyWith(color: Colors.grey),
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
        ));
  }

  List<Widget> _getDrawerItems() {
    if (isLoggedIn) {
      return [
        ListTile(
          leading: Icon(Icons.edit),
          title: Text(
            'Edit Talks',
            style: ListItemDrawerStyle,
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, EditTalksRoute);
          },
        ),
        ListTile(
            key: Key("logoutButton"),
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: ListItemDrawerStyle,
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            })
      ];
    } else {
      return [
        ListTile(
          leading: Icon(Icons.login),
          title: Text(
            'Login',
            style: ListItemDrawerStyle,
          ),
          onTap: () => Navigator.pushNamed(context, LoginScreenRoute),
        )
      ];
    }
  }
}
