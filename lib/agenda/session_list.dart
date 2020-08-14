import 'package:flutter/material.dart';
import 'package:flutter_devfest/config/index.dart';
import 'package:flutter_devfest/utils/devfest.dart';
import 'package:flutter_devfest/utils/tools.dart';

class SessionList extends StatelessWidget {
  var allSessions;

  SessionList({Key key, @required this.allSessions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: false,
      itemCount: allSessions.agendaList.length,
      itemBuilder: (c, index) {
        // return Text("sdd");
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17, right: 17),
                    child: Text(
                      allSessions.agendaList[index].time != null ? allSessions.agendaList[index].time : '09 AM',
                      style: TextStyle(
                          color:  allSessions.agendaList[index].time != null ? ClubGamma.contrastColor : Colors.transparent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 25, right: 25),
                  //   child: Text(allSessions.agendaList[index].duration),
                  // ),
                ],
              ),
              allSessions.agendaList[index].speaker != null ?
              Padding(
                padding: const EdgeInsets.only(
                  top: 19,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    // print("photos");
                    // print(data[index]["doodle"].length);

                    // Navigator.push(
                    //     context,
                    //     new MaterialPageRoute(
                    //         builder: (context) => WallScreen(
                    //             data[index], data[index]["doodle"].length)));
                  },
                  child: Ink(
                    height: MediaQuery.of(context).size.height * 0.2049,
                    width: MediaQuery.of(context).size.width * 0.77,
                    decoration: BoxDecoration(
                      color: ConfigBloc().darkModeOn
                          ? Tools.hexToColor("#1f2124")
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: !ConfigBloc().darkModeOn
                          ? [
                              BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 10,
                                spreadRadius: 5,
                              )
                            ]
                          : null,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 12,
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  // height: 20,
                                  // width: 80,

                                  child: Text(
                                    '${allSessions.agendaList[index].timeduration}',
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
                                      '${allSessions.agendaList[index].name}',
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 95,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                //   boxShadow: !ConfigBloc().darkModeOn
                                //       ? [
                                //           BoxShadow(
                                //             color: Colors.grey[200],
                                //             blurRadius: 10,
                                //             spreadRadius: 5,
                                //           )
                                //         ]
                                //       : null,
                                border: Border.all(
                                    color: ClubGamma.contrastColor,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.network(
                                  allSessions.agendaList[index].photo,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              height: 60,
                              width: 60,
                            ),
                          ],
                        ),

                        // SizedBox(
                        //   height: 5,
                        // ),

                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            allSessions.agendaList[index].speaker,
                            style: TextStyle(color: Colors.grey, fontSize: 13),
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
                            child:Text(
                            allSessions.agendaList[index].session,
                            style: TextStyle(color: ClubGamma.contrastColor, fontSize: 15),
                            textAlign: TextAlign.start,
                          ),),
                        ),

                      ],
                    ),
                  ),
                ),
              ) : Padding(
                 padding: const EdgeInsets.only(
                  top: 19,),
                  child: Ink(
                     height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.77,
                    decoration: BoxDecoration(
                      color: Color(0xffffcccc),
                      borderRadius: BorderRadius.circular(8),
                      // border: Border.all(
                      //   color: ClubGamma.contrastColor,
                    //  ),
                      boxShadow: !ConfigBloc().darkModeOn
                          ? [
                              BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 10,
                                spreadRadius: 5,
                              )
                            ]
                          : null,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Container(
                            child: 
                            Text(allSessions.agendaList[index].timeduration,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            )
                          ),

                          Container(
                             child: 
                            Text(allSessions.agendaList[index].name,
                            style: TextStyle(
                              color: ClubGamma.contrastColor,
                            ),
                            )
                          ),
                      ],
                    ),
                  ),

              ),
            ],
          ),
        );

        // Card(
        //   elevation: 0.0,
        //   child: ListTile(
        //     onTap: () {
        //       // Navigator.push(
        //       //   context,
        //       //   MaterialPageRoute(
        //       //     builder: (context) => SessionDetail(
        //       //       session: allSessions[i],
        //       //     ),
        //       //   ),
        //       // );
        //     },
        //     // dense: true,
        //     isThreeLine: true,
        //     trailing: RichText(
        //       textAlign: TextAlign.center,
        //       text: TextSpan(
        //         text: "${allSessions[i].sessionTotalTime}\n",
        //         style: Theme.of(context)
        //             .textTheme
        //             .title
        //             .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
        //         children: [
        //           TextSpan(
        //             text: allSessions[i].sessionStartTime,
        //             style: Theme.of(context).textTheme.subtitle.copyWith(
        //                   fontSize: 12,
        //                 ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     leading: Hero(
        //       tag: allSessions[i].speakerImage,
        //       child: CircleAvatar(
        //         radius: 30,
        //         backgroundImage:
        //             CachedNetworkImageProvider(allSessions[i].speakerImage),
        //       ),
        //     ),
        //     title: RichText(
        //       text: TextSpan(
        //         text: "${allSessions[i].sessionTitle}\n",
        //         style: Theme.of(context).textTheme.title.copyWith(fontSize: 16),
        //         children: [
        //           TextSpan(
        //               text: allSessions[i].speakerName,
        //               style: Theme.of(context).textTheme.subtitle.copyWith(
        //                     fontSize: 14,
        //                     color: Tools.multiColors[Random().nextInt(4)],
        //                   ),
        //               children: []),
        //         ],
        //       ),
        //     ),
        //     subtitle: Text(
        //       allSessions[i].speakerDesc,
        //       style: Theme.of(context).textTheme.caption.copyWith(
        //             fontSize: 10.0,
        //           ),
        //     ),
        //   ),
        // );
      },
    );
  }
}
