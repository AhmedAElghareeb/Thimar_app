import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/dot_button.dart';



class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final paymentOwnerName = TextEditingController();
  final paymentNumber = TextEditingController();
  final paymentExpiredDate = TextEditingController();
  final paymentCvvNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الدفع"),
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 23,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    "https://avatars.mds.yandex.net/get-images-cbir/9068028/qD3QzsbQPPBM-yV7lJclDw2229/ocr",
                    width: 342,
                    height: 152,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 22,
                      right: 245,
                      top: 25,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/visa.svg",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 22,
                      right: 238,
                      top: 68,
                    ),
                    child: Text(
                      "Mohamed ali",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 215,
                      top: 112,
                    ),
                    child: Text(
                      "0197  ****  ****  ****",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 25,
                      top: 109,
                    ),
                    child: Text(
                      "VALID DATE",
                      style: TextStyle(
                        fontSize: 5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 22,
                      top: 115,
                    ),
                    child: Text(
                      "06/22",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Stack(
                children: [
                  Image.network(
                    "https://avatars.mds.yandex.net/get-images-cbir/9068028/qD3QzsbQPPBM-yV7lJclDw2229/ocr",
                    width: 342,
                    height: 152,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 274,
                      top: 15,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/master.svg",
                      width: 44,
                      height: 34,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 22,
                      right: 239,
                      top: 68,
                    ),
                    child: Text(
                      "Mohamed ali",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 215,
                      top: 112,
                    ),
                    child: Text(
                      "0197  ****  ****  ****",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 25,
                      top: 109,
                    ),
                    child: Text(
                      "VALID DATE",
                      style: TextStyle(
                        fontSize: 5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 22,
                      top: 115,
                    ),
                    child: Text(
                      "06/22",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              DotButton(
                text: "إضافة بطاقة",
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 600,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 16,
                            left: 16,
                          ),
                          child: ListView(
                            padding: EdgeInsets.only(
                              top: 15,
                            ),
                            children: [
                              Center(
                                child: Text(
                                  "إضافة بطاقة",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              SizedBox(
                                height: 21,
                              ),
                              TextFormField(
                                controller: paymentOwnerName,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xffDCDCDC,
                                        ),
                                      )),
                                  hintText: "اسم صاحب البطاقة",
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Color(
                                      0xff8B8B8B,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: paymentNumber,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xffDCDCDC,
                                        ),
                                      )),
                                  hintText: "رقم البطاقة",
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Color(
                                      0xff8B8B8B,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: TextFormField(
                                      controller: paymentExpiredDate,
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            borderSide: BorderSide(
                                              color: Color(
                                                0xffDCDCDC,
                                              ),
                                            )),
                                        hintText: "تاريخ الإنتهاء (شهر / سنة)",
                                        hintStyle: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color: Color(
                                            0xff8B8B8B,
                                          ),
                                        ),
                                      ),
                                    ),
                                    width: 150,
                                  ),
                                  SizedBox(
                                    child: TextFormField(
                                      controller: paymentCvvNumber,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            borderSide: BorderSide(
                                              color: Color(
                                                0xffDCDCDC,
                                              ),
                                            )),
                                        hintText: "الرقم السري (Cvv)",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                          color: Color(
                                            0xff8B8B8B,
                                          ),
                                        ),
                                      ),
                                    ),
                                    width: 150,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              AppButton(
                                onTap: () {},
                                text: "إضافة بطاقة",
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          38,
                        ),
                        topLeft: Radius.circular(
                          38,
                        ),
                      ),
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
