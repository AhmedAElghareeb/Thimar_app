import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:flutter/material.dart';


AwesomeDialog confirmationDialog(String desc, VoidCallback onOkTapped,
    {Function()? onCancelTapped}) {
  return AwesomeDialog(
      context: navigatorKey.currentContext!,
      headerAnimationLoop: false,
      transitionAnimationDuration: const Duration(seconds: 1),
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      desc: desc,
      // descTextStyle: navigatorKey.currentContext!.textTheme.titleMedium,
      dismissOnTouchOutside: true,
      // buttonsTextStyle: navigatorKey.currentContext!.textTheme.bodyMedium!.copyWith(color: colorTextWhite),
      // btnOkColor: navigatorKey.currentContext?.theme.primaryColor,
      btnOkText: "yes",
      btnCancelText: "no",
      btnCancelOnPress: onCancelTapped ?? () {},
      btnOkOnPress: onOkTapped)
    ..show();
}