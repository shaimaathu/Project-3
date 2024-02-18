import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Image.asset("assets/leading_app.png"),
              ],
            ),
            title: Text(
              "Plantify",
              style: GoogleFonts.philosopher(
                letterSpacing: BorderSide.strokeAlignOutside,
                textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            actions: [
              const Icon(Icons.search),
              const SizedBox(
                width: 10,
              ),
              Image.asset("assets/menue.png"),
              const SizedBox(
                width: 20,
              ),
            ]),
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Center(
                child: Image.asset("assets/prof2.png"),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "shaimaa althubaiti",
                  style: GoogleFonts.philosopher(
                    textStyle: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 13, 152, 106)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "shaimaa@gmail.com",
                  style: GoogleFonts.philosopher(
                    textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 32, 57, 1)),
                  ),
                ),
              ),
            ])));
  }
}
