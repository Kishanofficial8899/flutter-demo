// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PersistValue extends StatefulWidget {
//   @override
//   PersistValueState createState() => PersistValueState();
// }

// class PersistValueState extends State<PersistValue> {
//   var nameOfApp = "Persist Key Value";
//   var counter = 0;
//   var key = "persist_counter";

//   @override
//   void initState() {
//     super.initState();
//     _loadSavedData();
//   }

//   void _loadSavedData() async {
//     SharedPreferences data = await SharedPreferences.getInstance();
//     setState(() {
//       counter = (data.getInt(key) ?? 0);
//     });
//   }

//   void _onIncrementHit() async {
//     SharedPreferences data = await SharedPreferences.getInstance();
//     setState(() {
//       counter = (data.getInt(key) ?? 0) + 1;
//     });

//     data.setInt(key, counter);
//   }

//   void _onDecrementHit() async {
//     SharedPreferences data = await SharedPreferences.getInstance();

//     setState(() {
//       counter = (data.getInt(key) ?? 0) - 1;
//     });

//     data.setInt(key, counter);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Store Data in storage"),
//       ),
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             '$counter',
//             textScaleFactor: 10.0,
//           ),
//           Padding(padding: EdgeInsets.all(10.0)),
//           RaisedButton(
//               onPressed: _onIncrementHit, child: Text('Increment Counter')),
//           Padding(padding: EdgeInsets.all(10.0)),
//           RaisedButton(
//               onPressed: _onDecrementHit, child: Text('Decrement Counter')),
//         ],
//       )),
//     );
//   }
// }
