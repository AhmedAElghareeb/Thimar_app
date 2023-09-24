import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  void initState() {
    super.initState();
    getAboutData();
  }

  bool isLoading = true;
  var data;

  Future<void> getAboutData() async {
    final response = await DioHelper().getFromServer(
      url: "about",
    );
    print(response.response!.data);
    data = response.response!.data["data"]["about"];
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("عن التطبيق"),
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
            vertical: 26.h,
          ),
          children: [
            SvgPicture.asset(
              "assets/images/logo/logo1.svg",
              width: 160.w,
              height: 157.h,
            ),
            SizedBox(
              height: 25.h,
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Html(
                    data: data,
                  ),
          ],
        ),
      ),
    );
  }
}
