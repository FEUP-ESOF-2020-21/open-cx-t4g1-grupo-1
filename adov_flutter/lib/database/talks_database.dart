import 'package:adov_flutter/models/conference.dart';
import 'package:adov_flutter/models/talk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  static auxiliar() async {
    var list = [
      Talk("Talk 1", "B202", TimeOfDay(hour: 15, minute: 15), DateTime(2020, 12, 15),
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in libero nulla. Pellentesque pharetra ornare ullamcorper. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque et tortor urna. Aenean ultrices varius tortor, nec imperdiet elit venenatis at. Donec iaculis dolor vitae egestas efficitur. Pellentesque fermentum tortor in mauris eleifend, sed tempor ex faucibus. Curabitur varius porttitor dignissim. Duis risus lorem, luctus et tellus et, lobortis laoreet ligula. Donec sollicitudin nec magna non imperdiet."
          , 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 2", "B203", TimeOfDay(hour: 15, minute: 15), DateTime(2020, 12, 15), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 3", "B204", TimeOfDay(hour: 16, minute: 15), DateTime(2020, 12, 16), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 4", "B205", TimeOfDay(hour: 13, minute: 15), DateTime(2020, 12, 16), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 5", "B206", TimeOfDay(hour: 10, minute: 15), DateTime(2020, 12, 16), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 6", "B207", TimeOfDay(hour: 20, minute: 15), DateTime(2020, 12, 17), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 7", "B208", TimeOfDay(hour: 19, minute: 15), DateTime(2020, 12, 17), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 8", "B209", TimeOfDay(hour: 12, minute: 15), DateTime(2020, 12, 18), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 9", "B209", TimeOfDay(hour: 12, minute: 15), DateTime(2020, 12, 18), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 10", "B209", TimeOfDay(hour: 12, minute: 15), DateTime(2020, 12, 18), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 11", "B209", TimeOfDay(hour: 15, minute: 15), DateTime(2020, 12, 18), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 12", "B209", TimeOfDay(hour: 13, minute: 15), DateTime(2020, 12, 19), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk( "Talk 13", "B209", TimeOfDay(hour: 12, minute: 15), DateTime(2020, 12, 19), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 14", "B209", TimeOfDay(hour: 17, minute: 15), DateTime(2020, 12, 19), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 15", "B209", TimeOfDay(hour: 18, minute: 30), DateTime(2020, 12, 19), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 16", "B209", TimeOfDay(hour: 9, minute: 15), DateTime(2020, 12, 20), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 17", "B209", TimeOfDay(hour: 17, minute: 15), DateTime(2020, 12, 20), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 18", "B209", TimeOfDay(hour: 13, minute: 15), DateTime(2020, 12, 20), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 19", "B209", TimeOfDay(hour: 18, minute: 15), DateTime(2020, 12, 20), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
    ];

    list.forEach((element) async {
      await saveTalk(element);
    });
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

  static deleteTalk(Talk talk) async {
    talk.id.delete();
    await conferenceRef.get().then((value) {
      conferenceRef.update({'talks': --value.data()['talks']});
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
          conferenceRef.update({'days': --value.data()['days']});
        });
    });

  }

  static Talk createTalkFromSnapshot(DocumentSnapshot data) {
    var talk = Talk(data["title"], data["room"], TimeOfDay(hour: data["hour"], minute: data["min"]), DateTime(data["year"], data["month"], data["day"]), data["details"], data["imagePath"]);
    talk.setId(data.reference);
    return talk;
  }

  static addTalksToDatabase() async {
    var talks = [
      Talk("Talk 1", "B202", TimeOfDay(hour: 15, minute: 15), DateTime(2020, 12, 15),
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in libero nulla. Pellentesque pharetra ornare ullamcorper. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque et tortor urna. Aenean ultrices varius tortor, nec imperdiet elit venenatis at. Donec iaculis dolor vitae egestas efficitur. Pellentesque fermentum tortor in mauris eleifend, sed tempor ex faucibus. Curabitur varius porttitor dignissim. Duis risus lorem, luctus et tellus et, lobortis laoreet ligula. Donec sollicitudin nec magna non imperdiet."
          , 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 2", "B203", TimeOfDay(hour: 15, minute: 20), DateTime(2020, 12, 15), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 3", "B204", TimeOfDay(hour: 16, minute: 15), DateTime(2020, 12, 16), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 4", "B205", TimeOfDay(hour: 13, minute: 15), DateTime(2020, 12, 16), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 5", "B206", TimeOfDay(hour: 10, minute: 15), DateTime(2020, 12, 16), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 6", "B207", TimeOfDay(hour: 20, minute: 15), DateTime(2020, 12, 17), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 7", "B208", TimeOfDay(hour: 19, minute: 15), DateTime(2020, 12, 17), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 8", "B209", TimeOfDay(hour: 12, minute: 15), DateTime(2020, 12, 18), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 9", "B209", TimeOfDay(hour: 12, minute: 15), DateTime(2020, 12, 18), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 10", "B209", TimeOfDay(hour: 12, minute: 15), DateTime(2020, 12, 18), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 11", "B209", TimeOfDay(hour: 15, minute: 15), DateTime(2020, 12, 18), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 12", "B209", TimeOfDay(hour: 13, minute: 15), DateTime(2020, 12, 19), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 13", "B209", TimeOfDay(hour: 12, minute: 15), DateTime(2020, 12, 19), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 14", "B209", TimeOfDay(hour: 17, minute: 15), DateTime(2020, 12, 19), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 15", "B209", TimeOfDay(hour: 18, minute: 30), DateTime(2020, 12, 19), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 16", "B209", TimeOfDay(hour: 9, minute: 15), DateTime(2020, 12, 20), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 17", "B209", TimeOfDay(hour: 17, minute: 15), DateTime(2020, 12, 20), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 18", "B209", TimeOfDay(hour: 13, minute: 15), DateTime(2020, 12, 20), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk("Talk 19", "B209", TimeOfDay(hour: 18, minute: 15), DateTime(2020, 12, 20), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
    ];

    talks.forEach((element) {
      saveTalk(element);
    });

    conferenceRef.update({
      'days': 6,
      'talks': 19,
    });
  }

  static removeTalksFromDatabase() async {
    collectionReference.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
    conferenceRef.update({
      'days': 0,
      'talks': 0,
    });
  }
}
