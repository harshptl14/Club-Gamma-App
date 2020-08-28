import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest/config/index.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';

class SessionDetail extends StatelessWidget {
  static const String routeName = "/session_detail";
  var session;

  SessionDetail({Key key, @required this.session}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Hero(
                  tag: session.name,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 110,
                    child: ClipOval(
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          image: session.photo,
                          placeholder: ConfigBloc().darkModeOn
                              ? ClubGamma.loadingblack
                              : ClubGamma.loading,
                        ),
                    ),
                  ),

                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Text(
              //   "${session.description}",
              //   textAlign: TextAlign.center,
              //   style: Theme.of(context).textTheme.title.copyWith(
              //         fontSize: 14,
              //         color: Tools.multiColors[Random().nextInt(4)],
              //       ),
              // ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${session.name != null ? session.name : ''}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),

              Text(
                session.session != null ? session.session : 'NO Data',
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 13),
              ),
              SizedBox(
                height: 2,
              ),

              Text(
                session.timeduration != null ? session.timeduration : 'NO Data',
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 13),
              ),

              SizedBox(
                height: 15,
              ),
              Text(
                session.description != null ? session.description : 'NO Data',
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),

              //socialActions(session),
            ],
          ),
        ),
      ),
      title: session.speaker != null ? session.speaker : '',
    );
  }
}
