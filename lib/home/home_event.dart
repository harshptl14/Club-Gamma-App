import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_devfest/home/home_provider.dart';
import 'package:flutter_devfest/home/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent {
  Future<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});
}

class LoadHomeEvent extends HomeEvent {
  final IHomeProvider _homeProvider = HomeProvider();
  dynamic checkInternet;
  LoadHomeEvent(this.checkInternet);
  @override
  String toString() => 'LoadHomeEvent';

  @override
  Future<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async {
   // try {
      DataConnectionStatus status = await checkInternet;
      if (status == DataConnectionStatus.connected){
        dynamic eventData = await _homeProvider.getEvent();
      //  dynamic speakerData = await _homeProvider.loadfromAPI();
      var agendaData = await _homeProvider.loadfromAPI();
      // var sessionsData = await _homeProvider.getSessions();
      var teamsData = await _homeProvider.getTeams();
      return InHomeState(
        eventData: eventData,
        agendaData: agendaData,
        // speakersData: speakersData,
        // sessionsData: sessionsData,
        teamsData: teamsData,
      );
    } else{
      //catch (_, stackTrace) {
      //print('$_ $stackTrace');
      return ErrorHomeState();
    }
  }
}
