class Speaker {
  var name;
  var post;
  var image;
  var designation;
  Speaker({this.name, this.post, this.image, this.designation});

  Speaker.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    post = data['post'];
    image = data['image'];
    designation = data['designation'];
  }
}
