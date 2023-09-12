import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLogo extends StatelessWidget {
  CustomLogo({
    super.key,
    required this.text1,
    required this.text2,
  });

  late String text1;
  late String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/images/logo/logo1.svg",
          width: 130,
          height: 125,
        ),
        const SizedBox(
          height: 21,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            text1,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            text2,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Color(0xFF707070),
            ),
          ),
        ),
      ],
    );
  }
}
