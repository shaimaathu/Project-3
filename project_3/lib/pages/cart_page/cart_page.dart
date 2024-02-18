import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_3/data/data.dart';
import 'package:project_3/helper/extintion.dart';
import 'package:project_3/model/plant_data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late double total = sum1();
  int quant = 1;

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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                " Your Bag",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 13, 152, 106)),
                ),
              ),
              ...List.generate(GetIt.I.get<AllData>().cart.length, (index) {
                PlantDataModel plant = GetIt.I.get<AllData>().cart[index];
                return ListTile(
                  leading: SizedBox(
                    height: context.getWidth() / 6,
                    width: context.getWidth() / 7,
                    child: Stack(children: [
                      Positioned(
                        top: 9,
                        left: 2,
                        child: Image.asset(
                          "assets/Rect.png",
                          color: colors[index],
                        ),
                      ),
                      Positioned(
                        child: Image.asset(
                          plant.imagePath,
                          height: context.getWidth() / 2,
                        ),
                      ),
                    ]),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        plant.name,
                        style: GoogleFonts.philosopher(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 33, 64))),
                      ),
                      InkWell(
                        onTap: () {
                          GetIt.I.get<AllData>().deleteCart(plant: plant);
                          GetIt.I.get<AllData>().addToSaved(plant: plant);
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.bookmark_border,
                          size: 30,
                          color: Color.fromARGB(255, 13, 152, 106),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              quant += 1;
                              setState(() {
                                total += plant.price;
                              });
                            },
                            child: Image.asset("assets/plus.png")),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("${quant}"),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              quant -= 1;
                              setState(() {
                                total -= plant.price;
                              });
                            },
                            child: Image.asset("assets/min.png")),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                            onTap: () {
                              GetIt.I.get<AllData>().deleteCart(plant: plant);
                              setState(() {});
                            },
                            child: Image.asset("assets/trash.png")),
                      ]),
                  trailing: Text(
                    "\$ ${sum(quant, plant.price)}",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 33, 64)),
                    ),
                  ),
                );
              }),
              Row(
                children: [
                  Image.asset("assets/del1.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery",
                            style: GoogleFonts.philosopher(
                              textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 33, 64)),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Image.asset("assets/prog1.png"),
                              Image.asset("assets/prog2.png"),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 260,
                        child: Stack(children: [
                          SizedBox(
                            width: 160,
                            child: Text(
                              "Order above ₹1200 to get free delivery",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 0, 33, 64)),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 120,
                            child: Text(
                              "Shop for more ₹190",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 13, 152, 106)),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "\$80",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 13, 152, 106)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Image.asset("assets/del2.png"),
                      Image.asset("assets/del22.png"),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Apply Coupon",
                    style: GoogleFonts.philosopher(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 33, 64)),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/del222.png")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "total",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 0, 33, 64)),
                    ),
                  ),
                  Text(
                    "\$ ${total}",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 0, 33, 64)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saved for later",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 13, 152, 106)),
                    ),
                  ),
                  Text(
                    "${GetIt.I.get<AllData>().saved.length} items",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 13, 152, 106)),
                    ),
                  ),
                ],
              ),
              ...List.generate(GetIt.I.get<AllData>().saved.length, (index) {
                PlantDataModel plant = GetIt.I.get<AllData>().cart[index];
                return ListTile(
                  leading: SizedBox(
                    height: context.getWidth() / 6,
                    width: context.getWidth() / 7,
                    child: Stack(children: [
                      Positioned(
                        top: 9,
                        left: 2,
                        child: Image.asset(
                          "assets/Rect.png",
                          color: colors[index],
                        ),
                      ),
                      Positioned(
                        child: Image.asset(
                          plant.imagePath,
                          height: context.getWidth() / 2,
                        ),
                      ),
                    ]),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        plant.name,
                        style: GoogleFonts.philosopher(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 33, 64))),
                      ),
                      InkWell(
                        onTap: () {
                          GetIt.I.get<AllData>().deleteSaved(plant: plant);
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.bookmark,
                          size: 25,
                          color: Color.fromARGB(255, 13, 152, 106),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              quant += 1;
                              setState(() {});
                            },
                            child: Image.asset("assets/plus.png")),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("$quant"),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              quant -= 1;
                              setState(() {});
                            },
                            child: Image.asset("assets/min.png")),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                            onTap: () {
                            GetIt.I.get<AllData>().deleteSaved(plant: plant);
                              setState(() {});
                            },
                            child: Image.asset("assets/trash.png")),
                      ]),
                  trailing: Text(
                    "\$ ${sum(quant, plant.price)}",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 33, 64)),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: context.getWidth(),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 11, 132, 92),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Checkout",
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
                "\$ $total",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double sum1() {
  double sum = 0.0;
  List.generate(GetIt.I.get<AllData>().cart.length, (index) {
    if (GetIt.I.get<AllData>().cart.isNotEmpty) {
      sum += GetIt.I.get<AllData>().cart[index].price;
      return sum;
    }
  });
  return sum;
}

double sum(int i, double price) {
  double sum = 0.0;
  sum = i * price;
  return sum;
}
