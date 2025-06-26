import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Classroom extends StatefulWidget {
  const Classroom({super.key});

  @override
  State<Classroom> createState() => _ClassroomState();
}

class _ClassroomState extends State<Classroom> {
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
                Text('E-Classroom Management',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      letterSpacing: -3.5,
                      height: 1,
                    )),
                Text('With Flutter & Firebase',
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
                    'A mobile application designed for comprehensive classroom management, featuring user roles such as Student, Teacher, and Admin. This application supports a fully online assignment system, enabling teachers to assign tasks and students to submit their work digitally. It includes features for grading assignments and monitoring student activity, allowing teachers and administrators to track student engagement and performance in real-time. The system streamlines the workflow of academic tasks by providing submission deadlines, and progress tracking. Teachers can provide personalized feedback, while students receive timely updates on their grades and pending tasks. Admins can oversee all class activities, manage users, and generate reports for academic evaluation.',
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
                        _launchUrl('https://github.com/HaikalTaufiq/Classroom'),
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
                child: Image.asset('assets/class/ClassApp03.png'),
              ),
              SizedBox(width: 20),
              Image.asset('assets/class/ClassApp02.png'),
              SizedBox(width: 20),
              Image.asset('assets/class/ClassApp01.png'),
            ],
          ),
        ),
        Positioned(
          right: 150,
          bottom: 50,
          child: Row(
            children: [
              Image.asset('assets/class/ClassApp04.png'),
              SizedBox(width: 20),
              Image.asset('assets/class/ClassApp05.png'),
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
          Text('E-Classroom ',
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                letterSpacing: -1.5,
                height: 1.2,
              )),
          Text('With Flutter & Firebase',
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
            'A mobile application designed for comprehensive classroom management, featuring user roles such as Student, Teacher, and Admin. This application supports a fully online assignment system, enabling teachers to assign tasks and students to submit their work digitally. It includes features for grading assignments and monitoring student activity, allowing teachers and administrators to track student engagement and performance in real-time. The system streamlines the workflow of academic tasks by providing submission deadlines, and progress tracking. Teachers can provide personalized feedback, while students receive timely updates on their grades and pending tasks. Admins can oversee all class activities, manage users, and generate reports for academic evaluation.',
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
                    _launchUrl('https://github.com/HaikalTaufiq/Classroom'),
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
                Image.asset('assets/class/ClassApp05.png'),
                SizedBox(height: 20),
                Image.asset('assets/class/ClassApp04.png'),
                SizedBox(height: 30),
                Image.asset('assets/class/ClassApp01.png'),
                SizedBox(height: 20),
                Image.asset('assets/class/ClassApp02.png'),
                SizedBox(height: 20),
                Image.asset('assets/class/ClassApp03.png'),
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
