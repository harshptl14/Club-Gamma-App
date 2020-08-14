import 'package:flutter/material.dart';
import 'package:flutter_devfest/agenda/agenda_page.dart';
import 'package:flutter_devfest/config/index.dart';
import 'package:flutter_devfest/faq/faq_page.dart';
import 'package:flutter_devfest/map/map_page.dart';
import 'package:flutter_devfest/speakers/speaker_page.dart';
import 'package:flutter_devfest/sponsors/sponsor_page.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/universal/image_card.dart';
import 'package:flutter_devfest/utils/devfest.dart';
import 'package:flutter_devfest/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HomeFront extends StatelessWidget {
  var text = '#ClubGamma';
  var tempData;
  var agendaData;
  HomeFront(this.tempData, this.agendaData);

  List<Widget> devFestTexts(context) => [
        Text(
          tempData.title,
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          tempData.description,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
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
        spacing: 20.0,
        runSpacing: 20.0,
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
              // A builder is used to retrieve the context immediately
              // surrounding the RaisedButton.
              //
              // The context's `findRenderObject` returns the first
              // RenderObject in its descendent tree when it's not
              // a RenderObjectWidget. The RaisedButton's RenderObject
              // has its position and size after it's built.
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
            icon: Icons.question_answer,
            color: ClubGamma.contrastColor,
            title: ClubGamma.faq_text,
            onPressed: () => Navigator.pushNamed(context, FaqPage.routeName),
          ),
          ActionCard(
            icon: Icons.map,
            color: ClubGamma.contrastColor,
            title: ClubGamma.map_text,
            onPressed: () => Navigator.pushNamed(context, MapPage.routeName),
          )
        ],
      );

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.facebookF),
              onPressed: () async {
                await _launchURL("https://www.facebook.com/clubgamma/");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.twitter),
              onPressed: () async {
                await _launchURL("https://twitter.com/club_gamma");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedinIn),
              onPressed: () async {
                _launchURL(
                    "https://www.linkedin.com/company/clubgamma/?originalSubdomain=in");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.youtube),
              onPressed: () async {
                await _launchURL(
                    "https://www.youtube.com/channel/UCFO_j0Kml2tT3aFgVUSYGxQ");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.instagram),
              onPressed: () async {
                await _launchURL("https://www.instagram.com/club_gamma/?hl=en");
              },
            ),
            IconButton(
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
    return DevScaffold(
      title: tempData.type,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ImageCard(
                img: ConfigBloc().darkModeOn
                    ? ClubGamma.banner_light
                    //Image.network(tempData.imagelink)
                    : ClubGamma.banner_light,
              ),
              SizedBox(
                height: 20,
              ),
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
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
              )
            ],
          ),
        ),
      ),
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
