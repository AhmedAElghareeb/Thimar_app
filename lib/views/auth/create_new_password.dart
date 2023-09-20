import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/auth_header.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/auth/login.dart';

class CreateNewPassword extends StatefulWidget {
  CreateNewPassword({super.key, required this.phone, required this.pinCode});

  final String phone;
  final String pinCode;

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  bool isLoading = false;

  void resetPassword() async {
    isLoading = true;
    setState(
      () {},
    );
    final response = await DioHelper().sendToServer(
      url: "reset_password",
      body: {
        "phone": widget.phone,
        "code": widget.pinCode,
        "password": passwordController.text,
      },
    );
    if (response.success) {
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
      navigateTo(
        LoginScreen(),
      );
    } else {
      showSnackBar(
        response.msg,
      );
    }
    isLoading = false;
    setState(
      () {},
    );
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  children: [
                    AuthHeader(
                      text1: "نسيت كلمة المرور",
                      text2: "أدخل كلمة المرور الجديدة",
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    AppInput(
                      obscureText: true,
                      controller: passwordController,
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
                    const SizedBox(
                      height: 16,
                    ),
                    AppInput(
                      obscureText: true,
                      controller: confirmPasswordController,
                      labelText: "تأكيد كلمة المرور",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "حقل تأكيد كلمة المرور مطلوب";
                        } else if (value.toString() !=
                            passwordController.text) {
                          return "كلمتا المرور غير متطابقتين";
                        }
                        return null;
                      },
                      prefixIcon: "assets/images/icons/appInputIcons/lock.svg",
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    AppButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          resetPassword();
                        }
                      },
                      text: "تأكيد كلمة المرور",
                      radius: 15,
                      width: 343,
                      height: 60,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "لديك حساب بالفعل ؟",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(
                              LoginScreen(),
                            );
                          },
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
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
