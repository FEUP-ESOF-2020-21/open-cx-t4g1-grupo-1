class Conference {
  final String name;
  final DateTime start;
  final DateTime end;
  final String description;
  final List<String> sponsors;


  Conference(this.name, this.start, this.end, this.description, this.sponsors);

  static fetch() {
    List<String> sponsors = [];
    sponsors.add("Sponsor 1");
    sponsors.add("Sponsor 2");
    sponsors.add("Sponsor 3");
    sponsors.add("Sponsor 4");
    sponsors.add("Sponsor 5");
    sponsors.add("Sponsor 6");

    return Conference("Alpha Conference", DateTime(2020, 12, 15), DateTime(2020, 12, 20), "Best conference around Mars, brought to you by Eleon Muskee", sponsors);
  }
}