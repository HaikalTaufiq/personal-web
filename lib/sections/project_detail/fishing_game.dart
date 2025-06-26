import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class FishingGame extends StatefulWidget {
  const FishingGame({super.key});

  @override
  State<FishingGame> createState() => _FishingGameState();
}

class _FishingGameState extends State<FishingGame> {
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
                Text('Unity, 3D Fishing Game',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      letterSpacing: -3.5,
                      height: 1,
                    )),
                Text('With UnoJoy Controller',
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
                    'A simple single-player 3D fishing game that can be controlled using a custom-built controller designed with Uno Joy. The game consists of three stages, each featuring uniquely crafted maps and environments. The core gameplay focuses on fishing mechanics, where the player must complete a series of missions to unlock and advance to the next stage. Alongside the main fishing activity, players can upgrade their fishing rods by purchasing items and enhancements from the in-game shop using rewards or currency earned through missions. Upgrades improve features such as casting distance, hook strength, and bait effectiveness, helping the player catch bigger or rarer fish in more challenging stages.',
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
                    onPressed: () =>
                        _launchUrl('https://github.com/HaikalTaufiq/Grainded'),
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
          right: 45,
          bottom: 50,
          child: Row(
            children: [
              SizedBox(
                width: 680,
                child: Image.asset('assets/images/Game.webp'),
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
          Text(
              'Unity,                                           3D Fishing Game',
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                letterSpacing: -1.5,
                height: 1.2,
              )),
          Text('With UnoJoy',
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
            'A simple single-player 3D fishing game that can be controlled using a custom-built controller designed with Uno Joy. The game consists of three stages, each featuring uniquely crafted maps and environments. The core gameplay focuses on fishing mechanics, where the player must complete a series of missions to unlock and advance to the next stage. Alongside the main fishing activity, players can upgrade their fishing rods by purchasing items and enhancements from the in-game shop using rewards or currency earned through missions. Upgrades improve features such as casting distance, hook strength, and bait effectiveness, helping the player catch bigger or rarer fish in more challenging stages.',
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
                    _launchUrl('https://github.com/HaikalTaufiq/Grainded'),
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
              child: Image.asset('assets/images/Game.webp'),
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
