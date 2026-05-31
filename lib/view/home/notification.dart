import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final List<Map<String, dynamic>> notifications = [
    {
      'date': 'Today',
      'items': [
        {
          'icon': Icons.shopping_bag_outlined,
          'text': 'Your checkout is successfull, product is on tne way'
        },
        {'icon': Icons.check, 'text': 'Appointment request accepted'},
      ],
    },
    {
      'date': '25 September',
      'items': [
        {
          'icon': Icons.shopping_bag_outlined,
          'text': 'Your checkout is successfull, product is on tne way'
        },
        {'icon': Icons.check, 'text': 'Appointment request accepted'},
        {
          'icon': Icons.favorite_border_outlined,
          'text': 'Vaccinate your pet timely'
        },
      ],
    },
    {
      'date': '15 September',
      'items': [
        {
          'icon': Icons.shopping_bag_outlined,
          'text': 'Your checkout is successfull, product is on tne way'
        },
        {'icon': Icons.check, 'text': 'Appointment request accepted'},
        {
          'icon': Icons.favorite_border_outlined,
          'text': 'Vaccinate your pet timely'
        },
      ],
    },
    {
      'date': '21 October',
      'items': [
        {
          'icon': Icons.shopping_bag_outlined,
          'text': 'Your checkout is successfull, product is on tne way'
        },
        {'icon': Icons.check, 'text': 'Appointment request accepted'},
        {
          'icon': Icons.favorite_border_outlined,
          'text': 'Vaccinate your pet timely'
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  "Notifications",
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(31, 32, 41, 1),
                  ),
                ),
                const Spacer(),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notifications[index]['date'],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(31, 32, 41, 1),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 16,
                                  spreadRadius: -4,
                                  offset: Offset(0, 8),
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                ),
                              ],
                            ),
                            child: SizedBox(
                              child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: notifications[index]['items'].length,
                                itemBuilder:
                                    (BuildContext context, int index1) {
                                  return Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  252, 219, 193, 1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                notifications[index]['items']
                                                    [index1]['icon'],
                                                color:
                                                    Theme.of(context).primaryColor,
                                              ),
                                            ),
                                          ),
                                          if (index == 0 && index1 == 0)
                                            Positioned(
                                              top: -2,
                                              right: -2,
                                              child: Container(
                                                width: 12,
                                                height: 12,
                                                decoration: const BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle,
                                                ),
                                              ).animate(onPlay: (c) => c.repeat(reverse: true))
                                               .scale(begin: const Offset(1, 1), end: const Offset(1.3, 1.3), duration: 600.ms),
                                            ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 245,
                                        child: Text(
                                          notifications[index]['items'][index1]
                                              ['text'],
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                31, 32, 41, 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).animate().slideX(begin: 1, end: 0, delay: ((index * 200) + (index1 * 100)).ms, duration: 600.ms, curve: Curves.easeOutBack).fade();
                                },
                                separatorBuilder:
                                    (BuildContext context, int index2) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index3) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
