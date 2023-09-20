import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';

class PolicyView extends StatefulWidget {
  const PolicyView({super.key});

  @override
  State<PolicyView> createState() => _PolicyViewState();
}

class _PolicyViewState extends State<PolicyView> {
  void initState() {
    super.initState();
    getPolicyData();
  }

  bool isLoading = true;
  var data;

  Future<void> getPolicyData() async {
    final response = await DioHelper().getFromServer(
      url: "policy",
    );
    print(response.response!.data);
    data = response.response!.data["data"]["policy"];
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "سياسة الخصوصية",
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
            horizontal: 16,
            vertical: 45,
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
