import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/auth_header.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/auth/login.dart';

import '../../features/reset_password/bloc.dart';
import '../../features/reset_password/events.dart';
import '../../features/reset_password/states.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword(
      {super.key, required this.phone, required this.pinCode});

  final String phone;
  final String pinCode;

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final _formKey = GlobalKey<FormState>();

  final bloc = KiwiContainer().resolve<ResetPasswordBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/logo/bg.svg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  children: [
                    const AuthHeader(
                      text1: "نسيت كلمة المرور",
                      text2: "أدخل كلمة المرور الجديدة",
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    AppInput(
                      controller: bloc.passwordController,
                      labelText: "كلمة المرور",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "حقل كلمة المرور مطلوب";
                        }
                        return null;
                      },
                      prefixIcon: "assets/images/icons/appInputIcons/lock.svg",
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppInput(
                      controller: bloc.confirmPasswordController,
                      labelText: "تأكيد كلمة المرور",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "حقل تأكيد كلمة المرور مطلوب";
                        } else
                        if (value.toString() != bloc.passwordController.text) {
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
                      height: 25.h,
                    ),
                    BlocBuilder(
                      bloc: bloc,
                      builder: (context, state) {
                        return AppButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              bloc.add(UserResetPasswordEvent(
                                  pinCode: widget.pinCode,
                                  phone: widget.phone
                              ),);
                            }
                          },
                          text: "تأكيد كلمة المرور",
                          radius: 15.r,
                          width: 343.w,
                          height: 60.h,
                          isLoading: state is ResetPasswordLoadingState,
                        );
                      },
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "لديك حساب بالفعل ؟",
                          style: TextStyle(
                            color: Theme
                                .of(context)
                                .primaryColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(
                              const LoginScreen(),
                            );
                          },
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
