import 'package:flutter/material.dart';
import 'package:flutter_devfest/homeWidget/Faq/FaqData.dart';
class FaqActivity extends StatefulWidget {
  @override
  _FaqActivityState createState() => _FaqActivityState();
}

class _FaqActivityState extends State<FaqActivity> {
  int _activeMeterIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Container(
        child: new ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int i) {
              return Container(
                child: ExpansionPanelList(
                  // expandedHeaderPadding: EdgeInsets.all(5),
                  //dividerColor: Colors.red,
                  expansionCallback: (int index, bool status) {
                    setState(() {
                      _activeMeterIndex = _activeMeterIndex == i ? null : i;
                    });
                  },
                  children: [
                    new ExpansionPanel(
                      canTapOnHeader: true,
                      isExpanded: _activeMeterIndex == i,
                      headerBuilder: (BuildContext context, bool isExpanded) =>
                          new Container(
                              padding: const EdgeInsets.only(left: 15.0),
                              alignment: Alignment.centerLeft,
                              child: new Text(
                               data[i]["name"],
                              )),
                      body: new Container(
                        padding: EdgeInsets.only(left:15, right: 15, bottom: 15),
                        child: new Text(data[i]['detail']),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}