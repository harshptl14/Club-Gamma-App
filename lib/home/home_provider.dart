import 'dart:convert';
import 'package:flutter_devfest/model/agendaModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_devfest/home/team.dart';
import 'package:flutter_devfest/network/i_client.dart';
import 'package:flutter_devfest/utils/dependency_injection.dart';
import 'package:flutter_devfest/utils/devfest.dart';
import 'package:yaml/yaml.dart';

abstract class IHomeProvider {
  // Future<SpeakersData> getSpeakers();
  // Future<SessionsData> getSessions();
  Future<TeamsData> getTeams();
  getEvent();
  loadfromAPI();
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
    // DataConnectionStatus status = await checkInternet();
    // if (status == DataConnectionStatus.connected) {
      var res = await http.get(
          'https://raw.githubusercontent.com/harshptl14/Club-Gamma-App/Add-ons/events/event_details.yml');
      var result = await _client.getAsync(kConstGetEventsUrl);
      if (res.statusCode == 200) {
        var jsontolist = json.decode(json.encode(loadYaml(res.body)));
        return jsontolist;
      } else {
        throw Exception(result.networkServiceResponse.message);
      }
    // } else {
    //   showDialog(
    //     context: context,
    //     child: (context){

    //     }
    //   );
    // }
  }

  @override
  loadfromAPI() async {
    var res = await http.get(
        'https://raw.githubusercontent.com/harshptl14/Club-Gamma-App/Add-ons/events/agenda_details.yml');
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

  // @override
  // Future<SpeakersData> getSpeakers() async {
  //   var result = await _client.getAsync(kConstGetSpeakersUrl);
  //   if (result.networkServiceResponse.success) {
  //     SpeakersData res = SpeakersData.fromJson(result.mappedResult);
  //     return res;
  //   }

  //   throw Exception(result.networkServiceResponse.message);
  // }

  // @override
  // Future<SessionsData> getSessions() async {
  //   var result = await _client.getAsync(kConstGetSessionsUrl);
  //   if (result.networkServiceResponse.success) {
  //     SessionsData res = SessionsData.fromJson(result.mappedResult);
  //     return res;
  //   }

  //   throw Exception(result.networkServiceResponse.message);
  // }

  @override
  Future<TeamsData> getTeams() async {
    var result = await _client.getAsync(kConstGetTeamsUrl);
    if (result.networkServiceResponse.success) {
      TeamsData res = TeamsData.fromJson(result.mappedResult);
      return res;
    }

    throw Exception(result.networkServiceResponse.message);
  }

  // loadYaml(body) {}
  // @override
  // dispose() {
  //   super.dispose();
  // }

  
}
