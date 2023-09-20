import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("البيانات الشخصية"),
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Color(
                  0xff707070,
                ).withOpacity(0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 7,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 28,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 112,
                  height: 134,
                  child: Column(
                    children: [
                      Container(
                        width: 76,
                        height: 71,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Image.network(
                              "https://thimar.amr.aait-d.com/public/dashboardAssets/images/backgrounds/avatar.jpg",
                              opacity: const AlwaysStoppedAnimation(.6),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25),
                              child: SvgPicture.asset(
                                "assets/images/icons/accountIcons/camera.svg",
                                width: 25,
                                height: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "محمد علي",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "96654787856+",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xffA7A7A7,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                AppInput(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  prefixIcon: "assets/images/icons/appInputIcons/person.svg",
                  labelText: "اسم المستخدم",
                ),
                SizedBox(
                  height: 16,
                ),
                AppInput(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: "assets/images/icons/appInputIcons/call.svg",
                  labelText: "رقم الجوال",
                  isPhone: true,
                ),
                SizedBox(
                  height: 16,
                ),
                AppInput(
                  controller: cityNameController,
                  keyboardType: TextInputType.name,
                  prefixIcon: "assets/images/icons/appInputIcons/flag.svg",
                  labelText: "المدينة",
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Color(
                          0xffF3F3F3,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Color(
                          0xffF3F3F3,
                        ),
                      ),
                    ),
                    hintText: "كلمة المرور",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        "assets/images/icons/appInputIcons/lock.svg",
                        fit: BoxFit.scaleDown,
                        height: 20,
                        width: 32,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 14,
                        top: 21,
                        bottom: 21,
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 12,
                            color: Color(
                              0xffB2BCA8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 160,
                ),
                AppButton(
                  onTap: () {},
                  text: "تعديل البيانات",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
