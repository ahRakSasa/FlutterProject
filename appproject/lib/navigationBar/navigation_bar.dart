// import 'package:flutter/material.dart';

// class NavigationBar extends StatefulWidget {
//   NavigationBar({Key? key}) : super(key: key);

//   @override
//   State<NavigationBar> createState() => _NavigationBarState();
// }

// class _NavigationBarState extends State<NavigationBar> {
//   int index = 2;
//   @override
//   Widget build(BuildContext context) {
//     final items = <Widget>[
//       InkWell(
//         child: Icon(Icons.person, size: 30),
//         onTap: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => HomeScreen()));
//         },
//       ),
//       InkWell(
//         child: Icon(Icons.favorite, size: 30),
//         onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => RegistrationScreen()));
//         },
//       ),
//       InkWell(
//         child: Icon(Icons.home, size: 30),
//         onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => WelcomeScreen()));
//         },
//       ),
//       InkWell(
//         child: Icon(Icons.search, size: 30),
//         onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => RegistrationScreen()));
//         },
//       ),
//       InkWell(
//         child: Icon(Icons.add, size: 30),
//         onTap: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => LoginScreen()));
//         },
//       ),
//     ];
//   }
// }
