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
}
