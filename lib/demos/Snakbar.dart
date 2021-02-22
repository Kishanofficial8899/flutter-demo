import 'package:flutter/material.dart';

class Snakbar extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Using SnackBar"),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: RaisedButton(
              child: Text('SHOW A SNACKBAR'),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Hello! I am SnackBar :)"),
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(
                      label: "Hit Me (Action)",
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("if You Hit me I will come again "),
                        ));
                      }),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
