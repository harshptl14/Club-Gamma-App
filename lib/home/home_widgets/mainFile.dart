import 'package:flutter/material.dart';
import 'package:flutter_devfest/home/home_widgets/CompletedEvent.dart';
import 'package:flutter_devfest/home/home_widgets/EventPage.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';

class Mainpage extends StatelessWidget {
  static const String routeName = "/agenda";

  @override
  Widget build(BuildContext context) {
    // var _homeBloc = HomeBloc();
    return DefaultTabController(
      length: 2,
      child: DevScaffold(
        settingsIcon: true,
        title: "Home",
        tabBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Color(0xffD31E3C),
          labelStyle: TextStyle(
            fontSize: 12,
          ),
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              child: Text("Upcoming"),
            ),
            Tab(
              child: Text("Completed"),
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            EventPage(),
            CompletedEvent(),
          ],
        ),
      ),
    );
  }
}
