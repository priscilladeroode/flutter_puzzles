import 'package:flutter/material.dart';

class PuzzleElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final bool expanded;

  const PuzzleElevatedButton.primary({
    Key? key,
    required this.onPressed,
    required this.text,
    this.expanded = false,
    this.color = const Color(0xFFF0B000),
  }) : super(key: key);

  const PuzzleElevatedButton.secondary({
    Key? key,
    required this.onPressed,
    required this.text,
    this.expanded = false,
    this.color = const Color(0xFFFF006E),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
