import 'package:flutter/material.dart';
import 'package:flutter_devfest/config/index.dart';
import 'package:flutter_devfest/home/home_widgets/home_front.dart';
import 'package:flutter_devfest/home/index.dart';
import 'package:flutter_devfest/model/agendaModel.dart';
import 'package:flutter_devfest/model/eventModel.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:flutter_devfest/utils/tools.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CompletedEvent extends StatefulWidget {
  @override
  _CompletedEventState createState() => _CompletedEventState();
}

var _homeBloc = HomeBloc();
var state = _homeBloc.currentState as InHomeState;
dynamic events = state.eventData;
dynamic agenda = state.agendaData;

class _CompletedEventState extends State<CompletedEvent> {
  @override
  void initState() {
    loadSpeaker(agenda).then((value) {
      setState(() {
        _list.addAll(value);
      });
    });
    super.initState();
  }

  List<Agenda> _list = List<Agenda>();

  Future<dynamic> loadEvent(agenda) async {
    var eventtt = await agenda;
    return eventtt;
  }

  Future<List<Agenda>> loadSpeaker(speaker) async {
    List<Agenda> agendaa = speaker;
    return agendaa;
  }

  @override
  Widget build(BuildContext context) {
    var counter = 0;

    return FutureBuilder(
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
          var today = new DateTime.now();
          var oneDayBefore = today.subtract(new Duration(days: 1));
          for (int i = 0; i < snapshot.data.length; i++) {
            var variable = EventModel.fromJson(snapshot.data.elementAt(i)).date;
            if (DateTime.parse(variable).isBefore(oneDayBefore) == true) {
              counter++;
            } else {}
          }
          return counter == 0
              ? Center(
                  child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.38,
                            width: MediaQuery.of(context).size.width * 0.66,
                            child: Image.asset(ClubGamma.eventcoming),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 50),
                            child: Text(
                              'Not a single event done! really?!',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      )),
                )
              : ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var temp;
                    var tempp =
                        EventModel.fromJson(snapshot.data.elementAt(index))
                            .date;
                    print(tempp);
                    temp = EventModel.fromJson(snapshot.data.elementAt(index));
                    return Container(
                      child: DateTime.parse(temp.date).isBefore(oneDayBefore) !=
                              true
                          ? null
                          : Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 15, right: 15, bottom: 12),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              HomeFront(temp, _list[index])));
                                },
                                child: Ink(
                                  //height: MediaQuery.of(context).size.height * 0.255,
                                  width:
                                      MediaQuery.of(context).size.width * 0.88,
                                  decoration: BoxDecoration(
                                    color: ConfigBloc().darkModeOn
                                        ? Tools.hexToColor("#1f2124")
                                        : Colors.white,
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
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          //  height: MediaQuery.of(context).size.height *
                                          //      0.25,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                          color: Color(0xffD31E3C),
                                        ),
                                      ),
                                      Container(
                                        //height: MediaQuery.of(context).size.height *
                                        //  0.255,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.87,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 15),
                                              child: Text(
                                                temp.type,
                                                style: TextStyle(
                                                    color: Color(0xffD31E3C),
                                                    fontSize: 13),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 15, top: 5),
                                              child: Text(
                                                temp.title,
                                                style: TextStyle(
                                                  color: ConfigBloc().darkModeOn
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 5, left: 15),
                                              child: Text(
                                                temp.description,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            Container(
                                              // height: 25,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 5, left: 10),
                                                    child: Icon(
                                                      Icons.location_on,
                                                      color: Color(0xffD31E3C),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 5, left: 5),
                                                    child: Text(
                                                      temp.venue,
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 15),
                                              child: Container(
                                                alignment: Alignment.center,
                                                // padding: EdgeInsets.only(top: 10, left: 30),
                                                child: Text(
                                                  '${temp.date} @${temp.time}',
                                                  style: TextStyle(
                                                    color: Color(0xffD31E3C),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color(0xffffb3b3),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.46,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    );
                  },
                );
        }
      },
    );
  }
}
