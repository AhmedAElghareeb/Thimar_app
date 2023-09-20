import 'package:flutter/material.dart';
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
            horizontal: 17,
            vertical: 22,
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
                  height: 10,
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
                  height: 10,
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
                  height: 10,
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
                  height: 17,
                ),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
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
                        width: 343,
                        height: 60,
                        radius: 15,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
