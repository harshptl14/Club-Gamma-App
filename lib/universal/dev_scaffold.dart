import 'package:flutter/material.dart';
import 'package:flutter_devfest/homeWidget/Faq/faq.dart';
import 'package:flutter_devfest/config/config_bloc.dart';
import 'package:flutter_devfest/config/config_event.dart';
import 'package:flutter_devfest/homeWidget/Gallery/timeline.dart';
import 'package:flutter_devfest/homeWidget/aboutUs.dart';
import 'package:flutter_devfest/team/team_page.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:flutter_devfest/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

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
          //backgroundColor: ConfigBloc().darkModeOn ? Colors.black : Colors.grey.shade100,
          //Tools.hexToColor('#0B1A30'),
          // backgroundColor:
          //     ConfigBloc().darkModeOn ? Colors.black : Colors.white,
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
                    "Download the new ClubGamma App and share with your tech friends.\nPlayStore -"),
                icon: Icon(
                  Icons.share,
                  size: 20,
                ),
              ),
              widget.settingsIcon == true
                  ? IconButton(
                      onPressed: () {
                        return _onButtonPressed();
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
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0))),
          padding: EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height * 0.33,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              ActionCard(
                  icon: Icons.photo_album,
                  color: Colors.purple,
                  title: 'Gallery',
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => Timeline()));
                  }),
              SizedBox(
                height: 10,
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
                  }),
              SizedBox(height: 10),
              ActionCard(
                  icon: Icons.group,
                  color: Colors.yellow,
                  title: 'Team',
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => TeamPage()));
                  }),
              SizedBox(
                height: 10,
              ),
              ActionCard(
                  icon: Icons.event_available,
                  color: Colors.green,
                  title: 'Upvote Event',
                  onPressed: () {}),
              SizedBox(
                height: 10,
              ),
              ActionCard(
                icon: Icons.info_outline,
                color: Colors.green,
                title: 'Info',
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => AboutUs()));
                },
              ),
            ],
          ),
        );
      },
    );
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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 5, left: 14),
              child: Icon(
                icon,
                color: ClubGamma.contrastColor,
                size: 23,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8, left: 14),
              child: Text(
                title,
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 14,
                      color:
                          ConfigBloc().darkModeOn ? Colors.white : Colors.black,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
