import 'package:flutter/material.dart';

import 'Day.dart';

class Talk {
  final int id;
  final String name;
  final String room;
  final TimeOfDay time;
  final Day day;
  final String details;
  final String imagePath;

  Talk(this.id, this.name, this.room, this.time, this.day, this.details, this.imagePath);

  static List<Talk> fetchAll() {
    return [
      Talk(1, "Talk 1", "B202", TimeOfDay(hour: 15, minute: 15), Day(1, DateTime(2020, 12, 15, 10, 20)),
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in libero nulla. Pellentesque pharetra ornare ullamcorper. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque et tortor urna. Aenean ultrices varius tortor, nec imperdiet elit venenatis at. Donec iaculis dolor vitae egestas efficitur. Pellentesque fermentum tortor in mauris eleifend, sed tempor ex faucibus. Curabitur varius porttitor dignissim. Duis risus lorem, luctus et tellus et, lobortis laoreet ligula. Donec sollicitudin nec magna non imperdiet."
          , 'assets/images/kiyomizu-dera.jpg'),
      Talk(2, "Talk 2", "B203", TimeOfDay(hour: 15, minute: 15), Day(1, DateTime(2020, 12, 15, 10, 20)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(3, "Talk 3", "B204", TimeOfDay(hour: 16, minute: 15), Day(2, DateTime(2020, 12, 16, 10, 20)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(4, "Talk 4", "B205", TimeOfDay(hour: 13, minute: 15), Day(2, DateTime(2020, 12, 16, 10, 20)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(5, "Talk 5", "B206", TimeOfDay(hour: 10, minute: 15), Day(2, DateTime(2020, 12, 16, 10, 20)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(6, "Talk 6", "B207", TimeOfDay(hour: 20, minute: 15), Day(3, DateTime(2020, 12, 17, 10, 20)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(7, "Talk 7", "B208", TimeOfDay(hour: 19, minute: 15), Day(3, DateTime(2020, 12, 17, 10, 20)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(8, "Talk 8", "B209", TimeOfDay(hour: 12, minute: 15), Day(4, DateTime(2020, 12, 18, 10, 20)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(9, "Talk 9", "B209", TimeOfDay(hour: 12, minute: 15), Day(4, DateTime(2020, 12, 18, 10, 20)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(10, "Talk 10", "B209", TimeOfDay(hour: 12, minute: 15), Day(4, DateTime(2020, 12, 18, 10, 20)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(11, "Talk 11", "B209", TimeOfDay(hour: 15, minute: 15), Day(4, DateTime(2020, 12, 18, 10, 20)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(12, "Talk 12", "B209", TimeOfDay(hour: 13, minute: 15), Day(5, DateTime(2020, 12, 19, 10, 22)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(13, "Talk 13", "B209", TimeOfDay(hour: 12, minute: 15), Day(5, DateTime(2020, 12, 19, 10, 22)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(14, "Talk 14", "B209", TimeOfDay(hour: 17, minute: 15), Day(5, DateTime(2020, 12, 19, 10, 22)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(15, "Talk 15", "B209", TimeOfDay(hour: 18, minute: 30), Day(5, DateTime(2020, 12, 19, 10, 22)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(16, "Talk 16", "B209", TimeOfDay(hour: 9, minute: 15), Day(6, DateTime(2020, 12, 20, 10, 23)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(17, "Talk 17", "B209", TimeOfDay(hour: 17, minute: 15), Day(6, DateTime(2020, 12, 20, 10, 23)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(18, "Talk 18", "B209", TimeOfDay(hour: 13, minute: 15), Day(6, DateTime(2020, 12, 20, 10, 23)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(19, "Talk 19", "B209", TimeOfDay(hour: 18, minute: 15), Day(6, DateTime(2020, 12, 20, 10, 23)), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
    ];
  }

  static Talk fetchByID(int id) {
    List<Talk> list = fetchAll();
    for (var i = 0; i < list.length; ++i) {
      if (list[i].id == id)
        return list[i];
    }
    return null;
  }

  static List<Talk> fetchByDay(int day) {
    List<Talk> list = [];
    fetchAll().forEach((element) {
      if (element.day.day == day) {
        list.add(element);
      }
    });
    return list;
  }

  static Set<int> fetchDays() {
    List<Talk> list = fetchAll();
    Set<int> days = new Set();

    for (var i = 0; i < list.length; ++i) {
      days.add(list[i].day.day);
    }
    return days;
  }

}