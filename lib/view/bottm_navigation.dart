import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_car_app/view/home/dashboard.dart';
import 'package:pet_car_app/view/history/history.dart';
import 'package:pet_car_app/view/profile/profle.dart';
import 'package:pet_car_app/view/service/service.dart';
import 'package:pet_car_app/view/category/shop.dart';

class BottomNavigation extends StatefulWidget {
  final int initialIndex;

  const BottomNavigation({super.key, this.initialIndex = 0});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  List<Widget> screens = [
    const DashBoard(),
    const Service(),
    const Shop(),
    const History(),
    const Profile(),
  ];

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screens[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 73,
        child: BottomNavigationBar(
          iconSize: 24,
          selectedItemColor: Theme.of(context).primaryColor,
          selectedLabelStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(126, 128, 143, 1),
          ),
          unselectedItemColor: const Color.fromRGBO(126, 128, 143, 1),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(126, 128, 143, 1),
          ),
          type: BottomNavigationBarType.fixed,
          onTap: _onTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline_outlined),
              label: "Service",
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: "Profile",
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 69,
        width: 69,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(25, 25, 25, 0.05),
              spreadRadius: 0,
              blurRadius: 31,
              offset: Offset(0, 16), // changes position of shadow
            ),
            BoxShadow(
              color: Color.fromRGBO(22, 34, 51, 0.03),
              spreadRadius: 0,
              blurRadius: 15,
              offset: Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            _onTapped(2);
          },
          elevation: 2,
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                size: 24,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "Shop",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
