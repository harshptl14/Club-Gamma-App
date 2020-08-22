import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest/home/index.dart';
import 'package:flutter_devfest/model/teamModel.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

var _homeBloc = HomeBloc();
var state = _homeBloc.currentState as InHomeState;
dynamic events = state.teamsData;

class TeamPage extends StatelessWidget {
  static const String routeName = "/team";

  Future<dynamic> loadTeam(team) async {
    var teammm = await team;
    return teammm;
  }

  Widget socialActions(context, temp) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.linkedin,
                size: 15,
              ),
              onPressed: () {
                launch(temp.linkedin);
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.twitter,
                size: 15,
              ),
              onPressed: () {
                launch(temp.twitter);
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.instagram,
                size: 15,
              ),
              onPressed: () {
                launch(temp.instagram);
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.github,
                size: 15,
              ),
              onPressed: () {
                launch(temp.github);
              },
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      body: FutureBuilder(
          future: loadTeam(events),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SpinKitWanderingCubes(
                  color: ClubGamma.contrastColor,
                ),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text('No data'),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (c, index) {
                  var temp = Team.fromJson(snapshot.data.elementAt(index));

                  return Card(
                    elevation: 0.0,
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ConstrainedBox(
                              constraints: BoxConstraints.expand(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                              child:
                                  //  CachedNetworkImage(
                                  //           fit: BoxFit.cover,
                                  //           imageUrl: temp.image,
                                  //         ),
                                  FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                image: temp.image,
                                placeholder: ClubGamma.loading,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        temp.name,
                                        style:
                                            Theme.of(context).textTheme.title,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      AnimatedContainer(
                                        duration: Duration(seconds: 1),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        height: 5,
                                        color: ClubGamma.contrastColor,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    temp.position,
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),

                                  // Text(
                                  //   temp.post,
                                  //   style: Theme.of(context).textTheme.caption,
                                  // ),
                                  socialActions(context, temp),
                                ],
                              ),
                            )
                          ],
                        )),
                  );
                },
                itemCount: snapshot.data.length,
              );
            }
          }),
      title: "Team",
    );
  }
}
