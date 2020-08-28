class EventModel {
  var title;
  var description;
  var imageLink;
  var date;
  var time;
  var venue;
  var type;
  var regLink;
  var feedbackLink;
  var hashtag;
  List<Speaker> speaker;
  List<Sponsor> sponsor;

  EventModel(
      this.title,
      this.description,
      this.imageLink,
      this.date,
      this.time,
      this.venue,
      this.type,
      this.regLink,
      this.feedbackLink,
      this.hashtag,
      this.speaker,
      this.sponsor);

  EventModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    description = data['description'];
    imageLink = data['imageLinks'];
    date = data['date'];
    time = data['time'];
    venue = data['venue'];
    type = data['event_type'];
    regLink = data['registrationLink'];
    feedbackLink = data['feedbackLink'];
    hashtag = data['hashtag'];
    var list = data['speakers'] as List;
    var listSponser = data['sponsors'] as List;
    speaker = list.map((i) => Speaker.fromJson(i)).toList();
    sponsor = listSponser.map((i) => Sponsor.fromJson(i)).toList();
  }
}

class Speaker {
  var name;
  var post;
  var image;
  var designation;
  var linkedin;
  var twitter;
  var github;
  var instagram;

  Speaker(this.name, this.post, this.image, this.designation, this.linkedin,
      this.twitter, this.github, this.instagram);

  Speaker.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    post = data['post'];
    image = data['image'];
    designation = data['designation'];
    linkedin = data['linkedin'];
    twitter = data['twitter'];
    github = data['github'];
    instagram = data['instagram'];
  }
}

class Sponsor {
  var name;
  var type;
  var logo;

  Sponsor(this.name, this.type, this.logo);

  Sponsor.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    type = data['type'];
    logo = data['logo'];
  }
}
