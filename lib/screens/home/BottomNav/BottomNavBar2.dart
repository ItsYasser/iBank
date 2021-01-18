// import 'package:flutter/material.dart';

// class BottomNavBar extends StatelessWidget {
//   final Size size;

//   const BottomNavBar({Key key, this.size}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     print(60 / size.height);
//     return Container(
//       color: Colors.red,
//       padding: EdgeInsets.symmetric(horizontal: 28),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: size.width / 2.66,
//             child: FloatingActionButton(
//               mini: true,
//               backgroundColor: Color(0xff8A1AE6),
//               onPressed: () {},
//               child: Icon(
//                 Icons.add,
//               ),
//               elevation: 3,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 25),
//             child: ClipPath(
//               clipper: MyCustomClipper3(),
//               child: Container(
//                 height: size.height * 0.075,
//                 width: double.infinity,
//                 margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.3),
//                       spreadRadius: 1,
//                       blurRadius: 4,
//                       offset: Offset(0, 1),
//                     ),
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.1),
//                       spreadRadius: 1,
//                       blurRadius: 2,
//                       offset: Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Icon(
//                       Icons.home,
//                       color: Color(0xff8A1AE6),
//                     ),
//                     Icon(
//                       Icons.settings_backup_restore,
//                       color: Colors.grey,
//                     ),
//                     Icon(
//                       Icons.bar_chart,
//                       color: Colors.grey,
//                     ),
//                     Icon(
//                       Icons.supervised_user_circle,
//                       color: Colors.grey,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyCustomClipper3 extends CustomClipper<Path> {
//   final double radius;

//   MyCustomClipper3({this.radius});
//   @override
//   Path getClip(Size size) {
//     // int holeRadius = 25;
//     final path = Path()
//       ..moveTo(0, 0)
//       ..lineTo((size.width / 2) - radius, 0.0)
//       ..arcToPoint(
//         Offset((size.width / 2) + radius, 0),
//         clockwise: false,
//         radius: Radius.circular(1),
//       )
//       ..lineTo(size.width, 0.0)
//       ..lineTo(size.width, size.height)
//       ..lineTo(0, size.height)
//       ..lineTo(0, 0);

//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(MyCustomClipper3 oldClipper) => true;
// }
