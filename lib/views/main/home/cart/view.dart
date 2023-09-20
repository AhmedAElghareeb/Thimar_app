import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/main/home/cart/finish_order.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  final couponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "السلة",
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: [
            ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => _Item(),
              itemCount: 4,
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
            ),
            SizedBox(height: 12,),
            TextFormField(
              controller: couponController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "عندك كوبون ؟ ادخل رقم الكوبون",
                hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Color(
                    0xffB9C9A8,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  borderSide: BorderSide(
                    color: Color(
                      0xffffffff,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  borderSide: BorderSide(
                    color: Color(
                      0xffffffff,
                    ),
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 79,
                    height: 39,
                    margin: EdgeInsets.only(
                      left: 8,
                      top: 8,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "تطبيق",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(
                            0xffffffff,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "جميع الأسعار تشمل قيمة الضريبة المضافة 15 %",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              width: 342,
              height: 111,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  13,
                ),
                color: Color(
                  0xffF3F8EE,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "إجمالي المنتجات",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        "180 ر.س",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "الخصم",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        "-40 ر.س",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "المجموع",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        "140 ر.س",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 11,
            ),
            AppButton(
              onTap: () {
                navigateTo(
                  FinishOrder(),
                );
              },
              text: "الانتقال لإتمام الطلب",
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 94,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 17,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 6),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Image.network(
                  "https://avatars.mds.yandex.net/get-images-cbir/4829046/5bEDDWrMSh2Loudd_AKJ_g8001/ocr",
                  width: 92,
                  height: 78,
                ),
                SizedBox(
                  width: 9,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "طماطم",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "45 ر.س",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 72,
                      height: 27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(
                          0xff707070,
                        ).withOpacity(
                          0.2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.add,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              mini: true,
                              backgroundColor: Color(0xffFFFFFF),
                              elevation: 0.0,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  7,
                                ),
                                borderSide: BorderSide(
                                  color: Color(
                                    0xff707070,
                                  ).withOpacity(0.1),
                                ),
                              ),
                            ),
                            width: 23,
                            height: 23,
                          ),
                          Text(
                            "5",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.remove,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              mini: true,
                              backgroundColor: Color(0xffFFFFFF),
                              elevation: 0.0,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  7,
                                ),
                                borderSide: BorderSide(
                                  color: Color(
                                    0xff707070,
                                  ).withOpacity(0.1),
                                ),
                              ),
                            ),
                            width: 23,
                            height: 23,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            "assets/images/delete.svg",
            width: 27,
            height: 27,
            fit: BoxFit.scaleDown,
          ),
        ],
      ),
    );
  }
}
