import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/features/edit_profile/events.dart';
import 'package:thimar_app/features/edit_profile/states.dart';
import 'package:thimar_app/features/get_cities/states.dart';

import '../../../core/logic/helper_methods.dart';
import '../../../features/edit_profile/bloc.dart';
import '../../../features/get_cities/bloc.dart';
import '../../../features/get_cities/events.dart';
import 'edit_password.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController(
    text: CacheHelper.getFullName(),
  );

  final phoneNumberController = TextEditingController(
    text: CacheHelper.getPhone(),
  );

  final cityNameController = TextEditingController(
    text: CacheHelper.getCity(),
  );

  final passwordController = TextEditingController();

  File? selectedImage;
  int cityId = CacheHelper.getCityId();

  final bloc = KiwiContainer().resolve<EditProfileBloc>();
  final citiesBloc = KiwiContainer().resolve<CitiesBloc>()
    ..add(
      GetCitiesDataEvent(),
    );

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    citiesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("البيانات الشخصية"),
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
          padding: EdgeInsetsDirectional.symmetric(
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
                    child: StatefulBuilder(
                      builder: (context, setState) => Stack(
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
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                        15.r,
                                      ),
                                      topLeft: Radius.circular(
                                        15.r,
                                      ),
                                    ),
                                  ),
                                  builder: (context) => SizedBox(
                                    height: 150.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        const Center(
                                          child: Text(
                                            "اختار الصورة من",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              child: Container(
                                                width: 100.w,
                                                height: 30.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    15.r,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.camera_alt,
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    const Text(
                                                      "الكاميرا",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () async {
                                                final image = await ImagePicker
                                                    .platform
                                                    .pickImage(
                                                  source: ImageSource.camera,
                                                  imageQuality: 30,
                                                );
                                                if (image != null) {
                                                  selectedImage =
                                                      File(image.path);
                                                  setState(() {});
                                                }
                                                Navigator.pop(
                                                    context, selectedImage);
                                              },
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                width: 120.w,
                                                height: 30.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    15.r,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons
                                                          .photo_library_outlined,
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    const Text(
                                                      "المعرض",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () async {
                                                final image = await ImagePicker
                                                    .platform
                                                    .pickImage(
                                                  source: ImageSource.gallery,
                                                  imageQuality: 35,
                                                );
                                                if (image != null) {
                                                  selectedImage =
                                                      File(image.path);
                                                  setState(() {});
                                                }
                                                Navigator.pop(
                                                    context, selectedImage);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
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
                ),
                SizedBox(
                  height: 3.h,
                ),
                Center(
                  child: Text(
                    CacheHelper.getFullName(),
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Center(
                  child: Text(
                    CacheHelper.getPhone(),
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(
                        0xffA7A7A7,
                      ),
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
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppInput(
                        controller: cityNameController,
                        prefixIcon:
                            "assets/images/icons/appInputIcons/flag.svg",
                        labelText: "المدينة",
                        isEnabled: false,
                        onPress: () async {
                          var result = await showModalBottomSheet(
                            context: context,
                            useSafeArea: true,
                            builder: (context) => BlocBuilder(
                              bloc: citiesBloc,
                              builder: (context, state) {
                                if (state is GetCitiesLoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is GetCitiesSuccessState) {
                                  return Container(
                                    padding: EdgeInsetsDirectional.all(
                                      16.r,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const Center(
                                            child: Text(
                                              "اختار مدينتك",
                                            ),
                                          ),
                                          ...List.generate(
                                            state.list.length,
                                            (index) => GestureDetector(
                                              onTap: () {
                                                cityId = state.list[index].id;
                                                Navigator.pop(
                                                  context,
                                                  state.list[index].name,
                                                );
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsetsDirectional.only(
                                                  bottom: 16.h,
                                                ),
                                                width: double.infinity,
                                                padding:
                                                    EdgeInsetsDirectional.all(
                                                  16.r,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(
                                                        0.2,
                                                      ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    state.list[index].name,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: Text("فشل فى الاتصال"),
                                  );
                                }
                              },
                            ),
                          );
                          if (result != null) {
                            cityNameController.text = result;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    if (cityNameController.text.isNotEmpty)
                      IconButton(
                        onPressed: () {
                          cityNameController.clear();
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
                SizedBox(
                  height: 16.h,
                ),
                AppInput(
                  controller: passwordController,
                  labelText: "كلمة المرور",
                  prefixIcon: "assets/images/icons/appInputIcons/lock.svg",
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: SvgPicture.asset(
                    "assets/images/icons/arrow_left.svg",
                    fit: BoxFit.scaleDown,
                  ),
                  isEnabled: false,
                  onPress: ()
                  {
                    navigateTo(
                      const EditPassword(),
                    );
                  },
                  maxLines: 1,
                ),
                SizedBox(
                  height: 178.h,
                ),
                BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) {
                    return AppButton(
                      isLoading: state is EditProfileLoadingState,
                      onTap: () {
                        bloc.add(
                          UpdateUserDataEvent(
                            selectedImage,
                            nameController.text,
                            phoneNumberController.text,
                            cityId,
                          ),
                        );
                      },
                      text: "تعديل البيانات",
                      radius: 15.r,
                      width: 343.w,
                      height: 60.h,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
