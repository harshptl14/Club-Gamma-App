class Team {
  String name;
  String position;
  String post;
  String image;
  String linkedin;
  String instagram;
  String twitter;
  String github;

  Team(
      {this.name,
      this.position,
      this.post,
      this.image,
      this.linkedin,
      this.instagram,
      this.twitter,
      this.github,
      });

  Team.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    position = json['position'];
    post = json['post'];
    image = json['imageurl'];
    linkedin = json['linkedin'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    github = json['github'];
  }
}
