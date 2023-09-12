import 'package:flutter/material.dart';
import 'package:thimar_app/core/design/app_button.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  final phoneNumber = TextEditingController();
  final discribtion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 28,
                ),
                child: Row(
                  children: [
                    GestureDetector(
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
                    SizedBox(
                      width: 85,
                    ),
                    Text(
                      "إضافة عنوان",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Image.network(
                      "https://avatars.mds.yandex.net/get-images-cbir/58850/6uoKV1t_su-MpnNUMnTUmA6265/ocr",
                      width: 375,
                      height: 550,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 110,
                        top: 87,
                        right: 215,
                      ),
                      child: Image.network(
                        "https://www.360-ticketing.com/img/pin1.png",
                        width: 29,
                        height: 46,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 285,
                        right: 5,
                      ),
                      child: Container(
                        width: 350,
                        height: 350,
                        margin: EdgeInsets.symmetric(horizontal: 16,),
                        padding: EdgeInsets.symmetric(horizontal: 16,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Color(
                            0xffFFFFFF,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Container(
                                width: 300,
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Color(
                                    0xffFFFFFF,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.1,
                                      color: Color(
                                        0xffeeeeee,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 12,
                                    left: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "نوع العنوان",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                          color: Color(
                                            0xff8B8B8B,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Container(
                                        width: 72,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "المنزل",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15,
                                              color: Color(
                                                0xffFFFFFF,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Container(
                                        width: 72,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          color: Color(
                                            0xffffffff,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.2,
                                              color: Color(
                                                0xff9b9b9b,
                                              ),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            "العمل",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15,
                                              color: Color(
                                                0xff8B8B8B,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 14,),
                            TextFormField(
                              controller: phoneNumber,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(
                                    color: Color(
                                      0xff8B8B8B,
                                    ),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(
                                    color: Color(
                                      0xffDCDCDC,
                                    ),
                                  ),
                                ),
                                hintText: "أدخل رقم الجوال",
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF8B8B8B),
                                ),
                              ),
                            ),
                            SizedBox(height: 14,),
                            TextFormField(
                              controller: discribtion,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(
                                    color: Color(
                                      0xff8B8B8B,
                                    ),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(
                                    color: Color(
                                      0xffDCDCDC,
                                    ),
                                  ),
                                ),
                                hintText: "الوصف",
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF8B8B8B),
                                ),
                              ),
                              minLines: 2,
                              maxLines: 5,
                            ),
                            SizedBox(
                              height: 49,
                            ),
                            AppButton(
                              onTap: () {},
                              text: "إضافة العنوان",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
