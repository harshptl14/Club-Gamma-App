import 'package:flutter/material.dart';
import 'package:flutter_devfest/config/index.dart';
import 'package:flutter_devfest/home/home_widgets/home_front.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/universal/image_card.dart';
import 'package:flutter_devfest/utils/devfest.dart';
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
        Text(
          ClubGamma.aboutusText,
          //tempData.description,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
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
            // Container(
            //   child: Image(
            //     image: NetworkImage(ClubGamma.clubGammaBanner),
            //     // ConfigBloc().darkModeOn
            //     //     ? ClubGamma.banner_light
            //     //     //Image.network(tempData.imagelink)
            //     //     : ClubGamma.banner_light,
            //   ),
            // ),
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
              height: 20,
            ),

            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                ClubGamma.aboutusText, textAlign: TextAlign.center,
                //tempData.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey
                ) 
                //Theme.of(context).textTheme.caption,
                
              ),
            ),
            SizedBox(
              height: 20,
            ),

            socialActions(context),
          ],
        )),
        title: 'About us');
  }
}
