import 'dart:ui';
import 'dart:math' as math;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_web/sections/about_me_section.dart';
import 'package:personal_web/sections/contact_section.dart';
import 'package:personal_web/sections/my_project_section.dart';
import 'package:personal_web/pages/widgets/nav_button.dart';
import 'package:zo_animated_border/zo_animated_border.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = 0;
  late AnimationController _controller;
  late Animation<Offset> _animation;
  final GlobalKey contactKey = GlobalKey();

  bool _isHovering = false;
  final List<String> roles = [
    'Software Engineer',
    'Multimedia Engineer',
    'Mobile Developer',
    'Website Developer',
  ];

  final List<Color> colors = [
    Colors.white,
    Color(0xff00E5FF), // biru neon
  ];

  void _scrollToSection(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 3) {
      _scrollToSpecificPosition(2875);
    } else {
      final double appBarHeight = 0;
      final double position =
          (index * MediaQuery.of(context).size.height) - appBarHeight;

      _scrollController.animateTo(
        position < 0 ? 0 : position,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToSpecificPosition(double position) {
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: const Offset(-290, -330),
      end: const Offset(-20, -600),
    ).chain(CurveTween(curve: Curves.easeInOutBack)).animate(_controller);
  }

  void _onScroll() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final position = _scrollController.offset;
    if (isMobile) {
      if (position < 400) {
        _updateSelectedIndex(0); // Home
      } else if (position < 800) {
        _updateSelectedIndex(1); // About
      } else if (position < 2875) {
        _updateSelectedIndex(2); // My Project
      } else {
        _updateSelectedIndex(3); // Contact
      }
    } else {
      // Desktop
      if (position < 700) {
        _updateSelectedIndex(0); // Home
      } else if (position < 800) {
        _updateSelectedIndex(1); // About
      } else if (position < 2000) {
        _updateSelectedIndex(2); // My Project
      } else {
        _updateSelectedIndex(3); // Contact
      }
    }
  }

  void _updateSelectedIndex(int index) {
    if (selectedIndex != index) {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Background
            Positioned.fill(
              child: Stack(
                children: [
                  Positioned(
                    top: 100,
                    right: -500,
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: _animation.value,
                          child: Image.asset(
                            'assets/images/Ellipse.png',
                            width: 1100,
                            height: 1100,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // ====== Konten scrollable (konten berubah, bg tetap) ======
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 150),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isMobile
                            ? 20
                            : isTablet
                                ? 60
                                : 130),
                    child: Stack(
                      children: [
                        isMobile
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hello, I'm",
                                        style: TextStyle(
                                          fontSize: 25,
                                          height: 1.2,
                                          letterSpacing: -1.5,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontSize: 30,
                                            height: 1.4,
                                            letterSpacing: -1.5,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'Poppins',
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Haikal ',
                                              style: TextStyle(
                                                color: Color(0xff00E5FF),
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Taufiq',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          AnimatedTextKit(
                                            repeatForever: true,
                                            pause: const Duration(
                                                milliseconds: 1200),
                                            animatedTexts: List.generate(
                                                roles.length, (index) {
                                              return TypewriterAnimatedText(
                                                  roles[index],
                                                  textStyle: TextStyle(
                                                    fontSize: 30,
                                                    height: 1.2,
                                                    letterSpacing: -2.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Poppins',
                                                    color: colors[
                                                        index % colors.length],
                                                  ),
                                                  speed: const Duration(
                                                      milliseconds: 150),
                                                  cursor: "|",
                                                  curve: Curves.bounceInOut);
                                            }),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontSize: 12,
                                            height: 1.5,
                                            letterSpacing: -0.5,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                          children: [
                                            TextSpan(text: ' I am a '),
                                            TextSpan(
                                              text: 'Multimedia',
                                              style: TextStyle(
                                                  color: Color(0xff00E5FF)),
                                            ),
                                            TextSpan(
                                                text:
                                                    ' Engineering Technology student at\n '),
                                            TextSpan(
                                                text: 'Politeknik Negeri '),
                                            TextSpan(
                                              text: 'Batam',
                                              style: TextStyle(
                                                  color: Color(0xff00E5FF)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 25,
                                        ),
                                        child: MouseRegion(
                                          onEnter: (_) => setState(
                                              () => _isHovering = true),
                                          onExit: (_) => setState(
                                              () => _isHovering = false),
                                          child: GestureDetector(
                                            onTap: () => _scrollToSection(1),
                                            child: ZoAnimatedGradientBorder(
                                              borderRadius: 20,
                                              borderThickness: 1,
                                              gradientColor: [
                                                Color(0xff01323B),
                                                Color(0xff00E5FF),
                                                Color.fromARGB(
                                                    255, 124, 241, 254),
                                              ],
                                              duration: Duration(seconds: 20),
                                              child: AnimatedContainer(
                                                width: 100,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: _isHovering
                                                        ? const Color(
                                                            0xFF00E5FF)
                                                        : const Color.fromARGB(
                                                            190, 0, 229, 255),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                40))),
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                child: Center(
                                                  child: Text(
                                                    "Let's Start ->",
                                                    style: TextStyle(
                                                      shadows: [
                                                        Shadow(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 1, 202, 237),
                                                          offset: Offset(0, 0),
                                                          blurRadius: 3,
                                                        ),
                                                      ],
                                                      color: Colors.white,
                                                      fontFamily: "Poppins",
                                                      fontSize: 12,
                                                      letterSpacing: -1.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: ZoAnimatedGradientBorder(
                                      borderRadius: 20,
                                      borderThickness: 1,
                                      gradientColor: [
                                        Color(0xff00E5FF),
                                      ],
                                      duration: Duration(seconds: 20),
                                      child: Container(
                                        width: 10,
                                        height: 400,
                                        decoration: BoxDecoration(
                                          color: Color(0xff00E5FF),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hello, I'm",
                                          style: TextStyle(
                                            fontSize: 40,
                                            height: 1.2,
                                            letterSpacing: -1.5,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontSize: 60,
                                              height: 1.4,
                                              letterSpacing: -3.5,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: 'Poppins',
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'Haikal ',
                                                style: TextStyle(
                                                  color: Color(0xff00E5FF),
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Taufiq',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            AnimatedTextKit(
                                              repeatForever: true,
                                              pause: const Duration(
                                                  milliseconds: 1200),
                                              animatedTexts: List.generate(
                                                  roles.length, (index) {
                                                return TypewriterAnimatedText(
                                                    roles[index],
                                                    textStyle: TextStyle(
                                                      fontSize: 60,
                                                      height: 1.2,
                                                      letterSpacing: -3.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Poppins',
                                                      color: colors[index %
                                                          colors.length],
                                                    ),
                                                    speed: const Duration(
                                                        milliseconds: 150),
                                                    cursor: "|",
                                                    curve: Curves.bounceInOut);
                                              }),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontSize: 20,
                                              height: 1.5,
                                              letterSpacing: -0.5,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                            children: [
                                              TextSpan(text: ' I am a '),
                                              TextSpan(
                                                text: 'Multimedia',
                                                style: TextStyle(
                                                    color: Color(0xff00E5FF)),
                                              ),
                                              TextSpan(
                                                  text:
                                                      ' Engineering Technology student at\n '),
                                              TextSpan(
                                                  text: 'Politeknik Negeri '),
                                              TextSpan(
                                                text: 'Batam',
                                                style: TextStyle(
                                                    color: Color(0xff00E5FF)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 25,
                                          ),
                                          child: MouseRegion(
                                            onEnter: (_) => setState(
                                                () => _isHovering = true),
                                            onExit: (_) => setState(
                                                () => _isHovering = false),
                                            child: GestureDetector(
                                              onTap: () => _scrollToSection(1),
                                              child: ZoAnimatedGradientBorder(
                                                borderRadius: 20,
                                                borderThickness: 1,
                                                gradientColor: [
                                                  Color(0xff01323B),
                                                  Color(0xff00E5FF),
                                                  Color.fromARGB(
                                                      255, 124, 241, 254),
                                                ],
                                                duration: Duration(seconds: 20),
                                                child: AnimatedContainer(
                                                  width: 180,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: _isHovering
                                                          ? const Color(
                                                              0xFF00E5FF)
                                                          : const Color
                                                              .fromARGB(
                                                              190, 0, 229, 255),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  40))),
                                                  duration: const Duration(
                                                      milliseconds: 200),
                                                  child: Center(
                                                    child: Text(
                                                      "Let's Start ->",
                                                      style: TextStyle(
                                                        shadows: [
                                                          Shadow(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                1, 202, 237),
                                                            offset:
                                                                Offset(0, 0),
                                                            blurRadius: 3,
                                                          ),
                                                        ],
                                                        color: Colors.white,
                                                        fontFamily: "Poppins",
                                                        fontSize: 18,
                                                        letterSpacing: -1.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                        SizedBox(
                          width: 200,
                        ),
                        if (isMobile)
                          SizedBox()
                        else
                          Positioned(
                            right: 10,
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: Lottie.asset(
                                'assets/json/pp.json',
                                width: 400,
                                height: 400,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (isMobile)
                    Positioned(
                      right: 10,
                      child: Lottie.asset(
                        'assets/json/HAI.json',
                        width: 400,
                        height: 400,
                        fit: BoxFit.contain,
                      ),
                    ),
                  isMobile
                      ? const SizedBox(
                          height: 60,
                        )
                      : const SizedBox(height: 150),
                  const AboutMeSection(),
                  const SizedBox(height: 100),
                  const MyProjectSection(),
                  const ContactSection(),
                ],
              ),
            ),

            // ====== AppBar transparan dengan blur ======
            if (isMobile)
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 0),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => _scrollToSection(0),
                            child: Row(
                              children: const [
                                Text(
                                  'Haikal',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    letterSpacing: -0.5,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff00E5FF),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Taufiq',
                                    style: TextStyle(
                                      letterSpacing: -0.5,
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Hamburger Menu
                          PopupMenuButton<int>(
                            icon: Icon(Icons.menu, color: Colors.white),
                            color: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            onSelected: (value) {
                              _scrollToSection(value);
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Text('About Me',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Text('My Project',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              PopupMenuItem(
                                value: 3,
                                child: Text('Contact',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => _scrollToSection(0),
                            child: Row(
                              children: const [
                                Text(
                                  'Haikal',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 24,
                                    letterSpacing: -0.5,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff00E5FF),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Taufiq',
                                    style: TextStyle(
                                      letterSpacing: -0.5,
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              _buildNavButton('About Me', 1),
                              const SizedBox(width: 30),
                              _buildNavButton('My Project', 2),
                              const SizedBox(width: 30),
                              _buildNavButton('Contact', 3),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String label, int index) {
    return NavButton(
      label: label,
      index: index,
      isSelected: selectedIndex == index,
      onTap: () => _scrollToSection(index),
    );
  }
}
