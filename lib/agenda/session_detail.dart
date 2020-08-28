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

                  // Container(
                  //     height: MediaQuery.of(context).size.height * 0.28,
                  //     width: MediaQuery.of(context).size.width * 0.55,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(110),
                  //       color: Color(0xffffb3b3),
                  //     ),
                  //     // CircleAvatar(
                  //     //   backgroundColor: Color(0xffffb3b3),
                  //     // !ConfigBloc().darkModeOn
                  //     //                 ? Colors.white
                  //     //                 : Colors.black,
                  //     //radius: 100.0,
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(110),
                  //       child: FadeInImage.assetNetwork(
                  //         fit: BoxFit.cover,
                  //         image: session.photo,
                  //         placeholder: ConfigBloc().darkModeOn
                  //             ? ClubGamma.loadingblack
                  //             : ClubGamma.loading,
                  //       ),
                  //       // ),
                  //       // CachedNetworkImageProvider(
                  //       //   session.photo  != null ? session.photo : "https://i2.wp.com/quidtree.com/wp-content/uploads/2020/01/placeholder.png?fit=1200%2C800&ssl=1",
                  //       // ),
                  //     )),
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
