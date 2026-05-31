import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pet_car_app/view/service/veterinary.dart';

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  /// List for services
  final List<Map<String, dynamic>> serviceList = [
    {
      "image": "assets/service/vaccination.jpg",
      "servicename": "Vaccinations",
    },
    {
      "image": "assets/service/operations.jpg",
      "servicename": "Operations",
    },
    {
      "image": "assets/service/behaviorals.jpg",
      "servicename": "Behaviorals",
    },
    {
      "image": "assets/service/dentistry.jpg",
      "servicename": "Dentistry",
    },
  ];

  /// List for Doctors
  final List<Map<String, dynamic>> doctorList = [
    {
      "photo": "assets/service/doctors/doctor1.jpg",
      "name": "Dr. Anna Johanson",
      "specialist": "Veterinary Behavioral",
      "about":
          "Dr. Anna Johanson is a highly experienced veterinarian with 10 years of dedicated practice, showcasing a pro...",
      "rating": 4.8,
      "experience": 10,
      "price": 250,
      "location": 1,
    },
    {
      "photo": "assets/service/doctors/doctor2.jpg",
      "name": "Dr. Vernon Chwe",
      "specialist": "Veterinary Surgery",
      "about":
          "Dr. Vernon Chwe is a highly experienced veterinarian with 12 years of dedicated practice, showcasing a pro...",
      "rating": 4.9,
      "experience": 12,
      "price": 500,
      "location": 1.5,
    },
    {
      "photo": "assets/service/doctors/doctor3.jpg",
      "name": "Dr. Maria Naiis",
      "specialist": "Veterinary Behavioral",
      "about":
          "Dr. Maria Naiis is a highly experienced veterinarian with 11 years of dedicated practice, showcasing a pro...",
      "rating": 5,
      "experience": 11,
      "price": 350,
      "location": 2.5,
    },
  ];

  /// Controller
  final TextEditingController _searchServiceController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            /// Location
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  "Pune, India",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(194, 195, 204, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(17),
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
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Let's Find Specialist Doctor for Your Pet!",
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
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
                                image: AssetImage("assets/service/card.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// Searchbar
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TextFormField(
                        controller: _searchServiceController,
                        cursorHeight: 16,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(31, 32, 41, 1),
                        ),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(194, 195, 204, 1),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(255, 255, 255, 1),
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
                    const SizedBox(
                      height: 18,
                    ),
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
                    const SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      height: 88,
                      child: ListView.builder(
                        itemCount: serviceList.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          serviceList[index]["image"]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  serviceList[index]["servicename"],
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ).animate().scale(curve: Curves.elasticOut, duration: 800.ms, delay: (index * 100).ms);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Best Specialists Nearby",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 18,
                    // ),
                    ListView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable the internal scrolling of ListView
                      shrinkWrap: true,
                      itemCount: doctorList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Veterinary(
                                  doctorData: doctorList[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            margin: EdgeInsets.only(
                              bottom: index == doctorList.length - 1 ? 40 : 20,
                            ),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        doctorList[index]["photo"],
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 11),
                                        blurRadius: 25,
                                        spreadRadius: 0,
                                        color: Color.fromRGBO(22, 34, 51, 0.08),
                                      ),
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 8,
                                        spreadRadius: -4,
                                        color: Color.fromRGBO(22, 34, 51, 0.08),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 175,
                                      child: Text(
                                        doctorList[index]["name"],
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: 175,
                                      child: Text(
                                        doctorList[index]["specialist"],
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              194, 195, 204, 1),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_rate_outlined,
                                          size: 17,
                                          color: Theme.of(context).primaryColor,
                                        ).animate(delay: (index * 200).ms).scaleX(begin: 0, end: 1, duration: 600.ms, alignment: Alignment.centerLeft, curve: Curves.easeOut),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          "${doctorList[index]["rating"]}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                194, 195, 204, 1),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 17,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          "${doctorList[index]["location"]}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                194, 195, 204, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ).animate().slideY(begin: 0.5, end: 0, delay: (index * 200).ms, duration: 600.ms, curve: Curves.easeOut).fade(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
