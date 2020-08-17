import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';

class SponsorPage extends StatelessWidget {
  static const String routeName = "/sponsor";

  @override
  Widget build(BuildContext context) {
    // var _homeBloc = HomeBloc();
    return DevScaffold(
      body: ListView(
        children: <Widget>[
          SponsorImage(
            imgUrl:
                "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png",
            name: 'GitHub',
            subtitle: 'Main sponsor',
          ),
        ],
      ),
      title: "Sponsors",
    );
  }
}

class SponsorImage extends StatelessWidget {
  final String imgUrl;
  final String name;
  final subtitle;

  const SponsorImage({Key key, this.imgUrl, this.name, this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(right: 30),
            leading: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          height: 100.0,
          width: 105.0,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(name),
      subtitle: Text(subtitle),
    );
    //  Card(
    //   elevation: 0.0,
    //   child: Padding(
    //     padding: const EdgeInsets.all(12.0),
    //     child: CachedNetworkImage(
    //       imageUrl: imgUrl,
    //       height: 200.0,
    //       width: 200.0,
    //       fit: BoxFit.contain,
    //     ),
    //   ),
    // );
  }
}
