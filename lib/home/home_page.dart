import 'package:flutter/material.dart';
import 'package:flutter_devfest/home/index.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    return Scaffold(
      body: HomeScreen(homeBloc: _homeBloc),
    );
  }
}
