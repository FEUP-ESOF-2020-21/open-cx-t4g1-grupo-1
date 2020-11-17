import 'package:adov_flutter/models/Conference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TalksDatabase {
  static var collectionReference = FirebaseFirestore.instance.collection('talks');

  static DocumentReference conferenceRef = FirebaseFirestore.instance.doc('conference/details');


  static var TAG = "TalksDatabase: ";

  static Future<Map> getConferenceStats() async {
    Set<DateTime> days = Set();
    int talks = 0;

    await collectionReference.get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        days.add(
          DateTime(
            element.data()["year"],
            element.data()["month"],
            element.data()["day"],
          )
        );
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

}