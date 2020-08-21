import 'package:flutter/material.dart';
import 'package:flutter_devfest/agenda/session_detail.dart';
import 'package:flutter_devfest/config/config_bloc.dart';
import 'package:flutter_devfest/home/index.dart';
import 'package:flutter_devfest/model/upvoteModel.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:flutter_devfest/utils/tools.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UpvoteEvent extends StatefulWidget {
  @override
  _UpvoteEventState createState() => _UpvoteEventState();
}

var _homeBloc = HomeBloc();
var state = _homeBloc.currentState as InHomeState;
dynamic events = state.eventData;
var allSessions;

Future<dynamic> loadEvent(agenda) async {
  var eventtt = await agenda;
  return eventtt;
}

class _UpvoteEventState extends State<UpvoteEvent> {
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
        title: 'Upvote',
        // allSessions.agendaList[0].time != null
        //     ?
        body: FutureBuilder(
            future: loadEvent(events),
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
                return Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    // shrinkWrap: false,
                    itemCount: 2,
                    itemBuilder: (c, index) {
                      // return Text("sdd");
                       var temp = Upvote.fromJson(snapshot.data.elementAt(index));
                      return Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),

                                Container(
                                  margin: EdgeInsets.only(left: 13, right: 13),
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_upward),
                                    onPressed: () {
                                      
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 13, right: 13),
                                  child: Text(
                                    '10',
                                    // allSessions.agendaList[index].time != null
                                    //     ? allSessions.agendaList[index].time
                                    //     : '09 AM',
                                    style: TextStyle(
                                        color:
                                            //allSessions.agendaList[index].time != null
                                            // ?
                                            ClubGamma.contrastColor,
                                        // : Colors.transparent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                                Container(
                                  margin: EdgeInsets.only(left: 13, right: 13),
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_downward),
                                    onPressed: () {},
                                  ),
                                ),
                                // Container(
                                //   margin: EdgeInsets.only(left: 25, right: 25),
                                //   child: Text(allSessions.agendaList[index].duration),
                                // ),
                              ],
                            ),
                            //allSessions.agendaList[index].speaker != null
                            //?
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     new MaterialPageRoute(
                                  //         builder: (context) => SessionDetail(
                                  //             //  session: allSessions.agendaList[index],
                                  //             )));
                                },
                                child: Ink(
                                  height: MediaQuery.of(context).size.height *
                                      0.2049,
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  decoration: BoxDecoration(
                                    color: ConfigBloc().darkModeOn
                                        ? Tools.hexToColor("#1f2124")
                                        //: Colors.grey.shade100,
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: !ConfigBloc().darkModeOn
                                        ? [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.075),
                                                blurRadius: 7,
                                                offset: Offset(
                                                  7,
                                                  7,
                                                )),
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.015),
                                                blurRadius: 7,
                                                offset: Offset(
                                                  -7,
                                                  -7,
                                                )),
                                          ]
                                        : null,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        // height: 20,
                                        // width: 80,

                                        child: Text(
                                          "wf",
                                          // '${allSessions.agendaList[index].timeduration}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 20),

                                        height: 55,
                                        //     width: 80,

                                        child: Text(
                                          // '${allSessions.agendaList[index].name}',
                                          'dwed',
                                          style: TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 95,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'uh', //    allSessions.agendaList[index].speaker,
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 13),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Divider(
                                        color: ClubGamma.contrastColor,
                                      ),
                                      Container(
                                        //alignment: Alignment.center,
                                        padding: EdgeInsets.only(left: 20),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'efe',
                                            // allSessions.agendaList[index].session,
                                            style: TextStyle(
                                                color: ClubGamma.contrastColor,
                                                fontSize: 15),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            }));
    // : Center(
    //     child: Container(
    //         alignment: Alignment.center,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Container(
    //               height: MediaQuery.of(context).size.height * 0.4,
    //               width: MediaQuery.of(context).size.width * 0.7,
    //               child: Image.asset(ClubGamma.comingsoon),
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(bottom: 50),
    //               child: Text(
    //                 'Coming Soon!',
    //                 style: TextStyle(fontSize: 16),
    //               ),
    //             ),
    //           ],
    //         )),
    //   );
  }
}
