import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Grooming extends StatefulWidget {
  const Grooming({super.key});

  @override
  State<Grooming> createState() => _GroomingState();
}

class _GroomingState extends State<Grooming> {
  final List<Map<String, dynamic>> groomingList = [
    {
      "image": "assets/grooming/bathing_drying.png",
      "name": "Bathing & Drying",
    },
    {
      "image": "assets/grooming/hair_trimming.png",
      "name": "Hair Trimming",
    },
    {
      "image": "assets/grooming/nail_trimming.png",
      "name": "Nail Trimming",
    },
    {
      "image": "assets/grooming/ear_cleaning.png",
      "name": "Ear Cleaning",
    },
    {
      "image": "assets/grooming/teeth_cleaning.png",
      "name": "Teeth Cleaning",
    },
    {
      "image": "assets/grooming/vaccination.png",
      "name": "Vaccination",
    },
  ];

  ///Controller
  final TextEditingController _searchGroomingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            ///Backbutton & Title
            Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 16,
                          spreadRadius: -4,
                          offset: Offset(0, 8),
                          color: Color.fromRGBO(22, 34, 51, 0.08),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: 17,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
            ),
                const Spacer(),
                Text(
                  "Grooming",
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(31, 32, 41, 1),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 15),

            ///Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                color: Theme.of(context).primaryColor,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 16,
                    spreadRadius: -4,
                    color: Color.fromRGBO(22, 34, 51, 0.08),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "60% OFF",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(245, 245, 247, 1),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "On hair & spa treatment",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(245, 245, 247, 1),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 67,
                    width: 71,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Theme.of(context).primaryColor,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 11),
                          blurRadius: 25,
                          spreadRadius: 0,
                          color: Color.fromRGBO(22, 34, 51, 0.08),
                        ),
                        BoxShadow(
                          offset: Offset(0, 8),
                          blurRadius: 16,
                          spreadRadius: -4,
                          color: Color.fromRGBO(22, 34, 51, 0.08),
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage("assets/grooming/grooming_offer.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            ///Searchbar
            SizedBox(
              height: 40,
              child: TextFormField(
                controller: _searchGroomingController,
                cursorHeight: 18,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(31, 32, 41, 1),
                ),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(194, 195, 204, 1),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromRGBO(250, 200, 162, 1),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromRGBO(250, 200, 162, 1),
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.search_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Our Services",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(31, 32, 41, 1),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See All",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(194, 195, 204, 1),
                    ),
                  ),
                ),
              ],
            ),

            ///GridView
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 3.9 / 4,
                ),
                itemCount: groomingList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 8),
                            blurRadius: 16,
                            spreadRadius: -4,
                            color: Color.fromRGBO(22, 34, 51, 0.08),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 101,
                            width: 122,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              image: DecorationImage(
                                image: AssetImage(groomingList[index]["image"]),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 16,
                                  spreadRadius: -4,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            groomingList[index]["name"],
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(49, 29, 14, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animate().slideX(begin: -1, end: 0, delay: (index * 150).ms, duration: 600.ms, curve: Curves.easeOutBack).fade();
                },
              ),
            ),
          ],
        ),
      ).animate().fade(duration: 800.ms),
    );
  }
}
