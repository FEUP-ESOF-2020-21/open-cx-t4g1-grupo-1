
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/talk.dart';
import 'package:flutter/material.dart';

final collectionReference = FirebaseFirestore.instance.collection('talks');

Future<DocumentReference> saveTalk(Talk talk) {
  var documentReference = collectionReference.add(talk.toJson());

  return documentReference;
}

Future<List<Talk>> getTalks() async {
  List<Talk> talks = [];

  await collectionReference.get().then((querySnapshot) {
    querySnapshot.docs.forEach((element) {
      talks.add(createTalk(element.data(), element.id));
      // print("getTalks(): " + element.data().toString());
    });
  });
  return talks;
}

Talk createTalk(dbTalk, String id) {
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

  var day = DateTime(
      attributes['year'], attributes['month'], attributes['day']);

  Talk talk = Talk(attributes['title'], attributes['room'], time, day,
      attributes['details'], attributes['imagePath']);

  talk.setId(collectionReference.doc(id));

  // print("CreateTalk(): ID: " + id + "\n" + talk.toJson().toString());

  return talk;
}

Talk createTalkFromSnapshot(DocumentSnapshot data) {
  return Talk(data["title"], data["room"], TimeOfDay(hour: data["hour"], minute: data["min"]), DateTime(data["year"], data["month"], data["day"]), data["details"], data["imagePath"]);
}
