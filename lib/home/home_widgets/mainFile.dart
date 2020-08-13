import 'package:flutter/material.dart';
import 'package:flutter_devfest/home/home_widgets/CompletedEvent.dart';
import 'package:flutter_devfest/home/home_widgets/EventPage.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';


class Mainpage extends StatelessWidget {
  static const String routeName = "/agenda";

  @override
  Widget build(BuildContext context) {
    // var _homeBloc = HomeBloc();
    return DefaultTabController(
      length: 2,
      child: DevScaffold(
        settingsIcon: true,
        title: "Home",
        tabBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Color(0xffD31E3C),
          labelStyle: TextStyle(
            fontSize: 12,
          ),
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              child: Text("Upcoming"),
              // icon: Icon(
              //   FontAwesomeIcons.cloud,
              //   size: 12,
              // ),
            ),
            Tab(
              child: Text("Completed"),
              // icon: Icon(
              //   FontAwesomeIcons.mobile,
              //   size: 12,
              // ),
            ),
            // Tab(
            //   child: Text("Web & More"),
            //   icon: Icon(
            //     FontAwesomeIcons.chrome,
            //     size: 12,
            //   ),
            // )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            EventPage(
            ),
            CompletedEvent(
            ),
          ],
        ),
      ),
    );
  }
}


// class Mainpage extends StatefulWidget {
//   @override
//   _MainpageState createState() => _MainpageState();
// }

// class _MainpageState extends State<Mainpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(20),
//           child: InkWell(
//           onTap: (){
//                 Navigator.push(
//                     context,
//                     new MaterialPageRoute(
//                         builder: (context) => HomeFront(
//                            )));
//               },
//             child: Container(
//               alignment: Alignment.center,
//               padding: EdgeInsets.all(20),
//           height: MediaQuery.of(context).size.height * 0.2,
//           width: MediaQuery.of(context).size.width * 0.9,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey[200],
//                   blurRadius: 10,
//                   spreadRadius: 5,
//                 )
//               ]),
//           child: Text(
//             'Event-1',
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }

// DateTime date;

// class Mainpage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: Mainpagee(),
//     );
//   }
// }

// class Mainpagee extends StatefulWidget {
//   const Mainpagee({
//     Key key,
//   }) : super(key: key);

//   @override
//   _MainpageeState createState() => _MainpageeState();
// }

// class _MainpageeState extends State<Mainpagee> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: data.length,
//       itemBuilder: (context, index) => Container(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
//           child: DateTime.parse(data[index]["date"]).isAfter(DateTime.now()) ==
//                   true
//               ? InkWell(
//                   borderRadius: BorderRadius.circular(8),
//                   onTap: () {
//                     print("photos");
//                     print(data[index]["doodle"].length);

//                     Navigator.push(
//                         context,
//                         new MaterialPageRoute(
//                             builder: (context) => HomeFront()));
//                   },
//                   child: Ink(
//                     height: MediaQuery.of(context).size.height * 0.24,
//                     width: MediaQuery.of(context).size.width * 0.88,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey[200],
//                             blurRadius: 10,
//                             spreadRadius: 5,
//                           ),
//                         ]),
//                     child: Row(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Container(
//                             height: MediaQuery.of(context).size.height * 0.235,
//                             width: MediaQuery.of(context).size.width * 0.01,
//                             color: Color(0xffD31E3C),
//                           ),
//                         ),
//                         Container(
//                           height: MediaQuery.of(context).size.height * 0.2,
//                           width: MediaQuery.of(context).size.width * 0.87,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Container(
//                                 padding: EdgeInsets.only( left: 15),
//                                 child: Text(
//                                   'EVENT ${index + 1}',
//                                   style: TextStyle(
//                                       color: Color(0xffD31E3C), fontSize: 13),
//                                   textAlign: TextAlign.start,
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.only(left: 15, top: 5),
//                                 child: Text(
//                                   data[index]['name'],
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18,
//                                     // fontWeight: FontWeight.bold
//                                   ),
//                                   textAlign: TextAlign.start,
//                                 ),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   padding: EdgeInsets.only(top: 5, left: 15),
//                                   child: Text(
//                                     data[index]['content'],
//                                     style: TextStyle(
//                                         color: Colors.grey, fontSize: 13),
//                                     textAlign: TextAlign.start,
//                                   ),
//                                 ),
//                               ),

//                               // ListTile(
//                               //   leading: Icon(
//                               //     Icons.location_on,
//                               //     color: Color(0xffD31E3C),
//                               //   ),
//                               //   title: Text("In your phone",
//                               //       style: TextStyle(
//                               //           color: Colors.grey, fontSize: 13)),
//                               // ),
//                               //SizedBox(hei5),
//                               Container(
//                                 height: 25,
//                                 child: Row(
//                                   children: [
//                                     Container(

//                                       padding: EdgeInsets.only(top: 5, left: 10),
//                                       child: Icon(
//                                         Icons.location_on,
//                                         color: Color(0xffD31E3C),
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.only(top: 5, left: 5),
//                                       child: Text(
//                                         'In your phone',
//                                         style: TextStyle(
//                                             color: Colors.grey, fontSize: 13),
//                                         textAlign: TextAlign.start,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 10, left: 15),
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   // padding: EdgeInsets.only(top: 10, left: 30),
//                                   child: Text(
//                                     '${data[index]['date']} ${data[index]['time']}',
//                                     style: TextStyle(
//                                       color: Color(0xffD31E3C),
//                                     ),
//                                   ),
//                                   //color: Color(0xffffcccc),
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffffcccc),
//                                     borderRadius: BorderRadius.circular(25),
//                                   ),
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.46,
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.04,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               : null,
//         ),
//       ),
//     );
//   }
// }
