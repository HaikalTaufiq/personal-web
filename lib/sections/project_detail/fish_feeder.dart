import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class FishFeederPage extends StatefulWidget {
  const FishFeederPage({super.key});

  @override
  State<FishFeederPage> createState() => _FishFeederPageState();
}

class _FishFeederPageState extends State<FishFeederPage> {
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
          ? SingleChildScrollView(child: _buildMobileContent())
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
                Text('Automatic Fish Feeder',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      letterSpacing: -3.5,
                      height: 1,
                    )),
                Text('With IoT Based',
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
                  width: 650,
                  child: Text(
                    'A mobile application developed using Flutter and integrated with Firebase that allows control of a program running on an ESP32, designed as an automatic fish feeder device. The system uses a servo motor for feeding, an ultrasonic sensor to check the percentage of remaining feed, a DHT sensor to monitor temperature and humidity, and a pH meter to measure the water’s acidity level. The device can be controlled through the application, which includes an alarm feature to support a scheduled automatic feeding system, as well as feed management supported by statistical features that present collected data on feed levels, water pH, temperature, and humidity in the fish pond.',
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
                        'https://github.com/HaikalTaufiq/squarepants'),
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
          right: 60,
          top: 10,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset('assets/squarepants/Stat-FF.png'),
              ),
              SizedBox(width: 20),
              Image.asset('assets/squarepants/Home-FF.png'),
              SizedBox(width: 20),
              Image.asset('assets/squarepants/Alarm-FF.png'),
            ],
          ),
        ),
        Positioned(
          right: 150,
          bottom: 50,
          child: Row(
            children: [
              Image.asset('assets/squarepants/Login-FF.png'),
              SizedBox(width: 20),
              Image.asset('assets/squarepants/Profile-FF.png'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Automatic                                          Fish Feeder',
              style: TextStyle(
                fontSize: 38,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                letterSpacing: -1.5,
                height: 1.2,
              )),
          Text('With IoT Based',
              style: TextStyle(
                fontSize: 38,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                letterSpacing: -1.5,
                height: 1.2,
              )),
          SizedBox(height: 20),
          Text(
            'A mobile application developed using Flutter and integrated with Firebase that allows control of a program running on an ESP32, designed as an automatic fish feeder device. The system uses a servo motor for feeding, an ultrasonic sensor to check the percentage of remaining feed, a DHT sensor to monitor temperature and humidity, and a pH meter to measure the water’s acidity level. The device can be controlled through the application, which includes an alarm feature to support a scheduled automatic feeding system, as well as feed management supported by statistical features that present collected data on feed levels, water pH, temperature, and humidity in the fish pond.',
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
                onPressed: () =>
                    _launchUrl('https://github.com/HaikalTaufiq/squarepants'),
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
            child: Column(
              children: [
                Image.asset('assets/squarepants/Login-FF.png'),
                SizedBox(height: 20),
                Image.asset('assets/squarepants/Home-FF.png'),
                SizedBox(height: 20),
                Image.asset('assets/squarepants/Alarm-FF.png'),
                SizedBox(height: 30),
                Image.asset('assets/squarepants/Stat-FF.png'),
                SizedBox(height: 20),
                Image.asset('assets/squarepants/Profile-FF.png'),
              ],
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
