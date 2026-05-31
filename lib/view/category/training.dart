import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Training extends StatefulWidget {
  const Training({super.key});

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  final List<Map<String, dynamic>> trainingList = [
    {
      "image": "assets/training/training1.jpg",
      "videoname": "Obedience Courses",
      "trainername": "Jhon Smith",
      "rating": 4.9,
      "count": 335,
    },
    {
      "image": "assets/training/training2.png",
      "videoname": "Specialty Classes & Workshops",
      "trainername": "Duke Fuzzington",
      "rating": 5,
      "count": 500,
    },
    {
      "image": "assets/training/training3.png",
      "videoname": "Puppy Kinderganten and Playgroups",
      "trainername": "Sir Fluffington",
      "rating": 5,
      "count": 500,
    },
    {
      "image": "assets/training/training4.png",
      "videoname": "Canine Good Citizen Test",
      "trainername": "Baron Fuzzypaws",
      "rating": 4.8,
      "count": 220,
    },
    {
      "image": "assets/training/training5.png",
      "videoname": "Theraphy Dogs",
      "trainername": "Duke Fuzzington",
      "rating": 5,
      "count": 500,
    },
    {
      "image": "assets/training/training6.jpg",
      "videoname": "Obedience Courses",
      "trainername": "Jhon Smith",
      "rating": 5,
      "count": 500,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),

            ///BackButton and Title
            Row(
              children: [
                GestureDetector(
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
                const Spacer(),
                Text(
                  "Training",
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(31, 32, 41, 1),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            ///Training Video GridView
            Expanded(
              child: ListView.builder(
                itemCount: trainingList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //height: 122,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 16,
                          spreadRadius: -4,
                          offset: Offset(0, 8),
                          color: Color.fromRGBO(22, 34, 51, 0.08),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage(trainingList[index]["image"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/training/play.png",
                                height: 30,
                                width: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 189,
                              child: Text(
                                trainingList[index]["videoname"],
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(31, 32, 41, 1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 189,
                              child: Text(
                                " By ${trainingList[index]["trainername"]}",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(31, 32, 41, 1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Image.asset("assets/training/star.png"),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  " ${trainingList[index]["rating"]} (${trainingList[index]["count"]})",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(194, 195, 204, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
