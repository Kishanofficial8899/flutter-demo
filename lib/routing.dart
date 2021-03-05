import 'package:flutter_demos/Home.dart';
import 'package:flutter_demos/demos/getjson.dart';
import 'package:flutter_demos/demos/Steper.dart';
import 'package:flutter_demos/demos/Snakbar.dart';
import 'package:flutter_demos/demos/githubRepoFetchMobex.dart';
import 'package:flutter_demos/demos/google_map.dart';
import 'package:flutter_demos/demos/mobxFlutter.dart';
import 'package:flutter_demos/demos/tabbar.dart';
import 'package:flutter_demos/demos/vedioplayer.dart';
import 'demos/persist_value.dart';
import 'package:flutter_demos/demos/agecalculation.dart';

import 'demos/pushnotification.dart';

final appRoutes = {
  '/': (context) => HomePage(),
  '/jsonpage': (context) => JsonPage(),
  '/Stepper': (context) => Steper(),
  '/Snakbar': (context) => Snakbar(),
  '/mobex': (context) => MobexCounter(),
  '/github': (context) => GithubPage(),
  '/localstorage': (context) => PersistValue(),
  '/tabbar': (context) => Tabbar(),
  '/map': (context) => GoogleMapPage(),
  '/age': (context) => AgeCalc(),
  '/vedio': (context) => VideoPlayerScreen(),
  '/pushnotification': (context) => FirebaseCloudMessage(),
};
