import 'dart:io';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/auth_header.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/auth/create_new_password.dart';
import 'package:thimar_app/views/auth/login.dart';


class VerifyCode extends StatefulWidget {
  final bool isActive;
  final String phone;

  const VerifyCode({super.key, required this.isActive, required this.phone});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final _formKey = GlobalKey<FormState>();

  final pinCodeController = TextEditingController();

  bool isTimerFinished = false;

  bool isLoading = false;

  void userVerify() async {
    isLoading = true;
    setState(() {});
    final response = await DioHelper().sendToServer(
      url: "verify",
      body: {
        "code": pinCodeController.text,
        "phone": widget.phone,
        "device_token": "test",
        "type": Platform.operatingSystem,
      },
    );
    if (response.success) {
      showSnackBar(response.msg, typ: MessageType.success);
      if (widget.isActive) {
        navigateTo(
          LoginScreen(),
        );
      } else {
        navigateTo(
          CreateNewPassword(
            phone: widget.phone,
            pinCode: pinCodeController.text,
          ),
        );
      }
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                children: [
                  AuthHeader(
                    text1:
                        widget.isActive ? "تفعيل الحساب" : "نسيت كلمة المرور",
                    text2: "أدخل الكود المكون من 4 أرقام المرسل علي رقم",
                  ),
                  Row(
                    children: [
                      Text(
                        "الجوال ${widget.phone}+",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF707070),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "تغيير رقم الجوال",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      controller: pinCodeController,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15),
                        fieldHeight: 60,
                        fieldWidth: 70,
                        inactiveColor: const Color(0xffF3F3F3),
                        selectedColor: Theme.of(context).primaryColor,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "الحقل مطلوب";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    height: 37,
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
                              userVerify();
                            }
                          },
                          text: "تأكيد الكود",
                    radius: 15,
                    width: 343,
                    height: 60,
                        ),
                  const SizedBox(
                    height: 27,
                  ),
                  const Text(
                    "لم تستلم الكود؟ \n يمكنك اعادة ارسال الكود بعد",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF707070),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  isTimerFinished
                      ? Center(
                          child: OutlinedButton(
                            onPressed: () {
                              isTimerFinished = false;
                              setState(() {});
                            },
                            child: const Text(
                              "إعادة إرسال",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : CircularCountDownTimer(
                    isReverse: true,
                          width: 66,
                          height: 69,
                          duration: 90,
                          fillColor: const Color(0xffD8D8D8),
                          ringColor: Theme.of(context).primaryColor,
                          strokeWidth: 3,
                          textFormat: CountdownTextFormat.MM_SS,
                          textStyle: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                          isReverseAnimation: true,
                          onComplete: () {
                            isTimerFinished = true;
                            setState(() {});
                          },
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
