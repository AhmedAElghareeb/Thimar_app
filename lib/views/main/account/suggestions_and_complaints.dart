import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/features/suggestions_and_complaints/cubit.dart';
import 'package:thimar_app/features/suggestions_and_complaints/states.dart';

class SugestionsAndComplaints extends StatefulWidget {
  const SugestionsAndComplaints({super.key});

  @override
  State<SugestionsAndComplaints> createState() =>
      _SugestionsAndComplaintsState();
}

class _SugestionsAndComplaintsState extends State<SugestionsAndComplaints> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الأقتراحات والشكاوي"),
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
                  color: Theme
                      .of(context)
                      .primaryColor,
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
        child: BlocProvider(
          create: (context) => SuggestionsCubit(),
          child: Builder(
            builder: (context) {
              SuggestionsCubit cubit = BlocProvider.of(context);
              return Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 17.w,
                    vertical: 22.h,
                  ),
                  children: [
                    AppInput(
                      controller: cubit.nameController,
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
                      controller: cubit.phoneNumberController,
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
                      controller: cubit.titleController,
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
                      controller: cubit.subjectController,
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
                    BlocBuilder(
                      bloc: cubit,
                      builder: (context, state) {
                        return AppButton(
                          isLoading: state is SuggestionsLoadingState,
                          onTap: () async {
                            if(_formKey.currentState!.validate()) {
                              cubit.sendSuggestions();
                            }
                          },
                          text: "إرسال",
                          width: 343.w,
                          height: 60.h,
                          radius: 15.r,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
