import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Talk {
  DocumentReference id;
  final String title;
  final String room;
  final TimeOfDay time;
  final DateTime day;
  final String details;
  final String imagePath;

  Talk(this.title, this.room, this.time, this.day, this.details, this.imagePath);

  void setId(DocumentReference id) {
    this.id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'room': this.room,
      'hour': this.time.hour,
      'min': this.time.minute,
      'month': this.day.month,
      'day': this.day.day,
      'year': this.day.year,
      'details': this.details,
      'imagePath': this.imagePath
    };
  }

  static List<DateTime> getDays(List<Talk> talks) {
    Set<DateTime> days = Set();
    talks.forEach((element) {
      days.add(DateTime(element.day.year, element.day.month, element.day.day));
    });
    return days.toList();
  }

  static List<Talk> getTalksOnDay(List<Talk> talks, DateTime date) {
    List<Talk> returnTalks = [];
    talks.forEach((element) {
      if ((element.day.day == date.day) &&
          (element.day.month == date.month) &&
          (element.day.year == date.year)) returnTalks.add(element);
    });
    return returnTalks;
  }

  static Talk getNextTalk(List<Talk> talks, List<DateTime> days) {
    var day = DateTime.now();

    var talksDay = getTalksOnDay(talks, DateTime(day.year, day.month, day.day));

    if (talksDay.isNotEmpty) {
      for (var talk in talksDay) {
        if (day.isBefore(DateTime(talk.day.year, talk.day.month, talk.day.day,
            talk.time.hour, talk.time.minute))) {
          return talk;
        }
      }
    }

    for (var i = 0; i < days.length; i++) {
      if (days.elementAt(i).isAfter(day)) {
        return getTalksOnDay(talks, days.elementAt(i))[0];
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Talk && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
