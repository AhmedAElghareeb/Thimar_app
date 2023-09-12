import 'package:flutter/material.dart';
import 'package:thimar_app/core/design/app_button.dart';



class GiveAdvice extends StatefulWidget {
  const GiveAdvice({super.key});

  @override
  State<GiveAdvice> createState() => _GiveAdviceState();
}

class _GiveAdviceState extends State<GiveAdvice> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الأقتراحات والشكاوي"
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 17,
            vertical: 22,
          ),
          child: Column(
            children: [
              Container(
                width: 341,
                height: 220,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(
                              0xff8B8B8B,
                            ),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(
                              0xffDCDCDC,
                            ),
                          ),
                        ),
                        hintText: "الإسم",
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF8B8B8B),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(
                              0xff8B8B8B,
                            ),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(
                              0xffDCDCDC,
                            ),
                          ),
                        ),
                        hintText: "رقم الموبايل",
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF8B8B8B),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: subjectController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(
                              0xff8B8B8B,
                            ),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(
                              0xffDCDCDC,
                            ),
                          ),
                        ),
                        hintText: "الموضوع",
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF8B8B8B),
                        ),
                      ),
                      minLines: 2,
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              AppButton(
                onTap: () {},
                text: "إرسال",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
