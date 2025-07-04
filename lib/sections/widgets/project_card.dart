import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final Widget destination;
  final String description;
  final String img;

  const ProjectCard({
    super.key,
    required this.title,
    required this.destination,
    required this.description,
    required this.img,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    final Color hoverColor = _isHovering
        ? const Color(0x14A0A0A0)
        : const Color.fromARGB(72, 88, 88, 88);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.destination),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: isMobile ? double.infinity : 450,
          height: isMobile ? null : 250,
          padding: isMobile ? const EdgeInsets.all(16) : EdgeInsets.zero,
          decoration: BoxDecoration(
            color: hoverColor,
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: _isHovering
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 14,
                      offset: const Offset(0, 8),
                    )
                  ]
                : [],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 24,
                        height: 1.2,
                        letterSpacing: -1.0,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: isMobile ? double.infinity : 210,
                      child: Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: isMobile ? 13 : 12,
                          fontWeight:
                              isMobile ? FontWeight.w100 : FontWeight.w200,
                          fontFamily: 'Poppins',
                          color: const Color.fromARGB(220, 255, 255, 255),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),

              // Gambar proyek (hanya di desktop)
              if (!isMobile)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(18),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(18),
                      ),
                      child: Image.asset(
                        widget.img,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.withOpacity(0.2),
                            alignment: Alignment.center,
                            child: const Icon(Icons.broken_image,
                                color: Colors.white70),
                          );
                        },
                      ),
                    ),
                  ),
                ),

              // Tombol panah
              Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                  icon: Transform.rotate(
                    angle: 45 * 3.1416 / 180,
                    child: const Icon(
                      Icons.arrow_upward,
                      color: Color.fromARGB(190, 255, 255, 255),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => widget.destination,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
