import 'package:flutter/material.dart';
import 'package:flutter_devfest/config/index.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';

class SponsorPage extends StatelessWidget {
  var sponsorData;
  SponsorPage(this.sponsorData);
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      body: sponsorData.sponsor[0].name != null
          ? ListView.builder(
              shrinkWrap: true,
              itemBuilder: (c, index) {
                return ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  leading: CircleAvatar(
                    // radius: 110,
                    child: ClipOval(
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        image: sponsorData.sponsor[index].logo,
                        placeholder: ConfigBloc().darkModeOn
                            ? ClubGamma.loadingblack
                            : ClubGamma.loading,
                      ),
                    ),
                  ),
                
                  title: Text(sponsorData.sponsor[index].name),
                  subtitle: Text(sponsorData.sponsor[index].type),
                );

             
              },
              itemCount: sponsorData.sponsor.length,
            )
          : Center(
              child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Image.asset(ClubGamma.comingsoon),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Text(
                          'Coming Soon!',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  )),
            ),
      title: "Sponsors",
    );
  }
}
