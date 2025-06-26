import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final List<Map<String, dynamic>> contactItems = const [
    {
      'icon': 'assets/tech-stack/gmail.svg',
      'text': 'haikaltaufiq4@gmail.com',
      'url': 'mailto:haikaltaufiq4@gmail.com',
    },
    {
      'icon': 'assets/tech-stack/github.svg',
      'text': 'HaikalTaufiq',
      'url': 'https://github.com/HaikalTaufiq',
    },
    {
      'icon': 'assets/tech-stack/linkedin.svg',
      'text': 'M Taufiq Karim Haikal',
      'url': 'https://www.linkedin.com/in/m-taufiq-karim-haikal-3050b1284/',
    },
    {
      'icon': 'assets/tech-stack/instagram.svg',
      'text': 'haikal.taufiq',
      'url': 'https://instagram.com/haikal.taufiq',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(
        children: [
          // ==== Bagian Text & Kontak ====
          Padding(
            padding: EdgeInsets.only(
              top: isMobile ? 100 : 200,
              left: isMobile ? 20 : 130,
              right: isMobile ? 20 : 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: isMobile ? 36 : 60,
                      height: 1.4,
                      letterSpacing: isMobile ? -1.0 : -3.5,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Poppins',
                    ),
                    children: const [
                      TextSpan(
                        text: 'Contact ',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: 'Me',
                        style: TextStyle(color: Color(0xff00E5FF)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: isMobile ? 30 : 20),

                // ==== List Kontak ====
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: contactItems.map((item) {
                    final iconPath = item['icon'] ?? 'assets/icons/default.svg';
                    final text = item['text'] ?? 'No Text';
                    final url = item['url'] ?? '';

                    return GestureDetector(
                      onTap: () => _launchUrl(url),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: isMobile ? 40 : 50,
                              height: isMobile ? 40 : 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  iconPath,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn),
                                ),
                              ),
                            ),
                            SizedBox(width: isMobile ? 10 : 20),
                            Flexible(
                              child: Text(
                                text,
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 28,
                                  letterSpacing: isMobile ? 0.5 : -1.0,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Transform.rotate(
                                angle: 45 * 3.1416 / 180,
                                child: Icon(
                                  Icons.arrow_upward,
                                  size: isMobile ? 18 : 24,
                                  color:
                                      const Color.fromARGB(190, 255, 255, 255),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),

          // ==== Lottie Animation ====
          Positioned(
            right: isMobile ? 25 : 150,
            top: isMobile ? 400 : 120,
            child: Lottie.asset(
              'assets/json/mail.json',
              width: isMobile ? 300 : 500,
              height: isMobile ? 300 : 500,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint("Could not launch $url");
      }
    } catch (e) {
      debugPrint("Error launching URL: $e");
    }
  }
}
