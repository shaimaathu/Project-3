import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_3/data/data.dart';
import 'package:project_3/data/plants_data.dart';
import 'package:project_3/helper/extintion.dart';
import 'package:badges/badges.dart' as badges;
import 'package:project_3/model/plant_data.dart';
import 'package:project_3/pages/cart_page/cart_page.dart';
import 'package:project_3/pages/plant_display_page/plant_card.dart';

class PlantDisplayPage extends StatefulWidget {
  const PlantDisplayPage({super.key, required this.plant});
  final PlantDataModel plant;



  @override
  State<PlantDisplayPage> createState() => _PlantDisplayPageState();
}

class _PlantDisplayPageState extends State<PlantDisplayPage> {
    bool isFavourite = false;
  bool result = false;
  @override
  Widget build(BuildContext context) {
        isFavourite = GetIt.I.get<AllData>().favorite.contains(widget.plant)
        ? isFavourite = true
        : isFavourite = false;
    double summ = sum();
    List<Color> colors = [
      Color.fromARGB(255, 176, 234, 213),
      Color.fromARGB(255, 255, 243, 204),
      Color.fromARGB(255, 171, 232, 211),
      Color.fromARGB(255, 194, 232, 164),
      Color.fromARGB(255, 229, 240, 161),
      Color.fromARGB(255, 245, 237, 168),
      Color.fromARGB(255, 176, 234, 213),
      Color.fromARGB(255, 255, 243, 204),
    ];

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 156, 229, 203),
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
        body: ListView(children: [
          SizedBox(
            width: context.getWidth(),
            height: context.getHeight() / 2.2,
            child: Stack(
              children: [
                Container(
                  height: context.getHeight() / 2.5,
                  width: context.getWidth(),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 156, 229, 203),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35))),
                ),
                Positioned(
                  top: 30,
                  left: 40,
                  child: Text("Air Purifier",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      )),
                ),
                Positioned(
                  top: 50,
                  left: 40,
                  child: SizedBox(
                    width: context.getWidth() * 0.50,
                    child: Text(
                      widget.plant.name,
                      style: GoogleFonts.philosopher(
                        textStyle: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 33, 64)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 340,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 30,
                      width: 70,
                      child: Image.asset("assets/star.png")),
                ),
                Positioned(
                  top: 30,
                  left: 150,
                  child: Image.asset("assets/foot.png"),
                ),
                Positioned(
                  top: 60,
                  left: 150,
                  child: Image.asset(
                    widget.plant.imagePath,
                    fit: BoxFit.cover,
                    height: context.getHeight() / 2.5,
                  ),
                ),
                Positioned(
                  top: 160,
                  left: 40,
                  child: Text(
                    "price",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 62, 112, 119)),
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 40,
                  child: Text(
                    "\$ ${widget.plant.price}",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 0, 33, 64)),
                    ),
                  ),
                ),
                Positioned(
                  top: 220,
                  left: 40,
                  child: Text(
                    "size",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 62, 112, 119)),
                    ),
                  ),
                ),
                Positioned(
                  top: 240,
                  left: 40,
                  child: Text(
                    widget.plant.size,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 0, 33, 64)),
                    ),
                  ),
                ),
                Positioned(
                  top: 340,
                  left: 100,
                  child: Container(
                    height: 50,
                    width: 50,
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
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(20, 20))),
                    child: IconButton(
                        icon: isFavourite
                            ? const Icon(
                                Icons.favorite,
                                color: Color.fromARGB(255, 193, 0, 0),
                              )
                            : const Icon(
                                Icons.favorite_border_rounded,
                                color: Color.fromARGB(255, 0, 33, 64),
                              ),
                        onPressed: () {
                          result = true;
                          setState(() {
                            isFavourite = !isFavourite;
                            if (isFavourite == true) {
                              GetIt.I
                                  .get<AllData>()
                                  .addToFavorite(plant: widget.plant);
                            }
                            if (isFavourite == false) {
                              GetIt.I
                                  .get<AllData>()
                                  .deleteFavorite(plant: widget.plant);
                            }
                          });
                        }),
                  ),
                ),
                Positioned(
                  top: 340,
                  left: 30,
                  child: InkWell(
                    onTap: () {
                      GetIt.I.get<AllData>().addDataToCart(plant: widget.plant);
                      setState(() {});
                      result = true;
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 9,
                              offset:
                                  const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.elliptical(20, 20))),
                      child: Image.asset(
                        "assets/cart.png",
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Overview",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 33, 64)),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/wat.png"),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.plant.water.toString(),
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 13, 152, 106)),
                          ),
                        ),
                        Text(
                          "Water",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 102, 122, 140)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset("assets/sun.png"),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.plant.light.toString(),
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 13, 152, 106)),
                          ),
                        ),
                        Text(
                          "Light",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 102, 122, 140)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset("assets/dots.png"),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.plant.fertilizer.toString(),
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 13, 152, 106)),
                          ),
                        ),
                        Text(
                          "Fertilizer",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 102, 122, 140)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Plant Bio",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 33, 64)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.plant.description,
                  style: GoogleFonts.philosopher(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 77, 103, 74)),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Image.asset(
                "assets/im1.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/im2.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/im5.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/im4.png",
                fit: BoxFit.cover,
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Similar Plants",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 0, 33, 64)),
              ),
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ...List.generate(GetIt.I.get<AllData>().plants.length, (index) {
                final PlantDataModel plant =
                    PlantDataModel.fromJson(plantsData[index]);
                  return PlantDisplay1(
                    title: plant.name,
                    image: plant.imagePath,
                    color: colors[index],
                    prise: plant.price,
                    onTapCard: () {
                      context.pushTo(
                        view:  PlantDisplayPage(
                            plant: plant,
                            ),
                        onValue: (value) {
                          if (value == true) {
                            setState(() {});
                          }
                        },
                      );
                    },
                    plant: plant,
                  );
                })
              ])),
          Container(
            height: context.getHeight() / 5,
            width: context.getWidth(),
            color: const Color.fromARGB(255, 245, 237, 168),
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  left: 40,
                  child: Text(
                    "That very plant?",
                    style: GoogleFonts.philosopher(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 0, 33, 64)),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 40,
                  child: SizedBox(
                    width: context.getWidth() / 2.5,
                    child: Text(
                      "Just Scan and the AI will know exactly",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 33, 64)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 145,
                  left: 40,
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Color.fromARGB(255, 13, 152, 106))),
                    child: Center(
                      child: Text(
                        "Scan Now",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 13, 152, 106)),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 35,
                    left: 250,
                    child: Image.asset(
                      "assets/AI_Scan.png",
                      height: context.getHeight() / 6.7,
                      fit: BoxFit.contain,
                    ))
              ],
            ),
          )
        ]),
        bottomNavigationBar: InkWell(
          onTap: () {
            context.pushTo(
              view: CartPage(),
            );
          },
          child: Container(
            height: 60,
            width: context.getWidth(),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 11, 132, 92),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: badges.Badge(
                showBadge: false,
                onTap: () {
                  context.pushTo(view: const CartPage());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          "assets/cartt.png",
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Text(
                      "View ${GetIt.I.get<AllData>().cart.length} items",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "\$ $summ",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}

double sum() {
  double sum = 0.0;
  List.generate(GetIt.I.get<AllData>().cart.length, (index) {
    if (GetIt.I.get<AllData>().cart.isNotEmpty) {
      sum += GetIt.I.get<AllData>().cart[index].price;
      return sum;
    }
  });
  return sum;
}
