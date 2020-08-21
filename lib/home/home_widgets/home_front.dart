import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_devfest/agenda/agenda_page.dart';
import 'package:flutter_devfest/config/index.dart';
import 'package:flutter_devfest/speakers/speaker_page.dart';
import 'package:flutter_devfest/sponsors/sponsor_page.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:flutter_devfest/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

double _appTopBarHeight = 60;
String artistName = 'Dennis Lloyd';
var scrink = 0.0;

// ignore: must_be_immutable
class HomeFront extends StatelessWidget {
  var text = '#ClubGamma';
  var tempData;
  var agendaData;
  HomeFront(this.tempData, this.agendaData);

  List<Widget> devFestTexts(context) => [
        Text(
          tempData.date,
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            tempData.description,
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
        ),
      ];

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget newActions(context) => Wrap(
        alignment: WrapAlignment.center,
        // crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 27.0,
        runSpacing: 27.0,
        children: <Widget>[
          ActionCard(
              icon: Icons.schedule,
              color: ClubGamma.contrastColor,
              title: ClubGamma.agenda_text,
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => AgendaPage(agendaData)));
              }),
          ActionCard(
              icon: Icons.person,
              color: ClubGamma.contrastColor,
              title: ClubGamma.speakers_text,
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => SpeakerPage(tempData)));
              }),
          ActionCard(
            icon: Icons.mobile_screen_share,
            color: ClubGamma.contrastColor,
            title: 'Promote',
            onPressed: () {
              final RenderBox box = context.findRenderObject();
              Share.share(text,
                  sharePositionOrigin:
                      box.localToGlobal(Offset.zero) & box.size);
            },
            //Navigator.pushNamed(context, TeamPage.routeName),
          ),
          ActionCard(
            icon: Icons.attach_money,
            color: ClubGamma.contrastColor,
            title: ClubGamma.sponsor_text,
            onPressed: () =>
                Navigator.pushNamed(context, SponsorPage.routeName),
          ),
          ActionCard(
            icon: Icons.assignment,
            color: ClubGamma.contrastColor,
            title: ClubGamma.register_text,
            onPressed: () async => await _launchURL(tempData.regLink),
            //Navigator.pushNamed(context, FaqPage.routeName),
          ),
          ActionCard(
            icon: Icons.feedback,
            color: ClubGamma.contrastColor,
            title: 'Feedback',
            onPressed: () async => await _launchURL(tempData.feedbackLink),
          )
        ],
      );

  Widget socialActions(context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              iconSize: 15,
              icon: Icon(FontAwesomeIcons.facebookF),
              onPressed: () async {
                await _launchURL("https://www.facebook.com/clubgamma/");
              },
            ),
            IconButton(
              iconSize: 15,
              icon: Icon(FontAwesomeIcons.twitter),
              onPressed: () async {
                await _launchURL("https://twitter.com/club_gamma");
              },
            ),
            IconButton(
              iconSize: 15,
              icon: Icon(FontAwesomeIcons.linkedinIn),
              onPressed: () async {
                _launchURL(
                    "https://www.linkedin.com/company/clubgamma/?originalSubdomain=in");
              },
            ),
            IconButton(
              iconSize: 15,
              icon: Icon(FontAwesomeIcons.youtube),
              onPressed: () async {
                await _launchURL(
                    "https://www.youtube.com/channel/UCFO_j0Kml2tT3aFgVUSYGxQ");
              },
            ),
            IconButton(
              iconSize: 15,
              icon: Icon(FontAwesomeIcons.instagram),
              onPressed: () async {
                await _launchURL("https://www.instagram.com/club_gamma/?hl=en");
              },
            ),
            IconButton(
              iconSize: 15,
              icon: Icon(FontAwesomeIcons.envelope),
              onPressed: () async {
                var emailUrl =
                    '''mailto:gce@charusat.edu.in?subject=Support Needed For ClubGamma App''';
                var out = Uri.encodeFull(emailUrl);
                await _launchURL(out);
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: ConfigBloc().darkModeOn ? Colors.grey[800] : Colors.white,
        child: SafeArea(
          top: false,
          bottom: false,
          // left: false,
          // right: false,
          child: Scaffold(
            backgroundColor:
                ConfigBloc().darkModeOn ? Colors.black : Colors.white,
            body: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: MyDelegate(tempData, context),
                  floating: false,
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                    ...devFestTexts(context),
                    SizedBox(
                      height: 20,
                    ),
                    newActions(context),
                    SizedBox(
                      height: 20,
                    ),
                    socialActions(context),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ClubGamma.app_version,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 10),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  var tempData;
  dynamic context;
  MyDelegate(this.tempData, this.context);
  Widget imagecard(context, imagelink) {
    return Ink(
      height: MediaQuery.of(context).size.height * 0.24,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          imagelink,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(_, double shrinkOffset, bool overlapsContent) {
    var shrinkPercentage =
        min(1, shrinkOffset / (maxExtent - minExtent)).toDouble();
    scrink = shrinkPercentage;
    print(shrinkPercentage);
    return Stack(
      overflow: Overflow.clip,
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: _appTopBarHeight,
            color: Colors.black,
          ),
        ),
        Column(
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    // color: ConfigBloc().darkModeOn
                    //                 ? Colors.black : Colors.white,
                    decoration: BoxDecoration(
                      gradient: shrinkPercentage == 1
                          ? LinearGradient(
                              colors: [
                                  ConfigBloc().darkModeOn
                                      ? Colors.black
                                      : Colors.white,
                                  ConfigBloc().darkModeOn
                                      ? Colors.black
                                      : Colors.white,
                                ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          : LinearGradient(
                              colors: [
                                  ConfigBloc().darkModeOn
                                      ? Color(0xffD31E3C)
                                      : Color(0xffffb3b3),
                                  ConfigBloc().darkModeOn
                                      ? Colors.black
                                      : Colors.white,
                                ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                    ),
                  ),
                  Opacity(
                    opacity: 1 - shrinkPercentage,
                    child: Center(
                      child: imagecard(context, tempData.imageLink),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
            )
          ],
        ),
        // SizedBox(height: 5,),
        Stack(
          overflow: Overflow.clip,
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    height: _appTopBarHeight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: !ConfigBloc().darkModeOn
                                ? Colors.black
                                : Colors.white,
                          ),
                          //  SizedBox(width: 0),
                          Flexible(
                            child: Opacity(
                              opacity: shrinkPercentage,
                              child: Text(
                                tempData.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              ConfigBloc().darkModeOn
                                  ? FontAwesomeIcons.lightbulb
                                  : FontAwesomeIcons.solidLightbulb,
                              size: 17,
                            ),
                            onPressed: () {
                              ConfigBloc().dispatch(
                                  DarkModeEvent(!ConfigBloc().darkModeOn));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: max(1 - shrinkPercentage * 6, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 250),
                        Text(
                          tempData.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            //fontWeight: FontWeight.bold,
                            color: ConfigBloc().darkModeOn
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        // Text(
                        //  tempData.description,
                        //   style: TextStyle(color: Colors.white),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: Center(
            //     child: RaisedButton(
            //       color: Colors.green,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(18.0),
            //         side: BorderSide(),
            //       ),
            //       onPressed: () {},
            //       child: Padding(
            //         padding:
            //             const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            //         child: Text(
            //           'SHUFFLE PLAY',
            //           style: TextStyle(
            //             fontSize: 14,
            //             fontWeight: FontWeight.w400,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 130;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
//   @override
//   Widget build(BuildContext context) {
//     return DevScaffold(
//       title: tempData.type,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[

//               imagecard(context, tempData.imageLink),
//               SizedBox(
//                 height: 20,
//               ),
//               ...devFestTexts(context),
//               SizedBox(
//                 height: 20,
//               ),
//               newActions(context),
//               SizedBox(
//                 height: 20,
//               ),
//               socialActions(context),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 ClubGamma.app_version,
//                 style:
//                     Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color color;

  const ActionCard({Key key, this.onPressed, this.icon, this.title, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: ConfigBloc().darkModeOn
              ? Tools.hexToColor("#1f2124")
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: !ConfigBloc().darkModeOn
              ? [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.075),
                      blurRadius: 7,
                      //spreadRadius: 1,
                      offset: Offset(
                        7,
                        7,
                      )),
                  BoxShadow(
                      color: Colors.black.withOpacity(0.015),
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
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
