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
            ? StaggeredGridView.countBuilder(
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
                        child: new FadeInImage.assetNetwork(
                          image: imgPath,
                          fit: BoxFit.cover,
                          placeholder: ConfigBloc().darkModeOn
            ? ClubGamma.loadingblack : ClubGamma.loading,
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
            : Center(
                child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Image.asset(ClubGamma.eventphotos),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 50),
                          child: Text(
                            'After completing the Event!!',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    )),
              ),
        title: widget.data.title);
  }
}
