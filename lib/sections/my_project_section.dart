import 'package:flutter/material.dart';
import 'package:personal_web/sections/project_detail/booking_room.dart';
import 'package:personal_web/sections/project_detail/classroom.dart';
import 'package:personal_web/sections/project_detail/fish_feeder.dart';
import 'package:personal_web/sections/project_detail/fishing_game.dart';
import 'package:personal_web/sections/project_detail/garbage.dart';
import 'package:personal_web/sections/widgets/project_card.dart';

class MyProjectSection extends StatefulWidget {
  const MyProjectSection({super.key});

  @override
  State<MyProjectSection> createState() => _MyProjectSectionState();
}

class _MyProjectSectionState extends State<MyProjectSection> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    final List<Project> projects = [
      Project(
        title: "Automatic Fish Feeder with IoT Based",
        page: const FishFeederPage(),
        description:
            "A mobile app integrated with IoT to control and monitor an automatic fish feeder system remotely.",
        img: "assets/project-details/fish.webp",
      ),
      Project(
        title: "Unity 3D Fishing Game",
        page: const FishingGame(),
        description:
            "A 3D fishing game where players catch fish using a joystick built with Arduino, focused on survival gameplay.",
        img: "assets/project-details/game.webp",
      ),
      Project(
        title: "E-Classroom with Flutter",
        page: const Classroom(),
        description:
            "A Flutter-based e-learning platform with task upload, download, evaluation, and course management.",
        img: "assets/project-details/class.webp",
      ),
      Project(
        title: "Garbage Payment Laravel Website",
        page: const Garbage(),
        description:
            "A Laravel app for managing waste payments in residential areas with payment tracking and scheduling.",
        img: "assets/project-details/11.webp",
      ),
      Project(
        title: "Room Booking Laravel Website",
        page: const Booking(),
        description:
            "An internal company room reservation website for managing meeting schedules and booking approvals.",
        img: "assets/project-details/booking.webp",
      ),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 20 : 40,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
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
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: 'Project',
                      style: TextStyle(color: Color(0xff00E5FF)),
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
                title: project.title,
                destination: project.page,
                description: project.description,
                img: project.img,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String img;
  final Widget page;

  Project({
    required this.title,
    required this.description,
    required this.img,
    required this.page,
  });
}
