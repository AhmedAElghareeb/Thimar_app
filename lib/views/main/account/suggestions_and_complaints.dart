import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/features/suggestions_and_complaints/bloc.dart';
import 'package:thimar_app/features/suggestions_and_complaints/events.dart';
import 'package:thimar_app/features/suggestions_and_complaints/states.dart';

class SugestionsAndComplaints extends StatefulWidget {
  const SugestionsAndComplaints({super.key});

  @override
  State<SugestionsAndComplaints> createState() =>
      _SugestionsAndComplaintsState();
}

class _SugestionsAndComplaintsState extends State<SugestionsAndComplaints> {
  final _formKey = GlobalKey<FormState>();

  final bloc = KiwiContainer().resolve<SuggestionsBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الشكاوى والإقتراحات"),
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
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 17.w,
              vertical: 22.h,
            ),
            children: [
              AppInput(
                controller: bloc.nameController,
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
                controller: bloc.phoneNumberController,
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
                controller: bloc.titleController,
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
                controller: bloc.subjectController,
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
                bloc: bloc,
                builder: (context, state) {
                  return AppButton(
                    isLoading: state is SuggestionsLoadingState,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        bloc.add(
                          SendSuggestionEvent()
                        );
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
        ),
      ),
    );
  }
}
