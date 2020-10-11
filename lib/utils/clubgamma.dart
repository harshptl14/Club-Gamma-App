import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClubGamma {
  static const String app_name = "ClubGamma";
  static const String app_version = "Version 1.0.3";
  static const int app_version_code = 5;
  static const String app_color = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static const String google_sans_family = "Ubuntu";
  static bool isDebugMode = false;
  static Color contrastColor = Color(0xffD31E3C);

  // * Url related
  static String baseUrl =
      "https://raw.githubusercontent.com/harshptl14/Club-Gamma-App/Add-ons/events";

  static bool get checkDebugBool {
    var debug = false;
    assert(debug = true);

    return debug;
  }

  //* Images
  static const String banner = "assets/images/banner.png";
  static const String intenetError = "assets/images/deckfailcat.png";
  static const String eventphotos = "assets/images/eventpic.png";
  static const String comingsoon = "assets/images/comingsoon.png";
  static const String loading = "assets/images/placeholderr.png";
  static const String loadingblack = "assets/images/placeholderblack.png";
  static const String eventcoming = "assets/images/searchevent.png";
  static const String upvote = "assets/images/upvotee.png";
  static const String instared = "assets/images/instagramred.png";
  static const String linkedinred = "assets/images/linkedinred.png";
  static const String githubred = "assets/images/githubred.png";
  static const String twitterred = "assets/images/twitterred.png";
  static const String youtubered = "assets/images/youtubered.png";
  static const String mailred = "assets/images/mailred.png";
  static const String facebookred = "assets/images/facebookred.png";
    static const String telegramred = "assets/images/telegramred.png";


  //*  Texts
  static const String loading_text = "Loading...";
  static const String try_again_text = "Try Again";
  static const String some_error_text = "Some error";
  static const String wrongText = "Something went wrong";
  static const String updateNowText =
      "Please update your app for seamless experience.";
  static const String checkNetText =
      "It seems like your internet connection is not active.";
  static const String whatIsClubGamma = "What is ClubGamma?";
  static const String aboutusText =
      "Club Gamma formulates a contributory platform to scrutinize learner's potential talents with profound guidance. The club assists in both technical and non-technical spheres.\n\nThe pivot of the club fundamentally is to promote the inclusive growth of the learners and help the learners attain analytical knowledge.";

  //* ActionTexts
  static const String agenda_text = "Agenda";
  static const String speakers_text = "Speakers";
  static const String team_text = "Team";
  static const String sponsor_text = "Sponsors";
  static const String register_text = "Register";
  static const String map_text = "Locate Us";

  //* Preferences
  static SharedPreferences prefs;
  static const String loggedInPref = "loggedInPref1";
  static const String photoPref = "photoPref";
  static const String isAdminPref = "isAdminPref";
  static const String darkModePref = "darkModePref";
}
