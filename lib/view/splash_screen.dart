import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pet_car_app/view/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to login screen after 4 seconds to allow animations to finish
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const Login(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/logo.svg",
              height: 192.51,
              width: 182.41,
              fit: BoxFit.cover,
            ).animate()
              .scale(begin: const Offset(0.2, 0.2), end: const Offset(1, 1), duration: 1200.ms, curve: Curves.elasticOut)
              .slideY(begin: -0.2, end: 0, duration: 800.ms, curve: Curves.easeOut),
            const SizedBox(
              height: 20,
            ),
            Text(
              "PetGuardian",
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ).animate()
              .fade(duration: 800.ms, delay: 600.ms)
              .slideY(begin: 0.5, end: 0, duration: 800.ms, delay: 600.ms, curve: Curves.easeOutCubic),
            const SizedBox(
              height: 5,
            ),
            TypewriterText(
              text: "“Your Pets' Lifelong Protector”",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const TypewriterText({super.key, required this.text, required this.style});

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayedText = "";
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() async {
    await Future.delayed(const Duration(milliseconds: 1400));
    if (!mounted) return;
    
    for (int i = 0; i < widget.text.length; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (!mounted) return;
      setState(() {
        _currentIndex++;
        _displayedText = widget.text.substring(0, _currentIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: widget.style,
      textAlign: TextAlign.center,
    );
  }
}
