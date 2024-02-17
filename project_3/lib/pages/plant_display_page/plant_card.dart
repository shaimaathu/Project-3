import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_3/data/data.dart';
import 'package:project_3/helper/extintion.dart';
import 'package:project_3/model/plant_data.dart';

class PlantDisplay1 extends StatefulWidget {
  PlantDisplay1(
      {super.key,
      required this.image,
      required this.title,
      required this.color,
      required this.prise,
      this.onTapCard,
      required this.plant});
  final String image;
  final String title;
  final Color color;
  final double prise;
  late bool isFavourite;
  final Function()? onTapCard;
  final PlantDataModel plant;

  @override
  State<PlantDisplay1> createState() => _PlantDisplayState();
}

class _PlantDisplayState extends State<PlantDisplay1> {
  @override
  Widget build(BuildContext context) {
    widget.isFavourite = GetIt.I.get<AllData>().favorite.contains(widget.plant)
        ? widget.isFavourite = true
        : widget.isFavourite = false;

    return Stack(children: [
      Container(
          margin:
              // EdgeInsets.all(20),
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
          height: context.getHeight() * 0.12,
          width: context.getWidth() * 0.40,
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: const BorderRadius.all(Radius.circular(18)))),
      Positioned(
        top: 40,
        left: 40,
        child: SizedBox(
          width: context.getWidth() * 0.15,
          child: Text("Air Purifier",
              style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              )),
        ),
      ),
      Positioned(
        top: 80,
        left: 40,
        child: SizedBox(
          width: context.getWidth() * 0.30,
          child: Text(
            widget.title,
            style: GoogleFonts.philosopher(
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 33, 64)),
            ),
          ),
        ),
      ),
      Positioned(
        top: 50,
        left: 120,
        child: Image.asset("assets/foot.png"),
      ),
      Positioned(
        top: 9,
        left: 135,
        child: Image.asset(
          widget.image,
          fit: BoxFit.cover,
          height: context.getHeight() / 8,
        ),
      ),
      Positioned(
        top: 110,
        left: 40,
        child: Text(
          "\$ ${widget.prise}",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 0, 33, 64)),
          ),
        ),
      ),
      Positioned(
        top: 100,
        left: 120,
        child: IconButton(
            icon: widget.isFavourite
                ? const Icon(
                    Icons.favorite,
                    color: Color.fromARGB(255, 0, 33, 64),
                  )
                : const Icon(
                    Icons.favorite_border_rounded,
                    color: Color.fromARGB(255, 0, 33, 64),
                  ),
            onPressed: () {
              setState(() {
                widget.isFavourite = !widget.isFavourite;
                if (widget.isFavourite == true) {
                  GetIt.I.get<AllData>().addToFavorite(plant: widget.plant);
                }
                if (widget.isFavourite == false) {
                  GetIt.I.get<AllData>().deleteFavorite(plant: widget.plant);
                }
              });
            }),
      ),
    ]);
  }
}
