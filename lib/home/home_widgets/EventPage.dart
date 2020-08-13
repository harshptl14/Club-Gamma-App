import 'package:flutter/material.dart';
import 'package:flutter_devfest/home/home_widgets/home_front.dart';
import 'package:flutter_devfest/home/index.dart';
import 'package:flutter_devfest/model/eventModel.dart';
import 'package:flutter_devfest/model/speakerData.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

var _homeBloc = HomeBloc();
var state = _homeBloc.currentState as InHomeState;
dynamic events = state.eventData;
dynamic speaker = state.speakerData;

class _EventPageState extends State<EventPage> {
  @override
  void initState() {
    loadSpeaker(speaker).then((value) {
      setState(() {
        _list.addAll(value);
      });
    });
    super.initState();
  }

  List<Speaker> _list = List<Speaker>();

  Future<dynamic> loadEvent(events) async {
    var eventtt = await events;
    return eventtt;
  }

  Future<List<Speaker>> loadSpeaker(speaker) async {
    List<Speaker> speakerr = speaker;
    return speakerr;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadEvent(events),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData) {
          return Center(
            child: Text('No data'),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              print(snapshot.data.length);
              var temp = EventModel.fromJson(snapshot.data.elementAt(index));
              return Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: DateTime.parse(temp.date)
                              .isAfter(DateTime.now()) ==
                          true
                      ? InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            // print("photos");
                            // print(data[index]["doodle"].length);

                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => HomeFront()));
                          },
                          child: Ink(
                            height: MediaQuery.of(context).size.height * 0.24,
                            width: MediaQuery.of(context).size.width * 0.88,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[200],
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                  ),
                                ]),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.235,
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                    color: Color(0xffD31E3C),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.87,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text(
                                          temp.venue,
                                          style: TextStyle(
                                              color: Color(0xffD31E3C),
                                              fontSize: 13),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(left: 15, top: 5),
                                        child: Text(
                                          temp.title,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 15),
                                          child: Text(
                                            temp.description,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
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
                                                textAlign: TextAlign.start,
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
                                            '${temp.date} ${temp.time}',
                                            style: TextStyle(
                                              color: Color(0xffD31E3C),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xffffcccc),
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : null,
                ),
              );
            },
          );
        }
      },
    );
  }
}
