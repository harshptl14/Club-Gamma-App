import 'package:flutter/material.dart';
import 'package:flutter_devfest/agenda/session_list.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';

class AgendaPage extends StatelessWidget {
  static const String routeName = "/agenda";
  var agendaData;
  AgendaPage(this.agendaData);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: DevScaffold(
        title: "Agenda",
        body:  SessionList(allSessions: agendaData,),
      ),
    );
  }
}
