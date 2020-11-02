// app.dart

import 'file:///C:/Users/skidr/OneDrive/Desktop/open-cx-t4g1-grupo-1/adov_flutter/lib/screens/talks_schedule/talks_schedule.dart';
import 'package:adov_flutter/screens/talk_detail/talk_detail.dart';
import 'package:flutter/material.dart';
import 'style.dart';

const TalksScheduleRoute = '/';
const TalkDetailRoute = '/talk_detail';

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
      case TalksScheduleRoute:
        screen = TalksSchedule();
        break;
      case TalkDetailRoute:
        screen = TalkDetail(arguments['id']);
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