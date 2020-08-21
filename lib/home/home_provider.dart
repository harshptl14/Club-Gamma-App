import 'dart:convert';
import 'package:flutter_devfest/model/agendaModel.dart';
import 'package:flutter_devfest/model/upvoteModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_devfest/home/team.dart';
import 'package:flutter_devfest/network/i_client.dart';
import 'package:flutter_devfest/utils/dependency_injection.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:yaml/yaml.dart';

abstract class IHomeProvider {
  Future<TeamsData> getTeams();
  getEvent();
  loadfromAPI();
  getGallery();
}

class HomeProvider implements IHomeProvider {
  IClient _client;

  static final String kConstGetEventsUrl =
      "${ClubGamma.baseUrl}/event_details.yml";

  //! Not Working
  static final String kConstGetSessionsUrl =
      "${ClubGamma.baseUrl}/agenda_details.yml";

  //! Not Working
  static final String kConstGetTeamsUrl = "${ClubGamma.baseUrl}/team-kol.json";

  HomeProvider() {
    _client = Injector().currentClient;
  }

  @override
  getEvent() async {
    var res = await http.get(
        'https://raw.githubusercontent.com/harshptl14/ClubGammaData/master/events/event_details.yml');
    var result = await _client.getAsync(kConstGetEventsUrl);
    if (res.statusCode == 200) {
      var jsontolist = json.decode(json.encode(loadYaml(res.body)));
      return jsontolist;
    } else {
      throw Exception(result.networkServiceResponse.message);
    }
  }

  @override
  loadfromAPI() async {
    var res = await http.get(
        'https://raw.githubusercontent.com/harshptl14/ClubGammaData/master/events/agenda_details.yml');
    var result = await _client.getAsync(kConstGetSessionsUrl);
    var list = List<Agenda>();
    if (res.statusCode == 200) {
      var eventJson = json.decode(json.encode(loadYaml(res.body)));
      print('data');
      print(eventJson);
      for (var eventJson in eventJson) {
        list.add(Agenda.fromJson(eventJson));
      }
      return list;
    } else {
      throw Exception(result.networkServiceResponse.message);
    }
    //EventModel ress = EventModel.loadfromAPI(list);
  }

  getGallery() async {
    var res = await http.get(
        'https://raw.githubusercontent.com/harshptl14/ClubGammaData/master/events/gallery_details.yml');
    var result = await _client.getAsync(kConstGetEventsUrl);
    if (res.statusCode == 200) {
      var jsontolistt = json.decode(json.encode(loadYaml(res.body)));
      return jsontolistt;
    } else {
      throw Exception(result.networkServiceResponse.message);
    }
  }

  Future<Upvote> fetchAlbum() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsontolistt = json.decode(response.body);
      return jsontolistt;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Upvote> updateAlbum(String title) async {
    final http.Response response = await http.put(
      'https://jsonplaceholder.typicode.com/albums/1',
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsontolistt = json.decode(response.body);

      return jsontolistt;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update album.');
    }
  }

  @override
  Future<TeamsData> getTeams() async {
    var result = await _client.getAsync(kConstGetTeamsUrl);
    if (result.networkServiceResponse.success) {
      TeamsData res = TeamsData.fromJson(result.mappedResult);
      return res;
    }

    throw Exception(result.networkServiceResponse.message);
  }
}
