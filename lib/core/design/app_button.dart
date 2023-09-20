import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backColor,
    this.textColor,
    this.width,
    this.height,
    this.radius,
  });

  final VoidCallback onTap;
  final String text;
  final Color? backColor;
  final Color? textColor;
  final double? width, height, radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius!,
        ),
        color: backColor ?? Theme.of(context).primaryColor,
      ),
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? const Color(0xFFFFFFFF),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
