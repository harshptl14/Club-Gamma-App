import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_devfest/dialogs/error_dialog.dart';
import 'package:flutter_devfest/home/home_widgets/mainFile.dart';
import 'package:flutter_devfest/home/index.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
    @required HomeBloc homeBloc,
  })  : _homeBloc = homeBloc,
        super(key: key);

  final HomeBloc _homeBloc;

  @override
  HomeScreenState createState() {
    return HomeScreenState(_homeBloc);
  }
}

class HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc;
  HomeScreenState(this._homeBloc);

  @override
  void initState() {
    super.initState();
    this._homeBloc.dispatch(LoadHomeEvent(checkInternet()));
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  StreamSubscription<DataConnectionStatus> listener;
  checkInternet() async {
    print("The statement 'this machine is connected to the Internet' is: ");
    print(await DataConnectionChecker().hasConnection);

    print("Current status: ${await DataConnectionChecker().connectionStatus}");

    print("Last results: ${DataConnectionChecker().lastTryResults}");
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          break;
      }
    });

    //await Future.delayed(Duration(seconds: 30));
    return await DataConnectionChecker().connectionStatus;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: widget._homeBloc,
      listener: (context, state) {
        if (state is ErrorHomeState) {
          // showDialog(
          //   context: context,
          //   barrierDismissible: false,
          //   builder: (context) => ErrorDialog(
          //     error: state.errorMessage,
          //     onTap: () {
          //       _homeBloc.dispatch(LoadHomeEvent(checkInternet()));
          //     },
          //   ),
          // );
          Container();
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
          bloc: widget._homeBloc,
          builder: (
            BuildContext context,
            HomeState currentState,
          ) {
            if (currentState is UnHomeState) {
              return Center(
                child: SpinKitWanderingCubes(
                  color: ClubGamma.contrastColor,
                ),
              );
            }
            if (currentState is ErrorHomeState) {
              return Container(
                  color: ClubGamma.contrastColor,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ClubGamma.intenetError),
                      Center(
                        child: Text(
                          currentState.errorMessage ?? 'Error',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // RaisedButton(
                      //   color: Colors.black,
                      //   textColor: Colors.white,
                      //   child: Text('Try Again'),
                      //   onPressed: () {
                      //   _homeBloc.dispatch(LoadHomeEvent(checkInternet()));
                      // })
                      RaisedButton(
                          highlightElevation: 0,
                          hoverElevation: 0,
                          elevation: 0,
                          // hoverColor: Colors.grey,
                          color: Colors.black,
                          disabledElevation: 0.0,
                          highlightColor: Colors.white,
                          child: Text(
                            'Try again',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            _homeBloc.dispatch(LoadHomeEvent(checkInternet()));
                          }),
                    ],
                  ));
            }
            return Mainpage();
          }),
    );
  }
}
