class Talk {
  final int id;
  final String name;
  final String room;
  final DateTime time;
  final int day;
  final String details;
  final String imagePath;

  Talk(this.id, this.name, this.room, this.time, this.day, this.details, this.imagePath);

  static List<Talk> fetchAll() {
    return [
      Talk(1, "Talk 1", "B202", DateTime(2020, 12, 15, 10, 20), 1,
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in libero nulla. Pellentesque pharetra ornare ullamcorper. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque et tortor urna. Aenean ultrices varius tortor, nec imperdiet elit venenatis at. Donec iaculis dolor vitae egestas efficitur. Pellentesque fermentum tortor in mauris eleifend, sed tempor ex faucibus. Curabitur varius porttitor dignissim. Duis risus lorem, luctus et tellus et, lobortis laoreet ligula. Donec sollicitudin nec magna non imperdiet."
          , 'assets/images/kiyomizu-dera.jpg'),
      Talk(2, "Talk 2", "B203", DateTime(2020, 12, 15, 10, 20), 1, "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(3, "Talk 3", "B204", DateTime(2020, 12, 15, 10, 21), 2, "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(4, "Talk 4", "B205", DateTime(2020, 12, 15, 10, 21), 2, "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(5, "Talk 5", "B206", DateTime(2020, 12, 15, 10, 21), 2, "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(6, "Talk 6", "B207", DateTime(2020, 12, 15, 10, 22), 3, "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(7, "Talk 7", "B208", DateTime(2020, 12, 15, 10, 22), 3, "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(8, "Talk 8", "B209", DateTime(2020, 12, 15, 10, 23), 4, "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
    ];
  }

  static Map<int, Talk> fetchWithDay() {
    return Map.fromIterable(fetchAll(), key: (e) => e.day, value: (e) => e);
  }

  static Talk fetchByID(int id) {
    List<Talk> list = fetchAll();
    for (var i = 0; i < list.length; ++i) {
      if (list[i].id == id)
        return list[i];
    }
    return null;
  }

}