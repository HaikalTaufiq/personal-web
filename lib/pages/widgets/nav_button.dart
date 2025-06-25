import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final String label;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const NavButton({
    super.key,
    required this.label,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<NavButton> createState() => NavButtonState();
}

class NavButtonState extends State<NavButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    Color textColor;

    if (widget.isSelected || _isHovering) {
      textColor = const Color(0xFF00E5FF);
    } else {
      textColor = Colors.white;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
