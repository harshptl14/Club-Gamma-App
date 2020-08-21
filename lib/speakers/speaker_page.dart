import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakerPage extends StatelessWidget {
  static const String routeName = "/speakers";
  var speakerData;
  SpeakerPage(this.speakerData);
  Widget socialActions(context, speaker) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.instagram,
                size: 15,
              ),
              onPressed: () {
                launch(speaker.instagram);
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.twitter,
                size: 15,
              ),
              onPressed: () {
                launch(speaker.twitter);
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.linkedinIn,
                size: 15,
              ),
              onPressed: () {
                launch(speaker.linkedin);
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.github,
                size: 15,
              ),
              onPressed: () {
                launch(speaker.github);
              },
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    // var _homeBloc = HomeBloc();
    // var state = _homeBloc.currentState as InHomeState;
    // var speakers = state.speakerData;
    return DevScaffold(
      body: speakerData.speaker[0].name != null
          ? ListView.builder(
              shrinkWrap: true,
              itemBuilder: (c, index) {
                return Card(
                  elevation: 0.0,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints.expand(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: speakerData.speaker[index].image,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      speakerData.speaker[index].name,
                                      // ignore: deprecated_member_use
                                      style: Theme.of(context).textTheme.title,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    AnimatedContainer(
                                      duration: Duration(seconds: 1),
                                      width: MediaQuery.of(context).size.width *
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
                                  speakerData.speaker[index].post,
                                  // ignore: deprecated_member_use
                                  style: Theme.of(context).textTheme.subtitle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  speakerData.speaker[index].session,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                socialActions(
                                    context, speakerData.speaker[index]),
                              ],
                            ),
                          )
                        ],
                      )),
                );
              },
              itemCount: speakerData.speaker.length,
            )
          :  Center(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:  MediaQuery.of(context).size.height * 0.4,
                    width:  MediaQuery.of(context).size.width * 0.7,
                    child: Image.asset(
                    ClubGamma.comingsoon),),

                    Container(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Text('Coming Soon!', style: TextStyle(
                        fontSize: 16
                      ),),
                    ),
                ],
              )
            ),
          ),
      title: "Speakers",
    );
  }
}
