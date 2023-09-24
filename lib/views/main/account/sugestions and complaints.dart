import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';

class SugestionsAndComplaints extends StatefulWidget {
  const SugestionsAndComplaints({super.key});

  @override
  State<SugestionsAndComplaints> createState() =>
      _SugestionsAndComplaintsState();
}

class _SugestionsAndComplaintsState extends State<SugestionsAndComplaints> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final subjectController = TextEditingController();
  final titleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الأقتراحات والشكاوي"),
        leading: Padding(
          padding: EdgeInsets.all(10.w.h),
          child: GestureDetector(
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                color: Color(
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 17.w,
            vertical: 22.h,
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                AppInput(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  labelText: "الإسم",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppInput(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  labelText: "رقم الموبايل",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppInput(
                  controller: titleController,
                  labelText: "عنوان الموضوع",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppInput(
                  controller: subjectController,
                  labelText: "الموضوع",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                  minLines: 5,
                  maxLines: 7,
                ),
                SizedBox(
                  height: 17.h,
                ),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : AppButton(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            final response = await DioHelper().sendToServer(
                              url: "contact",
                              body: {
                                "fullname": nameController.text,
                                "phone": phoneNumberController.text,
                                "title": titleController.text,
                                "content": subjectController.text,
                              },
                            );
                            showSnackBar(
                              response.msg,
                              typ: MessageType.success,
                            );
                          }
                          nameController.clear();
                          phoneNumberController.clear();
                          titleController.clear();
                          subjectController.clear();
                          isLoading = false;
                          setState(() {});
                        },
                        text: "إرسال",
                        width: 343.w,
                        height: 60.h,
                        radius: 15.r,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
