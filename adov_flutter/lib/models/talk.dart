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

  Talk(
      this.title, this.room, this.time, this.day, this.details, this.imagePath);

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

  /*
  static Talk fetchByID(int id) {
    List<Talk> list = fetchAll();
    for (var i = 0; i < list.length; ++i) {
      if (list[i].id == id)
        return list[i];
    }
    return null;
  }
   */

  /*
  static List<Talk> fetchByDay(DateTime day) {
    List<Talk> list = [];
    fetchAll().forEach((element) {
      if (element.day.compareTo(day) == 0) {
        list.add(element);
      }
    });
    list.sort((a, b) {
      return DateTime(a.day.year, a.day.month, a.day.day, a.time.hour, a.time.minute)
          .compareTo(DateTime(b.day.year, b.day.month, b.day.day, b.time.hour, b.time.minute));
    });
    return list;
  }
   */

  /*
  static Set<DateTime> fetchDays() {
    List<Talk> list = fetchAll();
    list.sort((a, b) {
      return DateTime(a.day.year, a.day.month, a.day.day, a.time.hour, a.time.minute)
          .compareTo(DateTime(b.day.year, b.day.month, b.day.day, b.time.hour, b.time.minute));
    });
    Set<DateTime> days = new Set();
    for (var i = 0; i < list.length; ++i) {
      days.add(list[i].day);
    }
    return days;
  }
   */

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Talk && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  /*
  static Talk getNextTalk() {
    var day = DateTime.now();
    var days = Talk.fetchDays();

    var talksDay = Talk.fetchByDay(DateTime(day.year, day.month, day.day));
    talksDay.sort((a, b) {
      return DateTime(2020, 1, 1, a.time.hour, a.time.minute).compareTo(DateTime(2020, 1, 1, b.time.hour, b.time.minute));
    });
    if (talksDay.isNotEmpty) {
      for (var talk in talksDay) {
        if (day.isBefore(DateTime(talk.day.year, talk.day.month, talk.day.day, talk.time.hour, talk.time.minute))) {
          return talk;
        }
      }
    }

    for ( var i = 0; i < days.length; i++ ) {
      if (days.elementAt(i).isAfter(day)) {
        return Talk.fetchByDay(days.elementAt(i))[0];
      }
    }
    return null;
  }
   */
}
