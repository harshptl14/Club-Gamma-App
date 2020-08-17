import 'package:flutter_devfest/config/index.dart';
import 'package:flutter_devfest/homeWidget/Gallery/photos/detailSScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// const String testDevice = '';

class WallScreen extends StatefulWidget {
  var data;
  WallScreen(this.data);
  @override
  _WallScreenState createState() => new _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
        body: widget.data.images != null
            ?
            StaggeredGridView.countBuilder(
                padding: const EdgeInsets.all(8.0),
                crossAxisCount: 4,
                itemCount: widget.data.images.length,
                itemBuilder: (context, i) {
                  String imgPath = widget.data.images[i];
                  return new Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: !ConfigBloc().darkModeOn
                          ? [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.075),
                                  blurRadius: 7,
                                  offset: Offset(
                                    7,
                                    7,
                                  )),
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.015),
                                  blurRadius: 7,
                                  offset: Offset(
                                    -7,
                                    -7,
                                  )),
                            ]
                          : null,
                    ),

                    child: new InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    new FullScreenImagePage(imgPath)));
                      },
                      child: new Hero(
                        tag: imgPath,
                        child: new FadeInImage(
                          image: new NetworkImage(imgPath),
                          fit: BoxFit.cover,
                          placeholder: new NetworkImage(ClubGamma.placeHolder),
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (i) =>
                    new StaggeredTile.count(2, i.isEven ? 2 : 3),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              )
            //],
            //)
            : new Center(
              child: Align(
                alignment: Alignment.center,
                child: Text('No Photos available')),
              ),
        title: widget.data.title);
  }
}
