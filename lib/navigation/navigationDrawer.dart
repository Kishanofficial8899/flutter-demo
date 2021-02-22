import 'package:flutter/material.dart';
import 'package:flutter_demos/navigation/navigationHeader.dart';
import 'package:flutter_demos/navigation/navigationBody.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          navigationHeader(),
          navaigationBody(
            icon: Icons.developer_mode,
            text: 'Json',
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushNamed(context, "/jsonpage")
            },
          ),
          navaigationBody(
            icon: Icons.emoji_emotions,
            text: 'Stepper',
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushNamed(context, "/Stepper")
            },
          ),
          navaigationBody(
            icon: Icons.wine_bar,
            text: 'Snakbar Demo',
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushNamed(context, "/Snakbar")
            },
          ),
          navaigationBody(
            icon: Icons.emoji_emotions,
            text: 'Mbex Counter Demo',
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushNamed(context, "/mobex")
            },
          ),
          navaigationBody(
            icon: Icons.code,
            text: 'Github Repo Fetcher',
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushNamed(context, "/github")
            },
          ),
          navaigationBody(
            icon: Icons.code,
            text: 'Local',
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushNamed(context, "/local")
            },
          ),
        ],
      ),
    );
  }
}
// PersistValue
