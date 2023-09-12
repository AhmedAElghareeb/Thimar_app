import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backColor,
    this.textColor,
  });

  late VoidCallback onTap;
  late String text;
  late Color? backColor;
  late Color? textColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
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
