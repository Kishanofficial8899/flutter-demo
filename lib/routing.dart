import 'package:flutter_demos/Home.dart';
import 'package:flutter_demos/demos/getjson.dart';
import 'package:flutter_demos/demos/Steper.dart';
import 'package:flutter_demos/demos/Snakbar.dart';
import 'package:flutter_demos/demos/githubRepoFetchMobex.dart';
import 'package:flutter_demos/demos/mobxFlutter.dart';

final appRoutes = {
  '/': (context) => HomePage(),
  '/jsonpage': (context) => JsonPage(),
  '/Stepper': (context) => Steper(),
  '/Snakbar': (context) => Snakbar(),
  '/mobex': (context) => MobexCounter(),
  '/github': (context) => GithubPage(),
  // '/local': (context) => PersistValue(),
};
