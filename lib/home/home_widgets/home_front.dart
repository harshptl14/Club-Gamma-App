import 'package:flutter/material.dart';
import 'package:flutter_devfest/agenda/agenda_page.dart';
import 'package:flutter_devfest/config/index.dart';
import 'package:flutter_devfest/speakers/speaker_page.dart';
import 'package:flutter_devfest/sponsors/sponsor_page.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:flutter_devfest/utils/tools.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
              final RenderBox box = context.findRenderObject();
              Share.share(tempData.hashtag,
                  sharePositionOrigin:
                      box.localToGlobal(Offset.zero) & box.size);
            },
            //Navigator.pushNamed(context, TeamPage.routeName),
          ),
          ActionCard(
            icon: Icons.attach_money,
            color: ClubGamma.contrastColor,
            title: ClubGamma.sponsor_text,
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => SponsorPage(tempData)));
              }
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset(ClubGamma.facebookred),
              onPressed: () async {
                await _launchURL("https://www.facebook.com/clubgamma/");
              },
            ),
            IconButton(
              icon: Image.asset(ClubGamma.twitterred),
              onPressed: () async {
                await _launchURL("https://twitter.com/club_gamma");
              },
            ),
            IconButton(
              icon: Image.asset(ClubGamma.linkedinred),
              onPressed: () async {
                _launchURL(
                    "https://www.linkedin.com/company/clubgamma/?originalSubdomain=in");
              },
            ),
            IconButton(
              icon: Image.asset(ClubGamma.githubred),
              onPressed: () async {
                await _launchURL("https://github.com/clubgamma");
              },
            ),
            IconButton(
              icon: Image.asset(ClubGamma.instared),
              onPressed: () async {
                await _launchURL("https://www.instagram.com/club_gamma/?hl=en");
              },
            ),
            IconButton(
              icon: Image.asset(ClubGamma.youtubered),
              onPressed: () async {
                await _launchURL(
                    "https://www.youtube.com/channel/UCFO_j0Kml2tT3aFgVUSYGxQ");
              },
            ),
            IconButton(
              icon: Image.asset(ClubGamma.telegramred),
              onPressed: () async {
                await _launchURL("https://t.me/infoclubgamma");
              },
            ),
            IconButton(
              icon: Image.asset(ClubGamma.mailred),
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

  Widget imagecard(context, imagelink) {
    return Ink(
      height: MediaQuery.of(context).size.height * 0.24,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: ConfigBloc().darkModeOn
            ? Tools.hexToColor("#1f2124")
            //: Colors.grey.shade100,
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: FadeInImage.assetNetwork(
          fit: BoxFit.fitWidth,
          image: imagelink,
          placeholder: ConfigBloc().darkModeOn
              ? ClubGamma.loadingblack
              : ClubGamma.loading,
        ),
        // Image.network(
        //   imagelink,
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }

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
              SizedBox(
                height: 15,
              ),
              imagecard(context, tempData.imageLink),
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
