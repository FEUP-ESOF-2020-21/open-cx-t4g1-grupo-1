// app.dart

import 'package:adov_flutter/screens/add_talk/add_talk.dart';
import 'package:adov_flutter/screens/edit_talk/edit_talk.dart';
import 'package:adov_flutter/screens/edit_talks/edit_talks.dart';
import 'package:adov_flutter/screens/home_screen/home_screen.dart';
import 'package:adov_flutter/screens/login/welcome_screen.dart';
import 'package:adov_flutter/screens/talk_detail/talk_detail.dart';
import 'package:adov_flutter/screens/talks_schedule/talks_schedule.dart';
import 'package:flutter/material.dart';

import 'style.dart';

const WelcomeScreenRoute = '/';
const HomeScreenRoute = '/home_screen';
const TalksScheduleRoute = '/talks_schedule';
const TalkDetailRoute = '/talk_detail';
const AddTalkRoute = '/add_talk';
const EditTalksRoute = '/edit_talks';
const EditTalkRoute = '/edit_talk';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }
}

RouteFactory _routes() {
  return (settings) {
    final Map<String, dynamic> arguments = settings.arguments;
    Widget screen;

    switch (settings.name) {
      case WelcomeScreenRoute:
        screen = WelcomeScreen();
        break;
      case HomeScreenRoute:
        screen = HomeScreen();
        break;
      case TalksScheduleRoute:
        screen = TalksSchedule();
        break;
      case TalkDetailRoute:
        screen = TalkDetail(arguments['id']);
        break;
      case AddTalkRoute:
        screen = AddTalk();
        break;
      case EditTalksRoute:
        screen = EditTalks();
        break;
      case EditTalkRoute:
        screen = EditTalk(arguments['id']);
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}

ThemeData _theme() {
  return ThemeData(
      appBarTheme: AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle)),
      textTheme: TextTheme(
        title: TitleTextStyle,
        subtitle: SubTitleTextStyle,
        caption: CaptionTextStyle,
        body1: Body1TextStyle,
      ));
}
