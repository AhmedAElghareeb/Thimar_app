import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  void initState() {
    super.initState();
    getTermsData();
  }

  bool isLoading = true;
  var data;

  Future<void> getTermsData() async {
    final response = await DioHelper().getFromServer(
      url: "terms",
    );
    print(response.response!.data);
    data = response.response!.data["data"]["terms"];
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الشروط والأحكام",
        ),
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
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 14,
          ),
          children: [
            isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
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
