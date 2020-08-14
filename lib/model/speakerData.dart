class Speaker {
  var name;
  var post;
  var image;
  var session;
  Speaker({this.name, this.post, this.image, this.session});

  Speaker.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    post = data['post'];
    image = data['image'];
    session = data['session'];
  }
}
