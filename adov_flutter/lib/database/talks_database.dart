import 'package:adov_flutter/models/Conference.dart';
import 'package:adov_flutter/models/talk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TalksDatabase {
  static var collectionReference =
      FirebaseFirestore.instance.collection('talks');

  static DocumentReference conferenceRef =
      FirebaseFirestore.instance.doc('conference/details');

  static var TAG = "TalksDatabase: ";

  static Future<Map> getConferenceStats() async {
    Set<DateTime> days = Set();
    int talks = 0;

    await collectionReference.get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        days.add(DateTime(
          element.data()["year"],
          element.data()["month"],
          element.data()["day"],
        ));
        talks++;
      });
    });
    return {"talks": talks, "days": days.length};
  }

  static Future<Conference> getConferenceDetails() async {
    var conference;

    await conferenceRef.get().then((value) {
      Map<String, dynamic> attributes = Map();
      value.data().forEach((key, value) => {attributes[key] = value});
      conference = Conference.fromJson(attributes);
    });

    return conference;
  }

  static Future<DocumentReference> saveTalk(Talk talk) async {
    await conferenceRef.get().then((value) {
      conferenceRef.update({'talks': ++value.data()['talks']});
    });
    var days = [];
    await collectionReference.get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        days.add(
          DateTime(
            element.data()["year"],
            element.data()["month"],
            element.data()["day"],)
        );
      });
      var dayPresent = false;
      days.forEach((element) {
        if ((element.day == talk.day.day) && (element.month == talk.day.month) && (element.year == talk.day.year)) {
          dayPresent = true;
          return;
        }
      });
      if (!dayPresent)
        conferenceRef.get().then((value) {
          conferenceRef.update({'days': ++value.data()['days']});
        });
    });

    var documentReference = collectionReference.add(talk.toJson());

    return documentReference;
  }
}
