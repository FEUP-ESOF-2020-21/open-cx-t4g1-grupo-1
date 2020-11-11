import 'package:adov_flutter/database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Talk {
  DatabaseReference id;
  final String title;
  final String room;
  final TimeOfDay time;
  final DateTime day;
  final String details;
  final String imagePath;

  Talk(
      this.title, this.room, this.time, this.day, this.details, this.imagePath);

  static Talk fetchByID(DatabaseReference id) {
    List<Talk> list = [];
    getAllTalks().then((talks) => {list = talks});
    for (var i = 0; i < list.length; ++i) {
      if (list[i].id == id) return list[i];
    }
    return null;
  }

  static List<Talk> fetchByDay(DateTime day) {
    List<Talk> list = [];

    List<Talk> list1 = [];
    getAllTalks().then((talks) => {list1 = talks});

    list1.forEach((element) {
      if (element.day.compareTo(day) == 0) {
        list.add(element);
      }
    });
    return list;
  }

  static Set<DateTime> fetchDays() {
    List<Talk> list = [];
    getAllTalks().then((talks) => {list = talks});

    list.sort((a, b) => a.day.compareTo(b.day));
    Set<DateTime> days = new Set();
    
    for (var i = 0; i < list.length; ++i) {
      days.add(list[i].day);
      print(list[i].title);
    }
    return days;
  }

  void setId(DatabaseReference id) {
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
}
