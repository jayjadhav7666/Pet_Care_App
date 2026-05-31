import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pet_car_app/view/bottm_navigation.dart';

class Categories extends StatefulWidget {
  final List<Map<String, dynamic>> pet;

  const Categories({super.key, required this.pet});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),

            ///Backbutton & Title
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
                        Icons.arrow_back_ios_rounded,
                        size: 17,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  "Category",
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
              height: 15,
            ),

            ///GridView
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 3.8 / 4,
                ),
                // padding: const EdgeInsets.all(20),
                itemCount: widget.pet.length,
                itemBuilder: (BuildContext context, int index) {
                  // Calculate diagonal offset based on index (0 to 3)
                  Offset offset;
                  if (index == 0) {
                    offset = const Offset(-1, -1);
                  } else if (index == 1) {
                    offset = const Offset(1, -1);
                  } else if (index == 2) {
                    offset = const Offset(-1, 1);
                  } else {
                    offset = const Offset(1, 1);
                  }

                  return GestureDetector(
                    onTap: () {
                      if (widget.pet[index].containsKey("initialIndex")) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => BottomNavigation(
                              initialIndex: widget.pet[index]["initialIndex"],
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                widget.pet[index]["screen"],
                          ),
                        );
                      }
                    },
                    child: HoverCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            widget.pet[index]["image"],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ).animate(onPlay: (c) => c.repeat())
                           .rotate(duration: 3.seconds, begin: 0, end: 1),
                          const SizedBox(height: 15),
                          Text(
                            widget.pet[index]["name"],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(31, 32, 41, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animate().slide(begin: offset, end: Offset.zero, duration: 800.ms, curve: Curves.easeOutBack).fade();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final Widget child;
  const HoverCard({super.key, required this.child});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isHovered = true),
      onTapUp: (_) => setState(() => _isHovered = false),
      onTapCancel: () => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.diagonal3Values(
          _isHovered ? 1.05 : 1.0,
          _isHovered ? 1.05 : 1.0,
          1.0,
        ),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, _isHovered ? 16 : 8),
              spreadRadius: -4,
              blurRadius: _isHovered ? 24 : 16,
              color: Color.fromRGBO(22, 34, 51, _isHovered ? 0.15 : 0.08),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
