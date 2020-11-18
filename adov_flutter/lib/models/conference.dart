class Conference {
  final String title;
  final DateTime start;
  final DateTime end;
  final String description;
  final List<String> sponsors;

  Conference(this.title, this.start, this.end, this.description, this.sponsors);

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'start': {
        'day': this.start.day,
        'month': this.start.month,
        'year': this.start.year,
      },
      'end': {
        'day': this.end.day,
        'month': this.end.month,
        'year': this.end.year,
      },
      'description': this.description,
      'sponsors': this.sponsors
    };
  }

  static Conference fromJson(data) {
    var conference = Conference(data['title'],
        DateTime(data['start']['year'], data['start']['month'], data['start']['day']),
        DateTime(data['end']['year'], data['end']['month'], data['end']['day']),
        data['description'], (data['sponsors'] as List).map((itemWord) => itemWord as String).toList());

    return conference;
  }
}