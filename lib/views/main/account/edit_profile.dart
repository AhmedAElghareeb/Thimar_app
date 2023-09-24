import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final cityNameController = TextEditingController();

  final passwordController = TextEditingController();

  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("البيانات الشخصية"),
        leading: Padding(
          padding: EdgeInsets.all(10.w.h),
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
                padding: EdgeInsets.only(
                  right: 7.w,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16.w.h,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 28.h,
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 85.w,
                    height: 85.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Stack(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(
                              0.32,
                            ),
                            BlendMode.darken,
                          ),
                          child: selectedImage != null
                              ? Image.file(
                            selectedImage!,
                            width: 85.w,
                            height: 85.h,
                            fit: BoxFit.fill,
                          )
                              : Image.network(
                            CacheHelper.getImage(),
                            width: 85.w,
                            height: 85.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              final image = await ImagePicker.platform.pickImage(
                                source: ImageSource.camera,
                                imageQuality: 35,
                              );
                              if (image != null) {
                                selectedImage = File(image.path);
                                setState(() {

                                });
                              }
                            },
                            child: SvgPicture.asset(
                              "assets/images/icons/accountIcons/camera.svg",
                              width: 25.w,
                              height: 25.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                AppInput(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  prefixIcon: "assets/images/icons/appInputIcons/person.svg",
                  labelText: "اسم المستخدم",
                ),
                SizedBox(
                  height: 16.h,
                ),
                AppInput(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: "assets/images/icons/appInputIcons/call.svg",
                  labelText: "رقم الجوال",
                  isPhone: true,
                ),
                SizedBox(
                  height: 16.h,
                ),
                AppInput(
                  controller: cityNameController,
                  keyboardType: TextInputType.name,
                  prefixIcon: "assets/images/icons/appInputIcons/flag.svg",
                  labelText: "المدينة",
                ),
                SizedBox(
                  height: 16.h,
                ),
                AppInput(
                  obscureText: true,
                  controller: passwordController,
                  labelText: "كلمة المرور",
                  prefixIcon:
                  "assets/images/icons/appInputIcons/lock.svg",
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 178.h,
                ),
                AppButton(
                  onTap: () {},
                  text: "تعديل البيانات",
                  radius: 15.r,
                  width: 343.w,
                  height: 60.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
