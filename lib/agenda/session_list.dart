import 'package:flutter/material.dart';
import 'package:flutter_devfest/agenda/session_detail.dart';
import 'package:flutter_devfest/config/index.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:flutter_devfest/utils/tools.dart';

class SessionList extends StatelessWidget {
  var allSessions;
  SessionList({Key key, @required this.allSessions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return allSessions.agendaList[0].time != null
        ? Padding(
            padding: EdgeInsets.only(top: 10,right: 2),
            child: ListView.builder(
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
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              allSessions.agendaList[index].time != null
                                  ? allSessions.agendaList[index].time
                                  : '09 AM',
                              style: TextStyle(
                                  color:
                                      allSessions.agendaList[index].time != null
                                          ? ClubGamma.contrastColor
                                          : Colors.transparent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          allSessions.agendaList[index].speaker != null
                              ? Container(
                                  margin: EdgeInsets.only(left: 15, right: 13),
                                  color: Color(0xffD71E3C),
                                  width: 2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.21,
                                  //150,
                                )
                              : Container(
                                  margin: EdgeInsets.only(left: 17, right: 15),
                                  color: Color(0xffD71E3C),
                                  width: 2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                )

                          // Container(
                          //   margin: EdgeInsets.only(left: 25, right: 25),
                          //   child: Text(allSessions.agendaList[index].duration),
                          // ),
                        ],
                      ),
                      allSessions.agendaList[index].speaker != null
                          ? Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  // ConfigBloc().dispatch(
                                  //     UpvoteEvent(!ConfigBloc().upVoteOn[index]));
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => SessionDetail(
                                                session: allSessions
                                                    .agendaList[index],
                                              )));
                                },
                                child: Ink(
                                  padding: EdgeInsets.only(top: 3, left: 11, right: 11, bottom: 3),
                                  // height: MediaQuery.of(context).size.height *
                                  //     0.2049,
                                  width:
                                      MediaQuery.of(context).size.width * 0.77,
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
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // padding:
                                                //EdgeInsets.only(left: 20),
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
                                                child: Text(
                                                  '${allSessions.agendaList[index].name}',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      ClubGamma.contrastColor,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Hero(
                                                tag: allSessions
                                                    .agendaList[index].name,
                                                child: CircleAvatar(
                                                  // radius: 110,
                                                  child: ClipOval(
                                                    child: FadeInImage
                                                        .assetNetwork(
                                                      fit: BoxFit.cover,
                                                      image: allSessions
                                                          .agendaList[index]
                                                          .photo,
                                                      placeholder: ConfigBloc()
                                                              .darkModeOn
                                                          ? ClubGamma
                                                              .loadingblack
                                                          : ClubGamma.loading,
                                                    ),
                                                  ),
                                                )),
                                            height: 60,
                                            width: 60,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        //padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          allSessions.agendaList[index].speaker,
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
                                        padding: EdgeInsets.only(
                                            bottom: 10, top: 2.5),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            allSessions
                                                .agendaList[index].session,
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
                          : Padding(
                              padding: const EdgeInsets.only(
                                top: 7,
                              ),
                              child: Ink(
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                width: MediaQuery.of(context).size.width * 0.77,
                                decoration: BoxDecoration(
                                  color: Color(0xffffb3b3),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: !ConfigBloc().darkModeOn
                                      ? [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.075),
                                              blurRadius: 7,
                                              //spreadRadius: 1,
                                              offset: Offset(
                                                7,
                                                7,
                                              )),
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.015),
                                              blurRadius: 7,
                                              //spreadRadius: -1,
                                              offset: Offset(
                                                -7,
                                                -7,
                                              )),
                                        ]
                                      : null,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: Text(
                                      allSessions
                                          .agendaList[index].timeduration,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: !ConfigBloc().darkModeOn
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    )),
                                    Container(
                                        child: Text(
                                      allSessions.agendaList[index].name,
                                      style: TextStyle(
                                        color: ClubGamma.contrastColor,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                );
              },
            ),
          )
        : Center(
            child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Image.asset(ClubGamma.comingsoon),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Text(
                        'Coming Soon!',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                )),
          );
  }
}
