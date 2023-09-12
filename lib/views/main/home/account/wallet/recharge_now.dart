import 'package:flutter/material.dart';
import 'package:thimar_app/core/design/app_button.dart';





class RechargeNow extends StatefulWidget {
  const RechargeNow({super.key});

  @override
  State<RechargeNow> createState() => _RechargeNowState();
}

class _RechargeNowState extends State<RechargeNow> {
  final amountInfo = TextEditingController();
  final nameOfCard = TextEditingController();
  final numOfCard = TextEditingController();
  final cardExpireDate = TextEditingController();
  final serialNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "شحن الان",
        ),
        leading: Center(
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                9,
              ),
              color: Theme.of(context).primaryColor.withOpacity(
                    0.13,
                  ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 7
              ),
              child: Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(
            right: 16,
            top: 63,
            left: 16,
          ),
          children: [
            Text(
              "معلومات المبلغ",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 22,
            ),
            TextFormField(
              controller: amountInfo,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    borderSide: BorderSide(
                      color: Color(
                        0xff8AC253,
                      ).withOpacity(0.19),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(
                        0xffF3F3F3,
                      ),
                    ),
                  ),
                  filled: true,
                  labelText: "المبلغ الخاص بك",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(
                      0xffAFAFAF,
                    ),
                  )),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "معلومات البطاقة",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 22,
            ),
            TextFormField(
              controller: nameOfCard,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    borderSide: BorderSide(
                      color: Color(
                        0xff8AC253,
                      ).withOpacity(0.19),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(
                        0xffF3F3F3,
                      ),
                    ),
                  ),
                  filled: true,
                  labelText: "الاسم",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(
                      0xffAFAFAF,
                    ),
                  )),
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: numOfCard,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  borderSide: BorderSide(
                    color: Color(
                      0xff8AC253,
                    ).withOpacity(0.19),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(
                      0xffF3F3F3,
                    ),
                  ),
                ),
                filled: true,
                labelText: "رقم البطاقة الائتمانية",
                labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(
                    0xffAFAFAF,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: TextFormField(
                    controller: cardExpireDate,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(
                            0xffF3F3F3,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color(
                            0xffF3F3F3,
                          ),
                        ),
                      ),
                      filled: true,
                      labelText: "تاريخ الانتهاء",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(
                          0xffAFAFAF,
                        ),
                      ),
                    ),
                  ),
                  width: 150,
                ),
                SizedBox(
                  child: TextFormField(
                    controller: serialNum,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(
                            0xffF3F3F3,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color(
                            0xffF3F3F3,
                          ),
                        ),
                      ),
                      filled: true,
                      hintText: "الرقم المتسلسل",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(
                          0xffAFAFAF,
                        ),
                      ),
                    ),
                  ),
                  width: 150,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            AppButton(
              onTap: () {},
              text: "دفع",
            ),
          ],
        ),
      ),
    );
  }
}
