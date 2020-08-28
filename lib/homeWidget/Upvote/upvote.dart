import 'package:flutter/material.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/clubgamma.dart';

var count;

class UpvoteEvent extends StatefulWidget {
  @override
  _UpvoteEventState createState() => _UpvoteEventState();
}

class _UpvoteEventState extends State<UpvoteEvent> {
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
        title: 'Upvote',
        body:

            Center(
          child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Image.asset(ClubGamma.upvote, fit: BoxFit.cover,),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Text(
                      'You will be given chance to vote here!',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )),
        ));
  }
}
