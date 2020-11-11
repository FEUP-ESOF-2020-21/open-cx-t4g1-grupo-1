import 'package:firebase_database/firebase_database.dart';
import 'models/talk.dart';
import 'package:flutter/material.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveTalk(Talk talk) {
  var id = databaseReference.child('talks/').push();

  id.set(talk.toJson());

  return id;
}

Future<List<Talk>> getAllTalks() async {
  /*we have to wait for the db to be queried
                                          we might have to wait for this to be finished*/
  DataSnapshot dataSnapshot =
      await databaseReference /* wait for this to finish */
          .child('talks/')
          .once();

  List<Talk> talks = [];

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Talk talk = createTalk(value);
      talk.setId(databaseReference.child('talks/' + key));
      talks.add(talk);
    });
  }

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
