import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
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
                Text('Room Booking',
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
                  width: 500,
                  child: Text(
                    'A web-based system designed for managing room bookings within a company for various purposes. The system features an automated approval or decline mechanism based on schedule conflicts. Users can submit room requests through an intuitive interface and track the status of their submissions in real-time—whether pending, approved, or declined. The platform also includes a reporting feature, allowing users to submit reports related to room conditions. Additionally, the system provides a comprehensive usage summary, offering detailed reports of room bookings, usage frequency, and any reported issues. This data can be accessed by administrators or facility managers to monitor resource utilization.',
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
                        'https://github.com/HaikalTaufiq/booking-rooms'),
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
                width: 820,
                child: Image.asset('assets/images/Booking.webp'),
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
          Text('Room Booking',
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                letterSpacing: -1.5,
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
            'A web-based system designed for managing room bookings within a company for various purposes. The system features an automated approval or decline mechanism based on schedule conflicts. Users can submit room requests through an intuitive interface and track the status of their submissions in real-time—whether pending, approved, or declined. The platform also includes a reporting feature, allowing users to submit reports related to room conditions. Additionally, the system provides a comprehensive usage summary, offering detailed reports of room bookings, usage frequency, and any reported issues. This data can be accessed by administrators or facility managers to monitor resource utilization.',
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
                    _launchUrl('https://github.com/HaikalTaufiq/booking-rooms'),
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
              child: Image.asset('assets/images/Booking.webp'),
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
