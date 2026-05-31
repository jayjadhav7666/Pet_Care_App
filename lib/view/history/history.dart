import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:pet_car_app/global_state.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final DateFormat dateFormat = DateFormat('dd MMM yyyy');

  @override
  Widget build(BuildContext context) {
    // Reverse bookings so newest are at the top
    final bookings = GlobalState.bookings.reversed.toList();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Appointment History",
          style: GoogleFonts.poppins(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(31, 32, 41, 1),
          ),
        ),
      ),
      body: bookings.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history_toggle_off,
                    size: 80,
                    color: Colors.grey.shade400,
                  ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
                  const SizedBox(height: 20),
                  Text(
                    "No Appointments Yet",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ).animate().fade(delay: 200.ms),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 100),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: -5,
                        offset: Offset(0, 10),
                        color: Color.fromRGBO(22, 34, 51, 0.08),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(booking['photo']),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              booking['doctor'],
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              booking['specialist'],
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                                const SizedBox(width: 5),
                                Text(
                                  dateFormat.format(booking['date']),
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Icon(Icons.access_time, size: 14, color: Colors.grey),
                                const SizedBox(width: 5),
                                Text(
                                  booking['time'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).animate().slideY(begin: 0.5, end: 0, delay: (index * 100).ms, duration: 500.ms, curve: Curves.easeOutBack).fade();
              },
            ),
    );
  }
}
