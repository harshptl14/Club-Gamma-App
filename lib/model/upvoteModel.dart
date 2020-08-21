class Upvote {
  var name;
  var counter;

  Upvote(this.name, this.counter);

  Upvote.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    counter = data['counter'];
  }
}
