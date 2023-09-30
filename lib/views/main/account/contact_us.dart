import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/features/contact_us/cubit.dart';
import 'package:thimar_app/features/contact_us/states.dart';

import '../../../features/create_contact/cubit.dart';
import '../../../features/create_contact/states.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("تواصل معنا"),
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
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ContactUsCubit()..getContact(),
          ),
          BlocProvider(
            create: (context) => CreateContactCubit()..sendContact(),
          ),
        ],
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 20.h,
            ),
            child: ListView(
              children: [
                BlocBuilder<ContactUsCubit, ContactUsStates>(
                  builder: (context, state1) {
                    if (state1 is GetContactLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state1 is GetContactSuccessState) {
                      return Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 198.h,
                            child: GoogleMap(
                              initialCameraPosition: const CameraPosition(
                                  target: LatLng(
                                    24.6,
                                    46.7423174,
                                  ),
                                  zoom: 14),
                              markers: {
                                const Marker(
                                  markerId: MarkerId("2"),
                                  position: LatLng(
                                    24.6,
                                    46.7423174,
                                  ),
                                ),
                              },
                            ),
                          ),
                          Center(
                            child: Container(
                              width: 312.w,
                              height: 119.h,
                              margin: EdgeInsets.only(top: 170.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    15.r,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 15.r,
                                        color:
                                            const Color(0xff000000).withOpacity(
                                          0.02,
                                        ),
                                        offset: Offset(0.w, 10.h))
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 10.h,
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/icons/addressIcons/Location.svg"),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text(
                                          state1.model.location,
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 10.h,
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/icons/addressIcons/Calling.svg"),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text(
                                          state1.model.phone,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 10.h,
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/icons/addressIcons/Message.svg"),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text(
                                          state1.model.email,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text("Failed"),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    "أو يمكنك إرسال رسالة ",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                BlocBuilder<CreateContactCubit, CreateContactStates>(
                  builder: (context, state2) {
                    CreateContactCubit cubit = BlocProvider.of(context);
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppInput(
                            controller: cubit.nameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "هذا الحقل مطلوب";
                              }
                              return null;
                            },
                            labelText: "الإسم",
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AppInput(
                            controller: cubit.phoneNumberController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "هذا الحقل مطلوب";
                              }
                              return null;
                            },
                            labelText: "رقم الموبايل",
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AppInput(
                            controller: cubit.subjectController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "هذا الحقل مطلوب";
                              }
                              return null;
                            },
                            labelText: "الموضوع",
                            minLines: 3,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AppButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.sendContact();
                              }
                            },
                            text: "إرسال",
                            width: 343.w,
                            height: 54.h,
                            radius: 15.r,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
