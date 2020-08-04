import 'package:flutter_devfest/homeWidget/Gallery/photos/photosScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'data.dart';

class TimelinePage extends StatefulWidget {
  TimelinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  final PageController pageController =
      PageController(initialPage: 1, keepPage: true);
  int pageIx = 1;

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
        body: timelineModel(TimelinePosition.Left), title: 'Gallery');
  }

  timelineModel(TimelinePosition position) => Timeline.builder(
      itemBuilder: centerTimelineBuilder,
      itemCount: data.length,
      physics: BouncingScrollPhysics(),
      position: position);

  TimelineModel centerTimelineBuilder(BuildContext context, int index) {
    //final data = doodles[index];
    // ignore: unused_local_variable
    print(data[index]);
    final textTheme = Theme.of(context).textTheme;
    return TimelineModel(
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              print("photos");
              print(data[index]["doodle"].length);

              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => WallScreen(
                          data[index], data[index]["doodle"].length)));
            },
            child: Ink(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.79,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 10,
                      spreadRadius: 5,
                    )
                  ]),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.network(
                      data[index]['doodle'][0],
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.79,
                      fit: BoxFit.contain,
                    ),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.79,
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Container(
                  //   child: Text(
                  //     'Date : ${data[index]['date']}',
                  //     style: TextStyle(
                  //       fontSize: 15,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        position: index % 2 == 0
            ? TimelineItemPosition.right
            : TimelineItemPosition.left,
        isFirst: index == 0,
        isLast: index == data.length,
        iconBackground: data[index]["iconBackground"],
        icon: data[index]["icon"]);
  }
}
