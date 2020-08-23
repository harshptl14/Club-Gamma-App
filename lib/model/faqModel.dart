class EventFaq {
  var name;
  var detail;

  EventFaq(
    this.name,
    this.detail,
  );

  EventFaq.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    detail = data['detail'];
  }
}
