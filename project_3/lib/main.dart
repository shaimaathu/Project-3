import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project_3/pages/bottom_nav_page.dart';
import 'package:project_3/pages/cart_page/cart_page.dart';
import 'package:project_3/pages/home_screen/home_pagee.dart';
import 'package:project_3/pages/plant_display_page/plant_details_page.dart';
import 'package:project_3/utils/set_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
