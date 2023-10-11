import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/features/contact_us/states.dart';
import '../../../features/contact_us/bloc.dart';
import '../../../features/contact_us/events.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();

  final getContact = KiwiContainer().resolve<ContactUsBloc>()..add(GetContactDataEvent(),);
  final sendContact = KiwiContainer().resolve<ContactUsBloc>();

  @override
  void dispose() {
    super.dispose();
    getContact.close();
    sendContact.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("تواصل معنا"),
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
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.w,
            vertical: 20.h,
          ),
          child: ListView(
            children: [
              BlocBuilder(
                bloc: getContact,
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
                            margin: EdgeInsetsDirectional.only(
                              top: 170.h,
                            ),
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
                                  padding: EdgeInsetsDirectional.symmetric(
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
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Theme.of(context).primaryColor
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
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
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Theme.of(context).primaryColor
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
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
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Theme.of(context).primaryColor
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
                      color: Theme.of(context).primaryColor
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              BlocBuilder(
                bloc: sendContact,
                builder: (context, state2) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AppInput(
                          controller: sendContact.nameController,
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
                          controller: sendContact.phoneNumberController,
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
                          controller: sendContact.subjectController,
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
                              sendContact.add(SendContactDataEvent(),);
                            }
                          },
                          text: "إرسال",
                          width: 343.w,
                          height: 54.h,
                          radius: 15.r,
                          isLoading: state2 is SendContactLoadingState,
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
    );
  }
}
