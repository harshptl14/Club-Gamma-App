// import 'package:flutter/material.dart';
// import 'package:flutter_devfest/universal/dev_scaffold.dart';
// import 'package:flutter_devfest/utils/clubgamma.dart';

// var count;

// class UpvoteEvent extends StatefulWidget {
//   @override
//   _UpvoteEventState createState() => _UpvoteEventState();
// }

// class _UpvoteEventState extends State<UpvoteEvent> {
//   @override
//   Widget build(BuildContext context) {
//     return DevScaffold(
//         title: 'Upvote',
//         body:

//             Center(
//           child: Container(
//               alignment: Alignment.center,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height * 0.32,
//                     width: MediaQuery.of(context).size.width * 0.5,
//                     child: Image.asset(ClubGamma.upvote, fit: BoxFit.cover,),
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(bottom: 50),
//                     child: Text(
//                       'You will be given chance to vote here!',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 ],
//               )),
//         ));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_id/device_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_devfest/config/config_bloc.dart';
import 'package:flutter_devfest/config/index.dart';
import 'package:flutter_devfest/homeWidget/Upvote/upvote_api.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:flutter_devfest/utils/tools.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var count;

class UpvoteEvent extends StatefulWidget {
  @override
  _UpvoteEventState createState() => _UpvoteEventState();
}

// var _homeBloc = HomeBloc();
// var state = _homeBloc.currentState as InHomeState;
// dynamic events = state.eventData;
// var allSessions;

// Future<dynamic> loadEvent(agenda) async {
//   var eventtt = await agenda;
//   return eventtt;
// }

class _UpvoteEventState extends State<UpvoteEvent> {
  // String _deviceid = 'Unknown';
  // String uniqueId = "Unknown";
  String _deviceid = 'Unknown';
  String deviceid;
  String imei;
  String meid;

  @override
  void initState() {
    //initPlatformState();
    super.initState();
    initDeviceId();
  }

  Future<void> initDeviceId() async {
    String imei;

    deviceid = await DeviceId.getID;
    try {
      imei = await DeviceId.getIMEI;
      meid = await DeviceId.getMEID;
    } on PlatformException catch (e) {
      print(e.message);
    }

    if (!mounted) return;

    setState(() {
      _deviceid = imei;
      //'Your deviceid: $deviceid\nYour IMEI: $imei\nYour MEID: $meid';
    });
  }

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
        title: 'Upvote',
        // allSessions.agendaList[0].time != null
        //     ?
        body: StreamBuilder(
            stream: Firestore.instance.collection("UpvoteEvent").snapshots(),
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
                //List<bool> color = [];
                return Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    // shrinkWrap: false,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot events = snapshot.data.documents[index];
                      // return Text("sdd");
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
                                    // color: color[index] == true ? Colors.red : Colors.grey,
                                    onPressed: () async{
                                      print('DeviceID');
                                      print(_deviceid);

                                      if ( userExist(_deviceid) == 0) {
                                        print('NewUserCreatedSec');
                                        userUploadEvent(
                                            true, _deviceid, events["name"]);
                                        changeCounterPlus(events['id']);

                                        //   color[index] = true;
                                      } 

                                       else if (eventExist(
                                              _deviceid, events["name"]) ==
                                          null) {
                                        print('EventExistSectionNULL');

                                        getUserTapped(
                                            true, _deviceid, events["name"]);
                                        //Color red kari devo
                                        //  color[index] = true;

                                        changeCounterPlus(events['id']);
                                      }
                                      
                                      else if ( eventExist(
                                              _deviceid, events["name"]) ==
                                          true){
                                        print('EventExistSectionTRUE');
                                        getUserTapped(
                                            false, _deviceid, events["name"]);
                                        changeCounterMinus(events['id']);
                                        // Color less kari devu
                                        // color[index] = false;

                                      }
                                       else if ( eventExist(
                                              _deviceid, events["name"]) ==
                                          false) {
                                        print('EventExistSectionFALSE');
                                        getUserTapped(
                                            true, _deviceid, events["name"]);
                                        changeCounterPlus(events['id']);
                                        // Color vadu pachhu kari devu
                                        // color[index] = true;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 13, right: 13),
                                  child: Text(
                                    events["counter"].toString(),
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

                                // Container(
                                //   margin: EdgeInsets.only(left: 13, right: 13),
                                //   child: IconButton(
                                //     icon: Icon(Icons.arrow_downward),
                                //     onPressed: () {
                                //       //  var count = events['counter'].toString() + '1';
                                //       // if (
                                //       //     // !ConfigBloc().upVoteOn
                                //       //     upvotee[index] == true) {
                                //       //   changeCounterMinus(events['id']);
                                //       //   // ConfigBloc().dispatch(UpvoteEventt(
                                //       //   //     // ConfigBloc().upVoteOn,
                                //       //   //     !upvotee[index],
                                //       //   //     events['sharedname']));
                                //       //   upvotee[index] = false;
                                //       // }
                                //     },
                                //   ),
                                // ),

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
                                          events["name"],
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
