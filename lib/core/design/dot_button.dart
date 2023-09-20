import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DotButton extends StatelessWidget {
  DotButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      color: Theme.of(context).primaryColor,
      radius: Radius.circular(15),
      padding: EdgeInsets.all(2),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 54,
          width: 343,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(
              0xfffafafa,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
