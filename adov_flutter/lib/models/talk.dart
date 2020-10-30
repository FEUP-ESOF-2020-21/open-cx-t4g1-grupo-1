class Talk {
  final int id;
  final String name;
  final String room;
  final DateTime time;
  final String details;
  final String imagePath;

  Talk(this.id, this.name, this.room, this.time, this.details, this.imagePath);

  static List<Talk> fetchAll() {
    return [
      Talk(1, "Talk 1", "B202", DateTime(2020, 12, 15, 10, 20),
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in libero nulla. Pellentesque pharetra ornare ullamcorper. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque et tortor urna. Aenean ultrices varius tortor, nec imperdiet elit venenatis at. Donec iaculis dolor vitae egestas efficitur. Pellentesque fermentum tortor in mauris eleifend, sed tempor ex faucibus. Curabitur varius porttitor dignissim. Duis risus lorem, luctus et tellus et, lobortis laoreet ligula. Donec sollicitudin nec magna non imperdiet."
          , 'assets/images/kiyomizu-dera.jpg'),
      Talk(2, "Talk 2", "B203", DateTime(11, 15), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(3, "Talk 3", "B204", DateTime(12, 15), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(4, "Talk 4", "B205", DateTime(13, 15), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(5, "Talk 1", "B206", DateTime(14, 15), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(6, "Talk 1", "B207", DateTime(15, 15), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(7, "Talk 1", "B208", DateTime(16, 15), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
      Talk(8, "Talk 1", "B209", DateTime(17, 15), "Lorem Ipsum", 'assets/images/kiyomizu-dera.jpg'),
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

}