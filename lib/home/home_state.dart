import 'package:equatable/equatable.dart';
import 'package:flutter_devfest/home/team.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([Iterable props]) : super(props);

  /// Copy object for use in action
  HomeState getStateCopy();
}

/// UnInitialized
class UnHomeState extends HomeState {
  @override
  String toString() => 'UnHomeState';

  @override
  HomeState getStateCopy() {
    return UnHomeState();
  }
}

/// Initialized
class InHomeState extends HomeState {
 final dynamic agendaData;
  final dynamic eventData;
  // final SpeakersData speakersData;
  // final SessionsData sessionsData;
  final TeamsData teamsData;

  InHomeState({
    @required this.eventData,
    @required this.agendaData,
    // @required this.speakersData,
    // @required this.sessionsData,
    @required this.teamsData
  }) : super([
          eventData, 
          agendaData,
          //speakersData, sessionsData, 
          teamsData
        ]);
  @override
  String toString() => 'InHomeState';

  @override
  HomeState getStateCopy() {
    return InHomeState(
      agendaData: this.agendaData,
      eventData: this.eventData,
      // speakersData: this.speakersData,
      // sessionsData: this.sessionsData,
      teamsData: this.teamsData
    );
  }
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState(this.errorMessage);

  @override
  String toString() => 'ErrorHomeState';

  @override
  HomeState getStateCopy() {
    return ErrorHomeState(this.errorMessage);
  }
}
