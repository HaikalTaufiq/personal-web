import 'package:flutter/material.dart';
import 'package:personal_web/sections/project_detail/booking_room.dart';
import 'package:personal_web/sections/project_detail/classroom.dart';
import 'package:personal_web/sections/project_detail/fish_feeder.dart';
import 'package:personal_web/sections/project_detail/fishing_game.dart';
import 'package:personal_web/sections/project_detail/garbage.dart';
import 'package:personal_web/sections/widgets/project-card.dart';

class MyProjectSection extends StatelessWidget {
  const MyProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    final List<Map<String, dynamic>> projects = [
      {
        "title":
            "Automatic Fish Feeder                                                                                     with IoT Based",
        "page": FishFeederPage(),
        "description":
            "A mobile application integrated with IoT to control an automated fish feeding system, as well as monitor aquarium maintenance parameters such as temperature, humidity, and feed levels.",
        "img": "assets/project-details/fish.png",
      },
      {
        "title": "Unity 3D Fishing Game",
        "page": FishingGame(),
        "description":
            "A 3D fishing game where the core gameplay revolves around fishing mechanics, and the game can be controlled using a joystick built with Arduino.",
        "img": "assets/project-details/game.png",
      },
      {
        "title": "E-Classroom with Flutter",
        "page": Classroom(),
        "description":
            "A mobile application designed to facilitate teaching and learning for teachers and students, featuring assignment upload and download, as well as task evaluation—similar to an e-learning platform.",
        "img": "assets/project-details/class.png",
      },
      {
        "title":
            "Garbage Payment                                                                                     Laravel Website",
        "page": Garbage(),
        "description":
            "A web-based platform for managing waste payments in a neighborhood, featuring monthly billing records, payment schedules, and garbage collection scheduling.",
        "img": "assets/project-details/11.png",
      },
      {
        "title":
            "Room Booking                                                                                     Laravel Website",
        "page": Booking(),
        "description":
            "An internal room reservation platform for companies, allowing employees to submit booking requests, and manage scheduling and approvals efficiently to support better space utilization.",
        "img": "assets/project-details/booking.png",
      },
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 20 : 10,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: RichText(
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
                      text: 'My ',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    TextSpan(
                      text: 'Project',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: projects.map((project) {
              return ProjectCard(
                title: project['title']?.toString() ?? 'Untitled',
                destination: project['page'] ?? const SizedBox(),
                description:
                    project['description']?.toString() ?? 'No description',
                img: project['img']?.toString() ?? 'assets/images/default.png',
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
