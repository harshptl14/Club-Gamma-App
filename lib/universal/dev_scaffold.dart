import 'package:flutter/material.dart';
import 'package:flutter_devfest/homeWidget/Faq/faq.dart';
import 'package:flutter_devfest/config/config_bloc.dart';
import 'package:flutter_devfest/config/config_event.dart';
import 'package:flutter_devfest/homeWidget/Gallery/timeline.dart';
import 'package:flutter_devfest/team/team_page.dart';
import 'package:flutter_devfest/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

// class DevScaffold extends StatelessWidget {
//   final String title;
//   final Widget body;
//   final Widget tabBar;
//   final bool settingsIcon;

//   const DevScaffold(
//       {Key key, @required this.body, @required this.title, this.tabBar, this.settingsIcon})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 500),
//       color: ConfigBloc().darkModeOn ? Colors.grey[800] : Colors.white,
//       child: SafeArea(
//         top: false,
//         bottom: false,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(title),
//             centerTitle: true,
//             bottom: tabBar != null ? tabBar : null,
//             actions: <Widget>[
//               IconButton(
//                 icon: Icon(
//                   ConfigBloc().darkModeOn
//                       ? FontAwesomeIcons.lightbulb
//                       : FontAwesomeIcons.solidLightbulb,
//                   size: 18,
//                 ),
//                 onPressed: () {
//                   ConfigBloc()
//                       .dispatch(DarkModeEvent(!ConfigBloc().darkModeOn));
//                 },
//               ),
//               IconButton(
//                 onPressed: () => Share.share(
//                     "Download the new DevFest App and share with your tech friends.\nPlayStore -  http://bit.ly/2GDr18N"),
//                 icon: Icon(
//                   Icons.share,
//                   size: 20,
//                 ),
//               ),

//               settingsIcon == true ? IconButton(
//                 onPressed: () {
//                    Navigator.push(
//                     context,
//                     new MaterialPageRoute(
//                         builder: (context) => FaqActivity(
//                            )));
//                 },
//                 icon: Icon(
//                   Icons.photo_album,
//                   size: 20,
//                 ),
//               ) : Container(),

//             ],
//           ),
//           body: body,
//         ),
//       ),
//     );
//   }

//------------------------------

class DevScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget tabBar;
  final bool settingsIcon;

  const DevScaffold(
      {Key key,
      @required this.body,
      @required this.title,
      this.tabBar,
      this.settingsIcon})
      : super(key: key);

  @override
  _DevScaffoldState createState() => _DevScaffoldState();
}

class _DevScaffoldState extends State<DevScaffold> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: ConfigBloc().darkModeOn ? Colors.grey[800] : Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
            bottom: widget.tabBar != null ? widget.tabBar : null,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  ConfigBloc().darkModeOn
                      ? FontAwesomeIcons.lightbulb
                      : FontAwesomeIcons.solidLightbulb,
                  size: 18,
                ),
                onPressed: () {
                  ConfigBloc()
                      .dispatch(DarkModeEvent(!ConfigBloc().darkModeOn));
                },
              ),
              IconButton(
                onPressed: () => Share.share(
                    "Download the new DevFest App and share with your tech friends.\nPlayStore -  http://bit.ly/2GDr18N"),
                icon: Icon(
                  Icons.share,
                  size: 20,
                ),
              ),
              widget.settingsIcon == true
                  ? IconButton(
                      onPressed: () {
                        return _onButtonPressed();
                        // Navigator.push(
                        //     context,
                        //     new MaterialPageRoute(
                        //         builder: (context) => FaqActivity()));
                      },
                      icon: Icon(
                        Icons.format_list_bulleted,
                        size: 20,
                      ),
                    )
                  : Container(),
            ],
          ),
          body: widget.body,
        ),
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.all(19),
              height: 180,
              child: 
              Column(
                children: [

                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text('What are you '),
                        Text('Searching for?', style: TextStyle(color: Colors.red),),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      ActionCard(
                          icon: Icons.photo_album,
                          color: Colors.purple,
                          title: 'Gallery',
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => TimelinePage()));
                          }),
                      SizedBox(
                        width: 13,
                      ),
                      ActionCard(
                          icon: Icons.question_answer,
                          color: Colors.red,
                          title: 'FAQ',
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => FaqActivity()));
                          }
                          //  Navigator.pushNamed(context, SponsorPage.routeName),
                          ),
                      SizedBox(
                        width: 13,
                      ),
                      ActionCard(
                          icon: Icons.group,
                          color: Colors.yellow,
                          title: 'Team',
                          onPressed: () {
                             Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => TeamPage()));
                          }
                          //  Navigator.pushNamed(context, SponsorPage.routeName),
                          ),

                          SizedBox(
                        width: 13,
                      ),
                      ActionCard(
                          icon: Icons.event_available,
                          color: Colors.green,
                          title: 'UpvoteEvent',
                          onPressed: () {}
                          //  Navigator.pushNamed(context, SponsorPage.routeName),
                          ),

                    ],
                  ),
                ],
              ));
        });
  }
}

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
                    color: Colors.grey[200],
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
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
              textAlign: TextAlign.center,
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
