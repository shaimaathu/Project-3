import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_3/data/data.dart';
import 'package:project_3/data/plants_data.dart';
import 'package:project_3/helper/extintion.dart';
import 'package:project_3/model/plant_data.dart';
import 'package:project_3/pages/home_screen/plant_container_widget.dart';
import 'package:project_3/pages/plant_display_page/plant_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Color> colors = [
    Color.fromARGB(255, 176, 234, 213),
    Color.fromARGB(255, 255, 243, 204),
    Color.fromARGB(255, 171, 232, 211),
    Color.fromARGB(255, 194, 232, 164),
    Color.fromARGB(255, 229, 240, 161),
    Color.fromARGB(255, 245, 237, 168),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Image.asset("assets/leading_app.png"),
          title: Text(
            "Plantify",
            style: GoogleFonts.philosopher(
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            Image.asset("assets/notification.png"),
            const SizedBox(
              width: 10,
            ),
            Image.asset("assets/menue.png"),
          ]),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.all(20),
          height: context.getHeight() / 4,
          width: context.getWidth() * 0.90,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color.fromARGB(255, 253, 199, 190),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 36,
                  right: 5,
                  child: Image.asset(
                    "assets/back.png",
                  )),
              Positioned(
                top: 40,
                left: 30,
                child: SizedBox(
                  width: context.getWidth() * 0.40,
                  child: Text(
                    "There's a Plant for everyone",
                    style: GoogleFonts.philosopher(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 33, 64))),
                  ),
                ),
              ),
              Positioned(
                top: 124,
                left: 30,
                child: SizedBox(
                    width: context.getWidth() * 0.30,
                    child: Text(
                      "Get your 1st plant @ 40% off",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
              Positioned(
                  top: 170,
                  left: 50,
                  child: Container(
                    color: Color.fromARGB(255, 13, 152, 106),
                    height: 3,
                    width: 50,
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: context.getWidth() * 0.15,
              width: context.getWidth() * 0.75,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(17)),
                  border: Border.all(
                      width: 2, color: Color.fromARGB(255, 0, 33, 64))),
              child: Row(children: [
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.search,
                  size: 35,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Search",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                )
              ]),
            ),
            const SizedBox(
              width: 20,
            ),
            Image.asset("assets/menue.png")
          ],
        ),
        TabBar(
          labelColor: const Color.fromARGB(255, 13, 152, 106),
          unselectedLabelColor: const Color.fromARGB(255, 0, 33, 64),
          indicatorColor: const Color.fromARGB(255, 13, 152, 106),
          controller: _tabController,
          onTap: (value) {},
          tabs: [
            Tab(
                child: Text(
              "All plants",
              style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            )),
            Tab(
                child: Text(
              "Indoor",
              style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            )),
            Tab(
                child: Text(
              "Outdoor",
              style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            )),
          ],
        ),
        SizedBox(
          height: context.getHeight() / 2.37,
          width: context.getWidth(),
          child: TabBarView(
            controller: _tabController, 
            children: [
            ListView(
              children: [
              ...List.generate(GetIt.I.get<AllData>().plants.length, (index) {
                final PlantDataModel plant =
                    PlantDataModel.fromJson(plantsData[index]);
                if (index == 2) {
                  return SizedBox(
                    height: context.getHeight() * 0.20,
                    width: context.getWidth(),
                    child: Stack(children: [
                      Positioned(
                        top: 10,
                        left: 20,
                        child: Container(
                          height: context.getHeight() * 0.18,
                          width: context.getWidth() * 0.85,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 232, 251, 232),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 50,
                        child: SizedBox(
                          width: context.getWidth() * 0.60,
                          child: Text(
                            "Invite a Friend and earn Plantify rewards",
                            style: GoogleFonts.philosopher(
                              textStyle: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 33, 64)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 50,
                        child: SizedBox(
                          width: context.getWidth() * 0.40,
                          child: Text(
                            "Redeem them to get instant discounts",
                            style: GoogleFonts.philosopher(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 13, 152, 106)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 120,
                          left: 200,
                          child: Container(
                            width: context.getWidth() * 0.15,
                            height: context.getWidth() * 0.09,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 13, 152, 106)),
                            child: Center(
                              child: Text(
                                "invite",
                                style: GoogleFonts.philosopher(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )),
                    ]),
                  );
                }
                if (index == 4) {
                  return SizedBox(
                    height: context.getHeight() * 0.10,
                    width: context.getWidth(),
                    child: Stack(children: [
                      Positioned(
                        top: 10,
                        left: 20,
                        child: SizedBox(
                          width: context.getWidth() * 0.90,
                          child: Text(
                            "Caring for plants should be fun. That's why we offer 1-on-1 virtual consultations from the comfort of your home or office. ",
                            style: GoogleFonts.philosopher(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 51, 51, 51)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 250,
                        child: SizedBox(
                          width: context.getWidth() * 0.40,
                          child: Text(
                            "Learn More",
                            style: GoogleFonts.philosopher(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 13, 152, 106)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 60,
                          left: 200,
                          child: Image.asset("assets/div.png")),
                    ]),
                  );
                }
                return PlantDisplay(
                  title: plant.name,
                  image: plant.imagePath,
                  color: colors[index],
                  prise: plant.price,
                  onTapCard: () {
                    context.pushTo(
                      view: PlantDisplayPage(
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
              }),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/last.png"),
                    Text(
                      "Plant a Life",
                      style: GoogleFonts.philosopher(
                        textStyle: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 33, 64)),
                      ),
                    ),
                    Text(
                      "Live amongst Living",
                      style: GoogleFonts.philosopher(
                        textStyle: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 51, 77, 102)),
                      ),
                    ),
                    Text(
                      "Spread the joy",
                      style: GoogleFonts.philosopher(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 127, 143, 159)),
                      ),
                    ),
                  ],
                ),
              )
            ]),
            ListView(children: [
              ...List.generate(GetIt.I.get<AllData>().plants.length, (index) {
                final PlantDataModel plant =
                    PlantDataModel.fromJson(plantsData[index]);
                if (plant.type == "Indoor Plant") {
                  return PlantDisplay(
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
                } else {
                  return Text(" ");
                }
              }),
            ]),
            ListView(children: [
              ...List.generate(GetIt.I.get<AllData>().plants.length, (index) {
                final PlantDataModel plant =
                    PlantDataModel.fromJson(plantsData[index]);
                if (plant.type == "Outdoor Plant") {
                  return PlantDisplay(
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
                } else {
                  return const Text(" ");
                }
              }),
            ]),
          ]),
        ),
      ]),
    );
  }
}
