import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class TechStack extends StatefulWidget {
  const TechStack({super.key});

  @override
  State<TechStack> createState() => _TechStackState();
}

class _TechStackState extends State<TechStack> {
  late final ScrollController _scrollController;
  Timer? _scrollTimer;

  final List<String> techIcons = [
    'assets/tech-stack/flutter.svg',
    'assets/tech-stack/dart.svg',
    'assets/tech-stack/firebase.svg',
    'assets/tech-stack/github.svg',
    'assets/tech-stack/figma.svg',
    'assets/tech-stack/unity.svg',
    'assets/tech-stack/arduino.svg',
    'assets/tech-stack/laravel.svg',
    'assets/tech-stack/xampp.svg',
    'assets/tech-stack/php.svg',
    'assets/tech-stack/html5.svg',
    'assets/tech-stack/css.svg',
    'assets/tech-stack/javascript.svg',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startScrolling();
  }

  void _startScrolling() {
    const duration = Duration(milliseconds: 100);
    _scrollTimer = Timer.periodic(duration, (timer) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.offset;

        if (currentScroll >= maxScroll) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.animateTo(
            currentScroll + 5,
            duration: duration,
            curve: Curves.linear,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  Future<bool> _checkAssetExists(String path) async {
    try {
      await rootBundle.load(path);
      return true;
    } catch (_) {
      debugPrint('⚠️ Asset not found: $path');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return SizedBox(
      height: isMobile ? 50 : 60,
      width: isMobile ? double.infinity : 595,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: techIcons.length * 2, // Loop dua kali untuk efek endless
        itemBuilder: (context, index) {
          final iconPath = techIcons[index % techIcons.length];
          return FutureBuilder<bool>(
            future: _checkAssetExists(iconPath),
            builder: (context, snapshot) {
              final assetExists = snapshot.data ?? false;
              if (snapshot.connectionState == ConnectionState.done &&
                  assetExists) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    width: isMobile ? 50 : 60,
                    height: isMobile ? 50 : 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        iconPath,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox(); // Bisa diganti dengan icon fallback jika perlu
              }
            },
          );
        },
      ),
    );
  }
}
