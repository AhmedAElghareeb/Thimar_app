import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/auth_header.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/auth/login.dart';
import 'package:thimar_app/views/auth/verify_code.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key, required this.phone});

  final String phone;

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();

  final phoneNumberController = TextEditingController();

  bool isLoading = false;

  void forgetPassword() async {
    isLoading = true;
    setState(() {});
    final response = await DioHelper().sendToServer(
      url: "forget_password",
      body: {
        "phone": phoneNumberController.text,
      },
    );
    if (response.success) {
      showSnackBar(response.msg, typ: MessageType.success);
      navigateTo(
        VerifyCode(
          isActive: false,
          phone: phoneNumberController.text,
        ),
      );
    } else {
      showSnackBar(response.msg);
    }
    isLoading = false;
    setState(() {});
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
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                children: [
                  AuthHeader(
                    text1: "نسيت كلمة المرور",
                    text2: "أدخل رقم الجوال المرتبط بحسابك",
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Form(
                    key: _formKey,
                    child: AppInput(
                      controller: phoneNumberController,
                      labelText: "رقم الجوال",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "حقل رقم الجوال مطلوب";
                        }
                        return null;
                      },
                      prefixIcon: "assets/images/icons/appInputIcons/call.svg",
                      isPhone: true,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : AppButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              forgetPassword();
                            }
                          },
                          text: "تأكيد رقم الجوال",
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
        ],
      ),
    );
  }
}
