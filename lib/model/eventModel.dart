class EventModel {
  var title;
  var description;
  var imageLink;
  var date;
  var time;
  var venue;
  var regLink;

  EventModel(this.title, this.description, this.imageLink, this.date, this.time,
      this.venue, this.regLink);

  EventModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    description = data['description'];
    imageLink = data['imageLinks'];
    date = data['date'];
    time = data['time'];
    venue = data['venue'];
    regLink = data['registrationLink'];
  }
}
