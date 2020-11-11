import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/talk.dart';
import 'package:flutter/material.dart';

final collectionReference = FirebaseFirestore.instance.collection('talks');

Future<DocumentReference> saveTalk(Talk talk) {
  var documentReference = collectionReference.add(talk.toJson());

  return documentReference;
}

Future getTalks() async {
  List talks = [];

  await collectionReference.get().then((querySnapshot) {
    querySnapshot.docs.forEach((element) {
      talks.add(createTalk(element.data()));
    });
  });
  return talks;
}

Talk createTalk(dbTalk) {
  Map<String, dynamic> attributes = {
    'title': '',
    'room': '',
    'hour': 0,
    'min': 0,
    'month': 0,
    'day': 0,
    'year': 0,
    'details': '',
    'imagePath': ''
  };

  dbTalk.forEach((key, value) => {attributes[key] = value});

  var time = TimeOfDay(hour: attributes['hour'], minute: attributes['min']);

  var day = new DateTime.utc(
      attributes['year'], attributes['month'], attributes['day']);

  Talk talk = new Talk(attributes['title'], attributes['room'], time, day,
      attributes['details'], attributes['imagePath']);

  return talk;
}
