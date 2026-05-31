import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math' as math;

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final List<Map<String, dynamic>> shopList = [
    {
      "image": "assets/shop/pets.png",
      "name": "Pets",
    },
    {
      "image": "assets/shop/foods.png",
      "name": "Foods",
    },
    {
      "image": "assets/shop/heathy.png",
      "name": "Healthy",
    },
    {
      "image": "assets/shop/toys.png",
      "name": "Toys",
    },
    {
      "image": "assets/shop/accesories.png",
      "name": "Accessories",
    },
    {
      "image": "assets/shop/cloths.png",
      "name": "Cloths",
    },
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 148,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello Saurabh",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Find your lovable Pets",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/shop/shop.png",
                      height: 28,
                      width: 28,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 128,
              ),

              ///SearchBar
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: 40,
                    width: 282,
                    child: TextFormField(
                      controller: _searchController,
                      cursorHeight: 16,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(31, 32, 41, 1),
                      ),
                      decoration: InputDecoration(
                        hintText: "Search Something Here...",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(194, 195, 204, 1),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 255, 255, 1),
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
                  const Spacer(),
                ].animate(interval: 200.ms).slideY(begin: -0.5, end: 0, curve: Curves.easeOutBack).fade(),
              ),

              ///GridView
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 30),
                    child: GridView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                      shrinkWrap:
                          true, // Make GridView take only necessary space
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: shopList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 8),
                                      spreadRadius: -4,
                                      blurRadius: 16,
                                      color: Color.fromRGBO(22, 34, 51, 0.08),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image:
                                          AssetImage(shopList[index]["image"]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 29,
                                  width: 95,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(245, 245, 247, 1),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      bottomRight: Radius.circular(50),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      shopList[index]["name"],
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: const AddToCartButton(),
                            ),
                          ],
                        ).animate().scale(begin: const Offset(0.5, 0.5), end: const Offset(1, 1), delay: (index * 150).ms, duration: 600.ms, curve: Curves.easeOutBack);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({super.key});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool _isAdded = false;

  void _handleTap() async {
    if (_isAdded) return;
    setState(() => _isAdded = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isAdded = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final rotate = Tween(begin: math.pi, end: 0.0).animate(animation);
          return AnimatedBuilder(
            animation: rotate,
            child: child,
            builder: (context, child) {
              final isUnder = (ValueKey(_isAdded) != child!.key);
              var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
              tilt *= isUnder ? -1.0 : 1.0;
              final value = isUnder ? math.min(rotate.value, math.pi / 2) : rotate.value;
              return Transform(
                transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
                alignment: Alignment.center,
                child: child,
              );
            },
          );
        },
        child: _isAdded
            ? Container(
                key: const ValueKey(true),
                height: 36,
                width: 36,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 20),
              )
            : Container(
                key: const ValueKey(false),
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
                  ],
                ),
                child: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 18),
              ),
      ),
    );
  }
}
