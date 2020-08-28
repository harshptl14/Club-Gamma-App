import 'package:flutter_devfest/config/config_bloc.dart';
import 'package:flutter_devfest/home/index.dart';
import 'package:flutter_devfest/homeWidget/Gallery/photos/photosScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest/model/galleryModel.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:flutter_devfest/utils/tools.dart';

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

var _homeBloc = HomeBloc();
var state = _homeBloc.currentState as InHomeState;
dynamic events = state.galleryData;

Future<dynamic> loadGallery(data) async {
  var gallery = await data;
  return gallery;
}

class _TimelineeState extends State<Timelinee> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadGallery(events),
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
                var temp =
                    GalleryModel.fromJson(snapshot.data.elementAt(index));
                return Container(
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
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => WallScreen(temp)));
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
                                    temp.type,
                                    style: TextStyle(
                                        color: Color(0xffD31E3C), fontSize: 13),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  //alignment: Alignment.center,
                                  child:  FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              image: temp.banner,
                              placeholder: ConfigBloc().darkModeOn
            ? ClubGamma.loadingblack : ClubGamma.loading,
                            ),
                                  //Image.network(temp.banner),
                                  height:
                                      MediaQuery.of(context).size.height * 0.17,
                                  width:
                                      MediaQuery.of(context).size.width * 0.82,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    temp.title,
                                    style: TextStyle(
                                        color: !ConfigBloc().darkModeOn
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 18),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10, left: 20),
                                  child: Text(
                                    temp.date,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
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
                );
              },
            );
          }
        });
  }
}
