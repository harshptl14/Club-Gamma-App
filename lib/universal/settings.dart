// import 'package:flutter/material.dart';
// import 'package:flutter_devfest/config/config_bloc.dart';
// import 'package:flutter_devfest/utils/tools.dart';

// Widget _onButtonPressed(context) {
//   return showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//             height: 200,
//             child: ActionCard(
//                 icon: Icons.photo_album,
//                 color: Colors.purple,
//                 title: 'Gallery',
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       new MaterialPageRoute(
//                           builder: (context) => ActionCard()));
//                 }));
//       });
// }

// class ActionCard extends StatelessWidget {
//   final Function onPressed;
//   final IconData icon;
//   final String title;
//   final Color color;

//   const ActionCard({Key key, this.onPressed, this.icon, this.title, this.color})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(8),
//       onTap: onPressed,
//       child: Ink(
//         height: MediaQuery.of(context).size.height * 0.1,
//         width: MediaQuery.of(context).size.width * 0.2,
//         decoration: BoxDecoration(
//           color: ConfigBloc().darkModeOn
//               ? Tools.hexToColor("#1f2124")
//               : Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: !ConfigBloc().darkModeOn
//               ? [
//                   BoxShadow(
//                     color: Colors.grey[200],
//                     blurRadius: 10,
//                     spreadRadius: 5,
//                   )
//                 ]
//               : null,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Icon(
//               icon,
//               color: color,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               title,
//               style: Theme.of(context).textTheme.title.copyWith(
//                     fontSize: 12,
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
