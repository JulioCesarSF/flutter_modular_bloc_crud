// Button widget
import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    Key? key,
    this.size,
    this.color,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Color? color;
  final VoidCallback? onPressed;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10.0),
        fixedSize: size ?? const Size(200, 40),
        primary: color ?? Colors.blue,
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
