import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<Map<String, dynamic>> _options = [
    {'icon': Icons.person_outline, 'title': 'Edit Profile'},
    {'icon': Icons.pets_outlined, 'title': 'My Pets'},
    {'icon': Icons.payment_outlined, 'title': 'Payment Methods'},
    {'icon': Icons.settings_outlined, 'title': 'Settings'},
    {'icon': Icons.help_outline, 'title': 'Help & Support'},
    {'icon': Icons.logout, 'title': 'Log Out', 'color': Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            "assets/dashboard/jay.jpg",
            height: 400,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          // Dark Overlay
          Container(
            height: 350,
            width: double.infinity,
            color: const Color.fromRGBO(34, 40, 52, 0.6),
          ),
          
          // Content
          Column(
            children: [
              const SizedBox(height: 170),
              // Profile Info
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      image: const DecorationImage(
                        image: AssetImage("assets/dashboard/jay.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ).animate().scale(duration: 500.ms, curve: Curves.easeOutBack),
                  const SizedBox(height: 15),
                  Text(
                    "Saurabh",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ).animate().fade(delay: 200.ms),
                  Text(
                    "codewithjp.dev@gmail.com",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                  ).animate().fade(delay: 300.ms),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // Bottom White Container
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 100), // padding for bottom nav
                    itemCount: _options.length,
                    separatorBuilder: (context, index) => Divider(color: Colors.grey.shade200, height: 1),
                    itemBuilder: (context, index) {
                      final option = _options[index];
                      final isLogout = option['title'] == 'Log Out';
                      final color = option['color'] ?? const Color.fromRGBO(31, 32, 41, 1);
                      
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isLogout ? Colors.red.shade50 : const Color.fromRGBO(252, 219, 193, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            option['icon'],
                            color: isLogout ? Colors.red : Theme.of(context).primaryColor,
                            size: 22,
                          ),
                        ),
                        title: Text(
                          option['title'],
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: color,
                          ),
                        ),
                        trailing: isLogout
                            ? null
                            : const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                        onTap: () {},
                      ).animate().slideX(begin: 0.5, end: 0, delay: (400 + (index * 100)).ms, duration: 400.ms, curve: Curves.easeOutQuad).fade();
                    },
                  ),
                ).animate().slideY(begin: 1, end: 0, duration: 600.ms, curve: Curves.easeOutCirc),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
