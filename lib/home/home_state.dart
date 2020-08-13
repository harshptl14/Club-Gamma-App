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
  final dynamic speakerData;
  final dynamic eventData;
  // final SpeakersData speakersData;
  // final SessionsData sessionsData;
  final TeamsData teamsData;

  InHomeState({
    @required this.eventData,
    @required this.speakerData,
    // @required this.speakersData,
    // @required this.sessionsData,
    @required this.teamsData
  }) : super([
          eventData, speakerData,
          //speakersData, sessionsData, 
          teamsData
        ]);
  @override
  String toString() => 'InHomeState';

  @override
  HomeState getStateCopy() {
    return InHomeState(
      speakerData: this.speakerData,
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
