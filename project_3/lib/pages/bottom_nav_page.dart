import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_3/pages/cart_page/cart_page.dart';
import 'package:project_3/pages/favorite_page.dart';
import 'package:project_3/pages/home_screen/home_pagee.dart';
import 'package:project_3/pages/profile_page.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;
  PageController? controllerPageView = PageController();
  List<Widget> screens = [
    const HomePage(),
    const FavoriteScreen(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          clipBehavior:
              Clip.hardEdge, //or better look(and cost) using Clip.antiAlias,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 9,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
          ),
          child: NavigationBar(
              surfaceTintColor: Colors.white,
              shadowColor: Colors.grey,
              elevation: 10,
              onDestinationSelected: (indexOnTap) {
                selectedIndex = indexOnTap;
                setState(() {});
              },
              backgroundColor: Colors.white,
              // shadowColor: Colors.grey,
              indicatorColor: Color.fromARGB(255, 254, 234, 9),
              indicatorShape: CircleBorder(eccentricity: 0.1),
              selectedIndex: selectedIndex,
              destinations: <Widget>[
                NavigationDestination(
                    icon: Image.asset("assets/home.png"), label: " "),
                NavigationDestination(
                    icon: Image.asset("assets/fiv.png"), label: " "),
                NavigationDestination(
                    icon: Image.asset("assets/cartt.png"), label: " "),
                NavigationDestination(
                    icon: Image.asset("assets/profile.png"), label: " "),
              ]),
        ),

        // bottomNavigationBar: BottomNavigationBar(
        //   onTap: (indexOnTap) {
        //     selectedIndex = indexOnTap;
        //     setState(() {});
        //   },
        //   elevation: 20,
        //   enableFeedback: false,
        //   currentIndex: selectedIndex,
        //   type: BottomNavigationBarType.fixed,
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: Image.asset("assets/home.png"), label: " "),
        //     BottomNavigationBarItem(
        //         icon: Image.asset("assets/fiv.png"), label: " "),
        //     BottomNavigationBarItem(
        //         icon: Image.asset("assets/cartt.png"), label: " "),
        //     BottomNavigationBarItem(
        //         icon: Image.asset("assets/profile.png"), label: " "),
        //   ],
        // ),
        body: screens[selectedIndex]);
  }
}
