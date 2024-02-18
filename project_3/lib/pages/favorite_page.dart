import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_3/data/data.dart';
import 'package:project_3/helper/extintion.dart';
import 'package:project_3/model/plant_data.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Color> colors = [
    Color.fromARGB(255, 176, 234, 213),
    Color.fromARGB(255, 255, 243, 204),
    Color.fromARGB(255, 171, 232, 211),
    Color.fromARGB(255, 194, 232, 164),
    Color.fromARGB(255, 229, 240, 161),
    Color.fromARGB(255, 245, 237, 168),
  ];

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
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Favorite",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 13, 152, 106)),
                  ),
                ),
                ...List.generate(GetIt.I.get<AllData>().favorite.length,
                    (index) {
                  PlantDataModel plant = GetIt.I.get<AllData>().cart[index];
                  return ListTile(
                      leading: SizedBox(
                        height: context.getWidth() / 5,
                        width: context.getWidth() / 5,
                        child: Stack(children: [
                          Positioned(
                            top: 45,
                            left: 22,
                            child: Image.asset(
                              "assets/Rect.png",
                              color: colors[index],
                            ),
                          ),
                          Image.asset(
                            plant.imagePath,
                            height: 150,
                            width: 200,
                          ),
                        ]),
                      ),
                      title: Text(
                        plant.name,
                        style: GoogleFonts.philosopher(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 33, 64))),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          GetIt.I.get<AllData>().deleteFavorite(plant: plant);
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.favorite,
                          color: Color.fromARGB(255, 193, 0, 0),
                        ),
                      ));
                }),
              ],
            ),
          ),
        ));
  }
}
