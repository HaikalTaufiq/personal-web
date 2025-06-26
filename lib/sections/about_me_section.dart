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
  final List<Container> cards = [
    Container(
      alignment: Alignment.center,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Image(
        image: AssetImage('assets/images/sertif-2.webp'),
      ),
    ),
    Container(
      alignment: Alignment.center,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Image(
        image: AssetImage('assets/images/sertif-RV.webp'),
      ),
    ),
    Container(
      alignment: Alignment.center,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Image(
        image: AssetImage('assets/images/sertif-IT.webp'),
      ),
    ),
    Container(
      alignment: Alignment.center,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Image(
        image: AssetImage('assets/images/MTKH.webp'),
      ),
    ),
    Container(
      alignment: Alignment.center,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Image(
        image: AssetImage('assets/images/sertif-ML.webp'),
      ),
    ),
    Container(
      alignment: Alignment.center,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Image(
        image: AssetImage('assets/images/sertif-KR.webp'),
      ),
    ),
  ];

  List<String> imagePaths = [
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
    'Participated in the 2024 PBL Expo under the Web & Mobile Application category by developing an IoT-based mobile application designed for automatic fish feeding. The app enables users to remotely control and monitor feeding schedules through a smart device. This project was awarded 2nd place in the competition for its innovation and practical application in the aquaculture field.',
    'Participated in a two-week intensive learning program organized by RevoU, focusing on the fundamentals of Software Engineering. The course covered an introduction to front-end and back-end development, using HTML, CSS, and JavaScript to build basic web applications, including a simple BMI calculator project deployed for free via GitHub Pages.',
    'Completed an online course on Tech Support Fundamentals authorized by Google and offered through Coursera. This course covered the basics of technical support, including computer hardware and software, operating systems, basic troubleshooting, networking services, and best practices for delivering effective IT support to end-users.',
    'Participated as an exhibitor in the PBL Expo at Politeknik Negeri Batam under the Web & Mobile Application category. I developed and presented a mobile application product integrated with Internet of Things (IoT) technology that functions as an automatic fish feeder system.',
    'Completed an online class on the MindLuster platform with the topic of Responsive Design. In this course, I learned the fundamental principles of responsive web design, including how to create adaptive user interfaces across various screen sizes, the use of media queries, modern layout techniques such as Flexbox and Grid, and best practices for enhancing user experience (UX) across multiple devices.',
    'Participated in the national seminar INSYFEST, organized by the Information Systems Student Association, focusing on globally competitive web development. The seminar explored how web developers can make meaningful contributions in both corporate and educational environments by applying cutting-edge technologies, adhering to industry standards, and understanding global user needs.',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 36,
                  height: 1.4,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Poppins',
                ),
                children: [
                  TextSpan(
                      text: 'About ', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: 'Me', style: TextStyle(color: Color(0xff00E5FF))),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'My name is M Taufiq Karim Haikal. I am an undergraduate student majoring in Multimedia Engineering Technology at Politeknik Negeri Batam, experienced in web development, mobile apps, IoT product development, including designing and programming smart devices for various applications, and 3D game creation. I combine technical skills in front-end and back-end development with a creative approach to multimedia solutions, driven by continuous learning and innovation.',
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                fontWeight: FontWeight.w100,
                fontFamily: 'Poppins',
                color: Color.fromARGB(217, 255, 255, 255),
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            Text(
              'Tech Stack:',
              style: TextStyle(
                fontSize: 18,
                height: 1.4,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Color(0xff00E5FF),
              ),
            ),
            TechStack(),
            SizedBox(
              height: 245,
              child: CardSwiper(
                controller: controller,
                cardsCount: cards.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                cardBuilder:
                    (context, index, percentThresholdX, percentThresholdY) =>
                        GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.black87,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(imagePaths[index]),
                            const SizedBox(height: 10),
                            Text(
                              certificateTitles[index],
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              details[index],
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    );
                  },
                  child: cards[index],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
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
                            'My name is M Taufiq Karim Haikal. I am an undergraduate student majoring in Multimedia Engineering Technology at Politeknik Negeri Batam, experienced in web development, mobile apps, IoT product development, including designing and programming smart devices for various applications, and 3D game creation. I combine technical skills in front-end and back-end development with a creative approach to multimedia solutions, driven by continuous learning and innovation.',
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.4,
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Poppins',
                              color: const Color.fromARGB(
                                  188, 255, 255, 255), // Ubah ke warna putih
                            ),
                            textAlign: TextAlign.justify,
                          )),
                      SizedBox(height: 30),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 24,
                            letterSpacing: -1.5,
                            height: 1.4,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: 'Tech  ',
                              style: TextStyle(color: Color(0xff00E5FF)),
                            ),
                            TextSpan(
                              text: 'Stack :',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 400,
                              height: 400,
                              child: CardSwiper(
                                controller: controller,
                                cardsCount: cards.length,
                                onSwipe: _onSwipe,
                                onUndo: _onUndo,
                                cardBuilder: (context, index, percentThresholdX,
                                        percentThresholdY) =>
                                    GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      // ignore: deprecated_member_use
                                      barrierColor: Colors.black.withOpacity(
                                          0.5), // semi transparant background
                                      builder: (context) => BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5, sigmaY: 5),
                                        child: Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 1500,
                                              maxHeight: 1400,
                                            ),
                                            padding: const EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              color: Colors.black87
                                                  // ignore: deprecated_member_use
                                                  .withOpacity(0.85),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: SingleChildScrollView(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
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
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 80,
                                                        ),
                                                        Text(
                                                          certificateTitles[
                                                              index],
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Poppins",
                                                            color: Colors.white,
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        Text(
                                                          details[index],
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Poppins",
                                                              color: const Color
                                                                  .fromARGB(
                                                                  179,
                                                                  255,
                                                                  255,
                                                                  255),
                                                              fontSize: 16,
                                                              height: 1.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                        const SizedBox(
                                                            height: 30),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child: const Text(
                                                              'Close',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: cards[index],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  controller.swipe(CardSwiperDirection.right),
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
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
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
