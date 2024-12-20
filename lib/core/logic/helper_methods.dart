import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future navigateTo(Widget page, {bool removeHistory = false}) {
  return Navigator.pushAndRemoveUntil(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => page,
    ),
    (route) => true,
  );
}

MaterialColor getMaterialColor() {
  Color color = const Color(0xFF4C8613);
  final Map<int, Color> shades = {
    50: color.withOpacity(.1),
    100: color.withOpacity(.2),
    200: color.withOpacity(.3),
    300: color.withOpacity(.4),
    400: color.withOpacity(.5),
    500: color.withOpacity(.6),
    600: color.withOpacity(.7),
    700: color.withOpacity(.8),
    800: color.withOpacity(.9),
    900: color,
  };
  return MaterialColor(color.value, shades);
}

enum MessageType { success, fail, warning }

void showSnackBar(String message, {MessageType typ = MessageType.fail}) {
  if (message.isNotEmpty) {
    ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        elevation: 0,
        backgroundColor: typ == MessageType.fail
            ? Colors.red
            : typ == MessageType.warning
                ? Colors.yellow
                : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15.r,
          ),
        ),
      ),
    );
  }
}

Future<String> getLocationFromLatLong(LatLng latLng) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

  String x = '';
  if (placemarks.isNotEmpty) {
    if (kDebugMode) {
      print('-==-=-=-=-=-=-- ${placemarks.first.toJson()}');
    }
    x = '${placemarks.first.street ?? ''} - ${placemarks.first.subAdministrativeArea ?? ''}';
  }
  return x;
}

String getOrderStatus(String status) {
  switch (status) {
    case 'pending':
      return "بإنتظار الموافقة";
    case 'preparation':
      return "جاري التحضير";
    case 'in_way':
      return "فى الطريق";
    case 'finished':
      return "منتهي";
    case 'canceled':
      return "طلب ملغي";
    case 'accepted':
      return "تم قبول الطلب";
    default:
      return "";
  }
}

Color getOrderStatusColor(String status) {
  switch (status) {
    case 'pending':
      return const Color(0xffE8F2DF);
    case 'preparation':
      return const Color(0xffC7F697);
    case 'in_way':
      return const Color(0xff96A9F6);
    case 'finished':
      return const Color(0xff707070);
    case 'canceled':
      return const Color(0xffFFCFCF);
    case 'accepted':
      return Theme.of(navigatorKey.currentState!.context)
          .primaryColor;

    default:
      return Theme.of(navigatorKey.currentState!.context)
          .primaryColor
          .withOpacity(
            0.5,
          );
  }
}

Color getOrderStatusTextColor(String status) {
  switch (status) {
    case 'pending':
      return const Color(0xff4C8613);
    case 'preparation':
      return const Color(0xff72C720);
    case 'in_way':
      return const Color(0xff2D9E78);
    case 'finished':
      return const Color(0xffFFFFFF);
    case 'canceled':
      return const Color(0xffFF0000);
    case 'accepted':
      return const Color(0xffFFFFFF);

    default:
      return Theme.of(navigatorKey.currentState!.context)
          .primaryColor
          .withOpacity(
            0.5,
          );
  }
}

void onShowBottomSheet(
    BuildContext context, {
      required Widget bottomSheet,
      double? maxHeight,
    }) =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      constraints: BoxConstraints(
        minHeight: 200.h,
        maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.55,
      ),
      backgroundColor: Colors.transparent,
      builder: (_) => bottomSheet,
    );
