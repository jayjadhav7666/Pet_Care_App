import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_car_app/view/bottm_navigation.dart';
import 'package:pet_car_app/view/category/grooming.dart';
import 'package:pet_car_app/view/category/training.dart';
import 'package:pet_car_app/view/home/notification.dart';
import 'package:pet_car_app/view/home/see_category.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> category = [
    {
      "image": "assets/dashboard/category/veterinary.png",
      "name": "Veterinary",
      "initialIndex": 1,
    },
    {
      "image": "assets/dashboard/category/grooming.png",
      "name": "Grooming",
      "screen": const Grooming(),
    },
    {
      "image": "assets/dashboard/category/petstore.png",
      "name": "Pet Store",
      "initialIndex": 2,
    },
    {
      "image": "assets/dashboard/category/training.png",
      "name": "Training",
      "screen": const Training(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            //Profile Photo
            Row(
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/dashboard/jay.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hello, Saurabh",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "👋",
                          style: TextStyle(fontSize: 14),
                        ).animate(onPlay: (c) => c.repeat(reverse: true))
                         .moveY(begin: 0, end: -3, duration: 500.ms)
                         .rotate(begin: -0.1, end: 0.1, duration: 500.ms),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Good Morning!",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(0, 0, 0, 0.2),
                      ),
                    ),
                  ],
                ).animate().slideX(begin: -1.0, end: 0, duration: 600.ms, curve: Curves.easeOutCubic).fade(),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Notifications(),
                      ),
                    );
                  },
                  icon: Image.asset(
                    "assets/icons/bell.png",
                    height: 24,
                    width: 24,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //SearchBar
            SizedBox(
              height: 40,
              width: 327,
              child: TextFormField(
                controller: _searchController,
                cursorHeight: 16,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(31, 32, 41, 1),
                ),
                decoration: InputDecoration(
                  hintText: "search",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
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
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ///PetLove
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "In Love With Pets?",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Get all what you need for them",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 87,
                            width: 91,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/dashboard/petlove.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate().slideY(begin: -0.5, end: 0, duration: 800.ms, curve: Curves.easeOutBack).fade(),
                    const SizedBox(
                      height: 20,
                    ),

                    ///Category
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Category",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Categories(pet: category),
                              ),
                            );
                          },
                          child: Text(
                            "See All",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(194, 195, 204, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 105,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: category.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (category[index]
                                      .containsKey("initialIndex")) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            BottomNavigation(
                                          initialIndex: category[index]
                                              ["initialIndex"],
                                        ),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            category[index]["screen"],
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 13),
                                  height: 70,
                                  width: 70,
                                  child: Center(
                                    child: Image.asset(
                                      category[index]["image"],
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                category[index]["name"]!,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ],
                          ).animate().slideY(begin: 0.5, end: 0, delay: (index * 100).ms, duration: 400.ms).fade();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ///Event
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Event",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 110,
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 8),
                            spreadRadius: -4,
                            blurRadius: 16,
                            color: Color.fromRGBO(22, 34, 51, 0.08),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 180,
                                  child: Text(
                                    "Find and Join in Special Events For Your Pets!",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Container(
                                height: 34,
                                width: 89,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "See More",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 95,
                            width: 101,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/dashboard/event1.jpg"),
                                fit: BoxFit.fill,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 11),
                                  spreadRadius: 0,
                                  blurRadius: 25,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  spreadRadius: -4,
                                  blurRadius: 8,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ).animate().scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1), duration: 600.ms).fade(),
                    const SizedBox(
                      height: 15,
                    ),

                    ///Community
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Community",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 110,
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 8),
                            spreadRadius: -4,
                            blurRadius: 16,
                            color: Color.fromRGBO(22, 34, 51, 0.08),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 180,
                                  child: Text(
                                    "Connect and share with communities! ",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Container(
                                height: 34,
                                width: 89,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "See More",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 95,
                            width: 101,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/dashboard/community.jpg"),
                                fit: BoxFit.fill,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 11),
                                  spreadRadius: 0,
                                  blurRadius: 25,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  spreadRadius: -4,
                                  blurRadius: 8,
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ).animate().scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1), duration: 600.ms, delay: 200.ms).fade(),
                    const SizedBox(height: 30),
                    Center(
                      child: Column(
                        children: [
                          Icon(Icons.pets, color: Theme.of(context).primaryColor.withOpacity(0.5), size: 40)
                              .animate(onPlay: (controller) => controller.repeat(reverse: true))
                              .scale(begin: const Offset(1, 1), end: const Offset(1.2, 1.2), duration: 800.ms),
                          const SizedBox(height: 10),
                          Text(
                            "You're all caught up! 🎉",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade500,
                            ),
                          ).animate().fade(delay: 500.ms),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
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
