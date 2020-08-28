import 'package:flutter/material.dart';
import 'package:flutter_devfest/config/index.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';
import 'package:flutter_devfest/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
  List<Widget> devFestTexts(context) => [
        Text(
          // tempData.title,
          ClubGamma.whatIsClubGamma,
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          color: Colors.red,
          child: Text(
            ClubGamma.aboutusText,
            style: TextStyle(),
            //tempData.description,

            //Theme.of(context).textTheme.caption,
            textAlign: TextAlign.justify,
          ),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
        body: Container(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Ink(
              height: MediaQuery.of(context).size.height * 0.2049,
              width: MediaQuery.of(context).size.width * 0.88,
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
                child: Image.asset(
                  ClubGamma.banner,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //...devFestTexts(context),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                // tempData.title,
                ClubGamma.whatIsClubGamma,
                style: Theme.of(context).textTheme.headline,
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(ClubGamma.aboutusText,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
            ),
            SizedBox(
              height: 20,
            ),

            socialActions(context),

            SizedBox(height: 5),

            Text(
              ClubGamma.app_version,
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
            ),
            SizedBox(
              height: 40,
            ),

            Container(
              child: Text(
                '''Built using Mtechviral's repo''',
                style: TextStyle(color: Colors.grey[400]),
              ),
            ),

            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    color:  Colors.grey[400],
                    icon: Icon(FontAwesomeIcons.github),
                    onPressed: () async {
                      await _launchURL(
                          "https://github.com/clubgamma/Club-Gamma-App");
                    },
                  )
                ],
              ),
            ),
          ],
        )),
        title: 'About us');
  }
}
