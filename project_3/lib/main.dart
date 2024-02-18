import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_3/data/data.dart';
import 'package:project_3/pages/bottom_nav_page.dart';
import 'package:project_3/pages/cart_page/cart_page.dart';
import 'package:project_3/pages/home_screen/home_pagee.dart';
import 'package:project_3/pages/plant_display_page/plant_details_page.dart';
import 'package:project_3/utils/set_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  // GetIt.I.get<AllData>().storage.erase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
