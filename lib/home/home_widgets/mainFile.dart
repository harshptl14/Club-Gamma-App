import 'package:flutter/material.dart';
import 'package:flutter_devfest/home/home_widgets/home_front.dart';

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
          child: InkWell(
          onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => HomeFront(
                           )));
              },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  blurRadius: 10,
                  spreadRadius: 5,
                )
              ]),
          child: Text(
            'Event-1',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
