import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Garbage extends StatelessWidget {
  const Garbage({super.key});
  final bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: isMobile
          ? SingleChildScrollView(child: _buildMobileContent(context))
          : _buildWebContent(),
    );
  }

  Widget _buildWebContent() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Garbage Management',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      letterSpacing: -3.5,
                      height: 1,
                    )),
                Text('With Laravel',
                    style: TextStyle(
                      fontSize: 60,
                      letterSpacing: -3.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      height: 1,
                    )),
                SizedBox(height: 25),
                SizedBox(
                  width: 750,
                  child: Text(
                    'This project was the starting point of my journey in programming. A web-based residential waste management system developed using Laravel. This platform offers features for managing waste collection schedules and payment tracking, providing a more organized and efficient approach to waste services in residential areas. The system allows residents to view and follow payment schedules and waste pickup dates directly from the website, eliminating the need for manual, door-to-door payment collection. For administrators, the system provides tools to manage user data, monitor payment status, and organize pickup logistics efficiently.',
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: -0.5,
                      color: const Color.fromARGB(206, 255, 255, 255),
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    onPressed: () => _launchUrl(
                        'https://github.com/HaikalTaufiq/garbage-payment'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isHovering
                          ? const Color(0xFF00E5FF)
                          : const Color.fromARGB(190, 0, 229, 255),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/tech-stack/github.svg',
                          width: 24,
                          height: 24,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'GitHub',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Transform.rotate(
                            angle: 45 * 3.1416 / 180,
                            child: Icon(
                              Icons.arrow_upward,
                              color: const Color.fromARGB(190, 255, 255, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 65,
          bottom: 50,
          child: Row(
            children: [
              SizedBox(
                width: 480,
                child: Image.asset('assets/images/Garbage.png'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Garbage Management',
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                height: 1.2,
              )),
          Text('With Laravel',
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                letterSpacing: -1.5,
                height: 1.2,
              )),
          SizedBox(height: 20),
          Text(
            'This project was the starting point of my journey in programming. A web-based residential waste management system developed using Laravel. This platform offers features for managing waste collection schedules and payment tracking, providing a more organized and efficient approach to waste services in residential areas. The system allows residents to view and follow payment schedules and waste pickup dates directly from the website, eliminating the need for manual, door-to-door payment collection. For administrators, the system provides tools to manage user data, monitor payment status, and organize pickup logistics efficiently.',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(206, 255, 255, 255),
              fontWeight: FontWeight.w200,
              fontFamily: 'Poppins',
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () => _launchUrl(
                    'https://github.com/HaikalTaufiq/garbage-payment'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isHovering
                      ? const Color(0xFF00E5FF)
                      : const Color.fromARGB(190, 0, 229, 255),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/tech-stack/github.svg',
                      width: 24,
                      height: 24,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'GitHub',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Transform.rotate(
                        angle: 45 * 3.1416 / 180,
                        child: Icon(
                          Icons.arrow_upward,
                          color: const Color.fromARGB(190, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Image.asset('assets/images/Garbage.png'),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
