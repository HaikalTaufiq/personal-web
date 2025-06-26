import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:personal_web/sections/widgets/tech_stack.dart';

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({super.key});

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection>
    with SingleTickerProviderStateMixin {
  final CardSwiperController controller = CardSwiperController();

  final List<String> imagePaths = [
    'assets/images/sertif-2.webp',
    'assets/images/sertif-RV.webp',
    'assets/images/sertif-IT.webp',
    'assets/images/MTKH.webp',
    'assets/images/sertif-ML.webp',
    'assets/images/sertif-KR.webp',
  ];

  final List<String> certificateTitles = [
    '2nd Place Winner of PBL EXPO Polibatam – 2024',
    'RevoU Software Engineering Online Course – 2023',
    'Coursera Tech Support Online Course – 2023',
    'Participant of PBL EXPO Polibatam – 2024',
    'MindLuster Online Course – 2023',
    'National Seminar INSYFEST – 2024',
  ];

  final List<String> details = [
    'Participated in the 2024 PBL Expo under the Web & Mobile Application category by developing an IoT-based mobile application designed for automatic fish feeding. This project was awarded 2nd place for its innovation.',
    'Participated in a two-week intensive program by RevoU focusing on software engineering fundamentals. Built a simple BMI calculator deployed via GitHub Pages.',
    'Completed Google-authorized Coursera course on Tech Support Fundamentals covering hardware, OS, troubleshooting, and networking basics.',
    'Exhibited an IoT-integrated mobile app for automatic fish feeding at the 2024 PBL Expo at Politeknik Negeri Batam.',
    'Completed MindLuster Responsive Design course, learning media queries, Flexbox/Grid, and UX best practices for web.',
    'Attended national seminar INSYFEST about competitive global web development and modern web practices.',
  ];

  List<Widget> get cards => imagePaths.map((path) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Image.asset(path),
        );
      }).toList();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'My name is M Taufiq Karim Haikal, a Multimedia Engineering student at Polibatam with a focus on Web, Mobile, IoT, and Game Development.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
                fontFamily: 'Poppins',
                height: 1.5,
              ),
            ),
            SizedBox(height: 20),
            TechStack(),
          ],
        ),
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 180),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                            text: 'About ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'Me',
                            style: TextStyle(color: Color(0xff00E5FF)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 600,
                      child: Text(
                        'My name is M Taufiq Karim Haikal. I am an undergraduate student majoring in Multimedia Engineering Technology at Politeknik Negeri Batam. Experienced in web development, mobile apps, IoT product development, and 3D games.',
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.4,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins',
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Tech Stack:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Poppins',
                        color: Color(0xff00E5FF),
                      ),
                    ),
                    SizedBox(height: 20),
                    TechStack(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, top: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () =>
                                controller.swipe(CardSwiperDirection.bottom),
                            icon:
                                Icon(Icons.arrow_back_ios, color: Colors.white),
                          ),
                          SizedBox(
                            width: 400,
                            height: 400,
                            child: CardSwiper(
                              controller: controller,
                              cardsCount: cards.length,
                              onSwipe: _onSwipe,
                              onUndo: _onUndo,
                              cardBuilder: (context, index, _, __) {
                                return GestureDetector(
                                  onTap: () => _showCertificateDialog(index),
                                  child: cards[index],
                                );
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () =>
                                controller.swipe(CardSwiperDirection.right),
                            icon: Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCertificateDialog(int index) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            constraints: BoxConstraints(maxWidth: 1500, maxHeight: 1400),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black87.withOpacity(0.85),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.contain,
                      width: 800,
                      height: 700,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 80),
                        Text(
                          certificateTitles[index],
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          details[index],
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white70,
                            fontSize: 16,
                            height: 1.5,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _onSwipe(
      int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    debugPrint(
        'Swiped from $previousIndex to $currentIndex via ${direction.name}');
    return true;
  }

  bool _onUndo(
      int? previousIndex, int currentIndex, CardSwiperDirection direction) {
    debugPrint('Undo swipe to $currentIndex from ${direction.name}');
    return true;
  }
}
