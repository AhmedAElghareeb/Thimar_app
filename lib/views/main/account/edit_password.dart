import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/auth_header.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/features/edit_profile/events.dart';
import 'package:thimar_app/features/edit_profile/states.dart';

import '../../../features/edit_profile/bloc.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmNewPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final bloc = KiwiContainer().resolve<EditProfileBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تغيير كلمة المرور",
        ),
        leading: Padding(
          padding: EdgeInsetsDirectional.all(
            10.r,
          ),
          child: GestureDetector(
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                color: const Color(
                  0xff707070,
                ).withOpacity(0.1),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 7.w,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16.r,
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.w,
            vertical: 20.h,
          ),
          children: [
            AuthHeader(
              text1: "مرحبا ${CacheHelper.getFullName()}",
              text2: "يمكنك تعديل كلمة المرور الآن",
            ),
            SizedBox(
              height: 20.h,
            ),
            AppInput(
              controller: oldPassword,
              labelText: "كلمة المرور القديمة",
              validator: (value) {
                if (value!.isEmpty) {
                  return "حقل كلمة المرور القديمة مطلوب";
                }
                return null;
              },
              prefixIcon: "assets/images/icons/appInputIcons/lock.svg",
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
              maxLines: 1,
            ),
            SizedBox(
              height: 20.h,
            ),
            AppInput(
              controller: newPassword,
              labelText: "كلمة المرور الجديدة",
              validator: (value) {
                if (value!.isEmpty) {
                  return "حقل كلمة المرور الجديدة مطلوب";
                }
                return null;
              },
              prefixIcon: "assets/images/icons/appInputIcons/lock.svg",
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
              maxLines: 1,
            ),
            SizedBox(
              height: 20.h,
            ),
            AppInput(
              controller: confirmNewPassword,
              labelText: "تأكيد كلمة المرور",
              validator: (value) {
                if (value!.isEmpty) {
                  return "حقل تأكيد كلمة المرور مطلوب";
                } else if (value.toString() != newPassword.text) {
                  return "كلمتا المرور غير متطابقتين";
                }
                return null;
              },
              prefixIcon: "assets/images/icons/appInputIcons/lock.svg",
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
              maxLines: 1,
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                return AppButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(
                        EditUserPasswordEvent(
                          oldPass: oldPassword.text,
                          pass: newPassword.text,
                          confirmPass: confirmNewPassword.text,
                        ),
                      );
                    }
                  },
                  text: "تغيير كلمة المرور",
                  width: 343.w,
                  height: 55.h,
                  radius: 15.r,
                  isLoading: state is EditUserPasswordLoadingState,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
