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

import '../../features/forget_password/bloc.dart';
import '../../features/forget_password/events.dart';
import '../../features/forget_password/states.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key, required this.phone});

  final String phone;

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();

  final bloc = KiwiContainer().resolve<ForgetPasswordBloc>();

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
            body: BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                return SafeArea(
                  child: ListView(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 16.w,
                      vertical: 20.h,
                    ),
                    children: [
                      const AuthHeader(
                        text1: "نسيت كلمة المرور",
                        text2: "أدخل رقم الجوال المرتبط بحسابك",
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Form(
                        key: _formKey,
                        child: AppInput(
                          controller: bloc.phoneNumberController,
                          labelText: "رقم الجوال",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "حقل رقم الجوال مطلوب";
                            }
                            return null;
                          },
                          prefixIcon:
                              "assets/images/icons/appInputIcons/call.svg",
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      AppButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            bloc.add(
                              UserForgetPasswordEvent(),
                            );
                          }
                        },
                        text: "تأكيد رقم الجوال",
                        isLoading: state is ForgetPasswordLoadingState,
                        radius: 15.r,
                        width: 343.w,
                        height: 60.h,
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
                              color: Theme.of(context).primaryColor,
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
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
