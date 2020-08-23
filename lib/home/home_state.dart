import 'package:equatable/equatable.dart';
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
  final dynamic galleryData;
  final dynamic teamsData;
  final dynamic faqData;

  InHomeState(
      {@required this.eventData,
      @required this.agendaData,
      @required this.galleryData,
      @required this.teamsData,
      @required this.faqData
      })
      : super([eventData, agendaData, galleryData, teamsData, faqData]);
  @override
  String toString() => 'InHomeState';

  @override
  HomeState getStateCopy() {
    return InHomeState(
        agendaData: this.agendaData,
        eventData: this.eventData,
        galleryData: this.galleryData,
        teamsData: this.teamsData,
        faqData: this.faqData,
        );
  }
}

class ErrorHomeState extends HomeState {
  String errorMessage =
      'There is a Problem! Can you please check your Internet connection?!';

  ErrorHomeState();

  // @override
  // String toString() => 'ErrorHomeState';

  @override
  HomeState getStateCopy() {
    return ErrorHomeState();
  }
}
