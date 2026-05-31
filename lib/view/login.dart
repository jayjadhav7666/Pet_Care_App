import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_car_app/view/bottm_navigation.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hide = true;

  ///Controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              ),
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
              ),
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
              ),
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
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavigation(),
                    ),
                  );
                },
                child: Container(
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
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
              ),
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
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
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
              ),
              const SizedBox(
                height: 22,
              ),

              ///Login With Facebook
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
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
              ),
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
