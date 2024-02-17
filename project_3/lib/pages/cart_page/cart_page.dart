import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_3/data/data.dart';
import 'package:project_3/helper/extintion.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "  Your Bag",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 13, 152, 106)),
                  ),
                ),
               GridView.count(
      crossAxisCount: 3,
      children:[

        // ...List.generate(GetIt.I.get<AllData>().cart.length, (index) {
        //   return SizedBox(
        //           height: context.getWidth() / 5,
        //           width: context.getWidth() / 5,
        //           child: Stack(children: [
        //             Positioned(
        //               top: 45,
        //               left: 22,
        //               child: Image.asset(
        //                 "assets/Rect.png",
        //                 // color: Colors.amber,
        //               ),
        //             ),
        //             Image.asset(
        //               "assets/sage.png",
        //               height: context.getWidth() / 5,
        //               width: context.getWidth() / 5,
        //             ),
        //           ]),
        //         ),

          
        // })
      ]),
                
              ],
            ),
          ),
        ));
  }
}
