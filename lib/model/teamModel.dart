class Team {
  String name;
  String position;
  String image;
  String linkedin;
  String instagram;
  String twitter;
  String github;

  Team(
      {this.name,
      this.position,
      this.image,
      this.linkedin,
      this.instagram,
      this.twitter,
      this.github,
      });

  Team.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    position = json['position'];
    image = json['imageurl'];
    linkedin = json['linkedin'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    github = json['github'];
  }
}
