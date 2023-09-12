import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/logo.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/auth/login.dart';


class CreateNewPassword extends StatefulWidget {
  CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

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
                    CustomLogo(
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
                        } else if (value.toString() != passwordController.text)
                        {
                          return "كلمتا المرور غير متطابقتين";
                        }
                        return null;
                      },
                      prefixIcon: "assets/images/icons/appInputIcons/lock.svg",
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    AppButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          navigateTo(
                            LoginScreen(),
                          );
                        }
                      },
                      text: "تأكيد كلمة المرور",
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
