import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:confetti/confetti.dart';
import 'package:pet_car_app/global_state.dart';

class Veterinary extends StatefulWidget {
  final Map<String, dynamic> doctorData;

  const Veterinary({
    super.key,
    required this.doctorData,
  });

  @override
  State<Veterinary> createState() => _VeterinaryState();
}

class _VeterinaryState extends State<Veterinary> {
  final DateTime currentDate = DateTime.now();
  final DateFormat monthYearFormat = DateFormat('MMMM yyyy');
  final DateFormat dayFormat = DateFormat('EEE');
  final DateFormat dateFormat = DateFormat('d');
  final DateFormat timeFormat = DateFormat('HH:mm');
  DateTime? selectedDate;
  String? selectedTime;
  Map<DateTime, List<String>> availableTimes = {};
  List<String> allTimes = ["09:00", "15:00", "19:00"];
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _initializeAvailableTimes();
    _confettiController = ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _initializeAvailableTimes() {
    // Initialize available times for 8-10 days with fixed times
    for (int i = 0; i < 10; i++) {
      final date = currentDate.add(Duration(days: i));
      List<String> times = allTimes;

      // Randomly mark some times as full for demonstration
      if (i % 3 == 0) {
        times = [];
      } else if (i % 2 == 0) {
        times = times.sublist(0, 2); // Remove last time slot
      }

      // Mark Sunday as fully unavailable
      if (date.weekday == DateTime.sunday) {
        times = [];
      }

      availableTimes[date] = times;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 25),
            child: Column(
              children: [
                /// BackButton & Title
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
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 16,
                              spreadRadius: -4,
                              offset: Offset(0, 8),
                              color: Color.fromRGBO(22, 34, 51, 0.08),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            size: 17,
                            color: Theme.of(context)
                                .primaryColor, // Adjusted icon color
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Veterinary',
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                /// Doctor Photo
                Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(widget.doctorData['photo']),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: Offset(0, 10),
                        color: Color.fromRGBO(22, 34, 51, 0.04),
                      ),
                      BoxShadow(
                        blurRadius: 25,
                        spreadRadius: 0,
                        offset: Offset(0, 20),
                        color: Color.fromRGBO(22, 34, 51, 0.1),
                      ),
                    ],
                  ),
                ).animate().slideY(begin: -0.5, end: 0, duration: 800.ms, curve: Curves.easeOutBack).scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Doctor name
                    Text(
                      widget.doctorData["name"],
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),

                    ///Doctor specialist
                    Text(
                      widget.doctorData["specialist"],
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(194, 195, 204, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Doctor Experience
                        Container(
                          height: 62,
                          // width: 99,
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 25,
                                spreadRadius: 0,
                                offset: Offset(0, 11),
                                color: Color.fromRGBO(22, 34, 51, 0.08),
                              ),
                              BoxShadow(
                                blurRadius: 8,
                                spreadRadius: -4,
                                offset: Offset(0, 4),
                                color: Color.fromRGBO(22, 34, 51, 0.08),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Experience",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(31, 32, 41, 1),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${widget.doctorData["experience"]} years",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ).animate().slideX(begin: -1, end: 0, duration: 800.ms, delay: 100.ms, curve: Curves.elasticOut),

                        ///Doctor Price
                        Container(
                          height: 62,
                          width: 99,
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 25,
                                spreadRadius: 0,
                                offset: Offset(0, 11),
                                color: Color.fromRGBO(22, 34, 51, 0.08),
                              ),
                              BoxShadow(
                                blurRadius: 8,
                                spreadRadius: -4,
                                offset: Offset(0, 4),
                                color: Color.fromRGBO(22, 34, 51, 0.08),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Price",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(31, 32, 41, 1),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "\$ ${widget.doctorData["price"]}",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ).animate().slideX(begin: -1, end: 0, duration: 800.ms, delay: 200.ms, curve: Curves.elasticOut),

                        ///Doctor Location
                        Container(
                          height: 62,
                          width: 99,
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 25,
                                spreadRadius: 0,
                                offset: Offset(0, 11),
                                color: Color.fromRGBO(22, 34, 51, 0.08),
                              ),
                              BoxShadow(
                                blurRadius: 8,
                                spreadRadius: -4,
                                offset: Offset(0, 4),
                                color: Color.fromRGBO(22, 34, 51, 0.08),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Location",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(31, 32, 41, 1),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${widget.doctorData["location"]} Km",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ).animate().slideX(begin: -1, end: 0, duration: 800.ms, delay: 300.ms, curve: Curves.elasticOut),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "About",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        widget.doctorData["about"],
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(194, 195, 204, 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Available Days",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          monthYearFormat.format(currentDate),
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(194, 195, 204, 1),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10, // Only show 8-10 days
                        itemBuilder: (BuildContext context, int index) {
                          final day = currentDate.add(Duration(days: index));
                          final isSelected = selectedDate != null &&
                              selectedDate!.day == day.day &&
                              selectedDate!.month == day.month &&
                              selectedDate!.year == day.year;
                          final isFull = availableTimes[day]!.isEmpty;
                          return GestureDetector(
                            onTap: () {
                              if (day.weekday != DateTime.sunday) {
                                setState(() {
                                  selectedDate = day;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 16, right: 16, bottom: 8),
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isFull
                                    ? Theme.of(context).primaryColor
                                    : isSelected
                                        ? Theme.of(context).primaryColor
                                        : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                border: Border.all(
                                  width: 1,
                                  color: isSelected
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                                boxShadow: isSelected ? [
                                  BoxShadow(
                                    color: Colors.orange.withValues(alpha: 0.6),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ] : null,
                              ),
                              child: Center(
                                child: Text(
                                  "${dayFormat.format(day)}, ${dateFormat.format(day)}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected || isFull
                                        ? Colors.white
                                        : const Color.fromRGBO(49, 29, 14, 1),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Available Time",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedDate != null
                            ? availableTimes[selectedDate!]!.length
                            : 0,
                        itemBuilder: (BuildContext context, int index) {
                          final time = availableTimes[selectedDate!]![index];
                          final isSelected = selectedTime == time;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTime = time;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.only(
                                  top: 8, left: 16, right: 16, bottom: 8),
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                border: Border.all(
                                  width: 1,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  time,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected ? Colors.white : const Color.fromRGBO(49, 29, 14, 1),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ///Gesture Detector Button for See Location
                    Container(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(252, 219, 193, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.map_outlined,
                              size: 18,
                              color: Color.fromRGBO(163, 97, 46, 1),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "See Location",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(163, 97, 46, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    ///Gesture Detector Button for Book Now
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (selectedDate == null || selectedTime == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Please select a date and time.")),
                              );
                              return;
                            }
                            
                            // Save to global state
                            GlobalState.bookings.add({
                              'doctor': widget.doctorData['name'],
                              'specialist': widget.doctorData['specialist'],
                              'photo': widget.doctorData['photo'],
                              'date': selectedDate,
                              'time': selectedTime,
                            });
                            
                            _confettiController.play();
                            
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(Icons.check, color: Colors.white, size: 50),
                                        ).animate().scale(delay: 200.ms, curve: Curves.easeOutBack),
                                        const SizedBox(height: 20),
                                        Text(
                                          "Booking Confirmed!",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ).animate().fade(delay: 400.ms),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Your appointment with ${widget.doctorData['name']} is confirmed for ${dateFormat.format(selectedDate!)} ${monthYearFormat.format(selectedDate!)} at $selectedTime.",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ).animate().fade(delay: 500.ms),
                                        const SizedBox(height: 20),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Theme.of(context).primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context); // Go back to Service Screen
                                            },
                                            child: Text(
                                              "Done",
                                              style: GoogleFonts.poppins(color: Colors.white),
                                            ),
                                          ),
                                        ).animate().slideY(begin: 1, end: 0, delay: 600.ms),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Book Now",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ConfettiWidget(
                          confettiController: _confettiController,
                          blastDirectionality: BlastDirectionality.explosive,
                          shouldLoop: false,
                          colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
