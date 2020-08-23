import 'package:flutter/material.dart';
import 'package:flutter_devfest/home/index.dart';
import 'package:flutter_devfest/model/faqModel.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';

class FaqActivity extends StatefulWidget {
  @override
  _FaqActivityState createState() => _FaqActivityState();
}

var _homeBloc = HomeBloc();
var state = _homeBloc.currentState as InHomeState;
dynamic faqqq = state.faqData;

class _FaqActivityState extends State<FaqActivity> {
  int _activeMeterIndex;
  @override
  void initState() {
    loadFaqQue(faqqq).then((value) {
      setState(() {
        _list.addAll(value);
      });
    });
    super.initState();
  }

  List<EventFaq> _list = List<EventFaq>();

  Future<List<EventFaq>> loadFaqQue(que) async {
    List<EventFaq> fque = que;
    return fque;
  }

  @override
  Widget build(BuildContext context) {
    // print(_list);
    return DevScaffold(
        title: 'FAQ',
        body: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (BuildContext context, int i) {
              print(
                _list[i],
              );

              return Container(
                child: ExpansionPanelList(
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
                                _list[i].name,
                              )),
                      body: new Container(
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 15),
                        child: new Text(_list[i].detail),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
