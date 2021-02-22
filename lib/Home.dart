import 'package:flutter/material.dart';
import 'package:flutter_demos/navigation/navigationDrawer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'demos/components/theme_store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Theme Store

  ThemeStore _themeStore;

  GestureDetector getStructuredGridCell(onTap, icon, title) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
            elevation: 1.5,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  IconButton(
                    iconSize: 50,
                    color: Colors.blue,
                    icon: new Icon(icon),
                    onPressed: onTap,
                  ),
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            )));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore ??= Provider.of<ThemeStore>(context);
  }

  void changeTheme(
      ThemeStore _themeStore, BuildContext context, ThemeMode mode) {
    _themeStore.togleTheme(mode);
    Navigator.of(context).pop();
  }

  void _openBottomSlectionTheme(BuildContext context, ThemeStore _themeStore) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text("Light Theme"),
                leading: Icon(Icons.lightbulb),
                onTap: () => changeTheme(_themeStore, context, ThemeMode.light),
              ),
              ListTile(
                title: Text("Dark Theme"),
                leading: Icon(Icons.nights_stay),
                onTap: () => changeTheme(_themeStore, context, ThemeMode.dark),
              ),
              ListTile(
                title: Text("Systme Default"),
                leading: Icon(Icons.charging_station),
                onTap: () =>
                    changeTheme(_themeStore, context, ThemeMode.system),
              ),
            ],
          );
        });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Navigation(),
      appBar: AppBar(
        title: Text("Demo"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.lightbulb),
            tooltip: 'Show Snackbar',
            onPressed: () {
              _openBottomSlectionTheme(context, _themeStore);
            },
          ),
        ],
      ),
      body: Observer(builder: (_) {
        return GridView.count(
          crossAxisCount: 2,
          primary: true,
          padding: const EdgeInsets.all(1.0),
          childAspectRatio: 0.85,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          children: [
            getStructuredGridCell(
                () => Navigator.pushNamed(context, "/jsonpage"),
                Icons.developer_mode,
                "Fack Json App"),
            getStructuredGridCell(() => Navigator.pushNamed(context, "/mobex"),
                Icons.countertops, "Mobex Counter App"),
            getStructuredGridCell(() => Navigator.pushNamed(context, "/github"),
                Icons.code, "Fectching Repo Mobx"),
            getStructuredGridCell(
                () => Navigator.pushNamed(context, "/Stepper"),
                Icons.emoji_emotions,
                "Stepper"),
            getStructuredGridCell(
                () => Navigator.pushNamed(context, "/Snakbar"),
                Icons.wine_bar,
                "Snakbar"),
            getStructuredGridCell(() => _scaffoldKey.currentState.openDrawer(),
                Icons.navigation, "Navigation"),
            getStructuredGridCell(() => {}, Icons.home, "GridView"),
          ],
        );
      }),
    );
  }
}
