import 'package:flutter_devfest/homeWidget/Gallery/photos/detailSScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

const String testDevice = '';

class WallScreen extends StatefulWidget {
  var data;
  int length;
  WallScreen(this.data, this.length);

  @override
  _WallScreenState createState() => new _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  @override
  Widget build(BuildContext context) {
    return DevScaffold(body:  widget.data != null
            ?
            //Column(

            //   children : [

            // Container(
            //   child:Text(widget.data['content']),
            // ),
            StaggeredGridView.countBuilder(
                padding: const EdgeInsets.all(8.0),
                crossAxisCount: 4,
                itemCount: widget.length,
                itemBuilder: (context, i) {
                  print(widget.length);
                  String imgPath = widget.data["doodle"][i];
                  print(widget.data);
                  return new Container(
                    // elevation: 8.0,
                    // borderRadius:
                    //     new BorderRadius.all(new Radius.circular(8.0)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            blurRadius: 10,
                            spreadRadius: 5,
                          )
                        ]),

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
                          placeholder: new NetworkImage(
                              "https://i2.wp.com/quidtree.com/wp-content/uploads/2020/01/placeholder.png?fit=1200%2C800&ssl=1"),
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
                child: new CircularProgressIndicator(),
              ), title: widget.data['name']);
  }
}
