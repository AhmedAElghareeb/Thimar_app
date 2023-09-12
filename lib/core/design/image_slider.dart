import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ImageSliderShow extends StatelessWidget {
  const ImageSliderShow({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: const Color(0xFFFFFFFF),
      indicatorBackgroundColor: Color(
        0xffFFFFFF,
      ).withOpacity(
        0.3,
      ),
      indicatorRadius: 4,
      autoPlayInterval: 3000,
      isLoop: true,
      indicatorBottomPadding: 7,
      indicatorPadding: 3,
      children: [
        SvgPicture.asset(
          "assets/images/logo/home_slider_image.svg",
          fit: BoxFit.cover,
        ),
        SvgPicture.asset(
          "assets/images/logo/home_slider_image.svg",
          fit: BoxFit.cover,
        ),
        SvgPicture.asset(
          "assets/images/logo/home_slider_image.svg",
          fit: BoxFit.cover,
        ),
        SvgPicture.asset(
          "assets/images/logo/home_slider_image.svg",
          fit: BoxFit.cover,
        ),
        SvgPicture.asset(
          "assets/images/logo/home_slider_image.svg",
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
