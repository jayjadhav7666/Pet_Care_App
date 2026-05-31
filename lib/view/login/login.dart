import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pet_car_app/view/bottm_navigation.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hide = true;

  ///Controller
  final TextEditingController _emailController = TextEditingController(text: 'codewithjp.dev@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Login",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(
                "assets/logo2.svg",
                height: 194.22,
                width: 184,
                fit: BoxFit.cover,
              ).animate()
                .slideY(begin: -1.0, end: 0, duration: 1000.ms, curve: Curves.bounceOut),
              const SizedBox(
                height: 20,
              ),

              ///TextFormField for Email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(194, 195, 204, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: 39,
                    width: double.infinity,
                    child: TextFormField(
                      controller: _emailController,
                      cursorHeight: 16,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(31, 32, 41, 1),
                      ),
                      decoration: InputDecoration(
                        hintText: "PetGuardian@gmail.com",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(195, 195, 204, 1),
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
                      ),
                    ),
                  ),
                ],
              ).animate().fade(delay: 500.ms, duration: 600.ms),
              const SizedBox(
                height: 14,
              ),

              ///TextFormField for Password
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(194, 195, 204, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: 39,
                    width: double.infinity,
                    child: TextFormField(
                      controller: _passwordController,
                      cursorHeight: 16,
                      obscureText: hide,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(31, 32, 41, 1),
                      ),
                      decoration: InputDecoration(
                        hintText: "...........",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(195, 195, 204, 1),
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
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hide = !hide;
                            });
                          },
                          icon: Icon(
                            hide
                                ? Icons.visibility_off
                                : Icons.remove_red_eye_outlined,
                            size: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).animate().fade(delay: 700.ms, duration: 600.ms),
              const SizedBox(
                height: 10,
              ),

              ///Forgot Password
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot Password ? Click Here",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(31, 32, 41, 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),

              ///Login Button
              BounceButton(
                color: Theme.of(context).primaryColor,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavigation(),
                    ),
                  );
                },
                child: SizedBox(
                  height: 37,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
              ).animate().slideY(begin: 1.0, end: 0, delay: 900.ms, duration: 600.ms, curve: Curves.easeOut),
              const SizedBox(
                height: 22,
              ),
              Container(
                height: 1.9,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(
                height: 22,
              ),

              ///Login With Email
              BounceButton(
                color: Theme.of(context).primaryColor,
                onTap: () {},
                child: SizedBox(
                  height: 37,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "LOGIN WITH EMAIL",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
              ).animate().slideY(begin: 1.0, end: 0, delay: 1000.ms, duration: 600.ms, curve: Curves.easeOut),
              const SizedBox(
                height: 22,
              ),

              ///Login With Facebook
              BounceButton(
                color: Theme.of(context).primaryColor,
                onTap: () {},
                child: SizedBox(
                  height: 37,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "LOGIN WITH FACEBOOK",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
              ).animate().slideY(begin: 1.0, end: 0, delay: 1100.ms, duration: 600.ms, curve: Curves.easeOut),
              const SizedBox(
                height: 25,
              ),
              Text(
                "By continue you agree to our ",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(31, 32, 41, 1),
                ),
              ),
              Text(
                "Terms & Privacy Policy",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(31, 32, 41, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BounceButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color color;
  const BounceButton({super.key, required this.onTap, required this.child, required this.color});

  @override
  State<BounceButton> createState() => _BounceButtonState();
}

class _BounceButtonState extends State<BounceButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(8),
        onHighlightChanged: (isHighlighted) {
          setState(() {
            _isPressed = isHighlighted;
          });
        },
        child: widget.child,
      ),
    ).animate(target: _isPressed ? 1 : 0)
      .scale(end: const Offset(0.95, 0.95), duration: 100.ms);
  }
}
