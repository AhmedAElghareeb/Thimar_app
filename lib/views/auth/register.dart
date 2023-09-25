import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/auth_header.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/register/cubit.dart';
import 'package:thimar_app/features/register/states.dart';
import 'package:thimar_app/views/auth/login.dart';
import 'package:thimar_app/views/sheets/cities.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = BlocProvider.of(context);
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
              bloc: cubit,
              builder: (context, state) => SafeArea(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 20.h,
                    ),
                    children: [
                      const AuthHeader(
                        text1: "مرحبا بك مرة أخرى",
                        text2: "يمكنك تسجيل حساب جديد الأن",
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      AppInput(
                        controller: cubit.nameController,
                        labelText: "اسم المستخدم",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "حقل إسم المستخدم مطلوب";
                          }
                          return null;
                        },
                        prefixIcon:
                            "assets/images/icons/appInputIcons/person.svg",
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppInput(
                        controller: cubit.phoneNumberController,
                        labelText: "رقم الجوال",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "حقل رقم الجوال مطلوب";
                          }
                          return null;
                        },
                        prefixIcon:
                            "assets/images/icons/appInputIcons/call.svg",
                        isPhone: true,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      StatefulBuilder(
                        builder: (context, setState) => GestureDetector(
                          onTap: () async {
                            var result = await showModalBottomSheet(
                              context: context,
                              builder: (context) => const CitiesSheets(),
                            );
                            if (result != null) {
                              cubit.selectedCity = result;
                              setState(() {});
                            }
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: AppInput(
                                    labelText:
                                        cubit.selectedCity?.name ?? "المدينة",
                                    validator: (value) {
                                      if (cubit.selectedCity == null) {
                                        return "حقل المدينة مطلوب";
                                      }
                                      return null;
                                    },
                                    prefixIcon:
                                        "assets/images/icons/appInputIcons/flag.svg",
                                  ),
                                ),
                              ),
                              if (cubit.selectedCity != null)
                                IconButton(
                                  onPressed: () {
                                    cubit.selectedCity = null;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    size: 24.w.h,
                                    color: Colors.red,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppInput(
                        obscureText: true,
                        controller: cubit.passwordController,
                        labelText: "كلمة المرور",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "حقل كلمة المرور مطلوب";
                          }
                          return null;
                        },
                        prefixIcon:
                            "assets/images/icons/appInputIcons/lock.svg",
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppInput(
                        obscureText: true,
                        controller: cubit.confirmPasswordController,
                        labelText: "تأكيد كلمة المرور",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "حقل تأكيد كلمة المرور مطلوب";
                          } else if (value.toString() !=
                              cubit.passwordController.text) {
                            return "كلمتا المرور غير متطابقتين";
                          }
                          return null;
                        },
                        prefixIcon:
                            "assets/images/icons/appInputIcons/lock.svg",
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Builder(
                        builder: (context) {
                          if (state is RegisterLoadingState) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              ),
                            );
                          }
                          return AppButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.userRegister();
                                }
                              },
                              text: "تسجيل",
                            radius: 15.r,
                            width: 343.w,
                            height: 60.h,
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
