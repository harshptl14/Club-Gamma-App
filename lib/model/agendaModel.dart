class Agenda {
  List<Data> agendaList;

  Agenda(this.agendaList);
  Agenda.fromJson(Map<String, dynamic> data) {
    var list = data['agenda'] as List;
    agendaList = list.map((i) => Data.fromJson(i)).toList();
  }
}

class Data {
  var name;
  var time;
  var photo;
  var duration;
  var speaker;
  var description;
  var timeduration;
  var session;

  Data(this.name, this.time, this.photo, this.duration, this.speaker,
      this.description, this.timeduration, this.session);

  Data.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    time = data['time'];
    photo = data['photo'];
    duration = data['duration'];
    speaker = data['speaker'];
    description = data['discription'];
    timeduration = data['timeduration'];
    session = data['session'];
  }
}
