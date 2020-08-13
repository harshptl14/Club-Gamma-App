import 'package:flutter_devfest/config/config_bloc.dart';
import 'package:flutter_devfest/homeWidget/Gallery/photos/photosScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/tools.dart';
import 'data.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: 'Gallery',
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Timelinee(),
        ),
      ),
    );
  }
}

class Timelinee extends StatefulWidget {
  const Timelinee({
    Key key,
  }) : super(key: key);

  @override
  _TimelineeState createState() => _TimelineeState();
}

class _TimelineeState extends State<Timelinee> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => Container(
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 25,
                  width: 25,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                    boxShadow: !ConfigBloc().darkModeOn
                        ? [
                            BoxShadow(
                              color: Colors.grey[200],
                              blurRadius: 10,
                              spreadRadius: 5,
                            )
                          ]
                        : null,
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffffcccc),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          boxShadow: !ConfigBloc().darkModeOn
                              ? [
                                  BoxShadow(
                                    color: Colors.grey[200],
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                  )
                                ]
                              : null,
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xffD71E3C),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: !ConfigBloc().darkModeOn
                        ? [
                            BoxShadow(
                              color: Colors.grey[200],
                              blurRadius: 10,
                              spreadRadius: 5,
                            )
                          ]
                        : null,
                    color: Color(0xffD71E3C),
                  ),
                  width: 1,
                  height: 240,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
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
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: MediaQuery.of(context).size.width * 0.87,
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
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text(
                          'EVENT ${index + 1}',
                          style:
                              TextStyle(color: Color(0xffD31E3C), fontSize: 13),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        //alignment: Alignment.center,
                        child: Image.network(data[index]['doodle'][0]),
                        height: MediaQuery.of(context).size.height * 0.17,
                        width: MediaQuery.of(context).size.width * 0.82,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          data[index]['name'],
                          style: TextStyle(color: !ConfigBloc().darkModeOn ? Colors.black : Colors.white,
                           fontSize: 18),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text(
                          data[index]['date'],
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
