import 'package:flutter/material.dart';
import 'package:flutter_demos/routing.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'demos/components/theme_store.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (BuildContext context) => ThemeStore(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          darkTheme: ThemeData.dark(),
          themeMode: Provider.of<ThemeStore>(context).themeMode,
          initialRoute: "/",
          routes: appRoutes),
    );
  }
}
