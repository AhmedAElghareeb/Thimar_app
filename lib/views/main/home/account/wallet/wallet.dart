import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/dot_button.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/main/home/account/wallet/all_transactions.dart';
import 'package:thimar_app/views/main/home/account/wallet/recharge_now.dart';


class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المحفظة"
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
            horizontal: 13,
            vertical: 28,
          ),
          child: ListView(
            children: [
              Container(
                width: 343,
                height: 168,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Color(
                    0xffffffff,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(
                        0xfff6f6f6,
                      ),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "رصيدك",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "225 ر.س",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              DotButton(
                text: "اشحن الآن",
                onTap: () {
                  navigateTo(
                    RechargeNow(),
                  );
                },
              ),
              SizedBox(
                height: 59,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "سجل المعاملات",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateTo(
                        AllTransactions(),
                      );
                    },
                    child: Text(
                      "عرض الكل",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                width: 343,
                height: 83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Color(
                    0xffffffff,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(
                        0xfff6f6f6,
                      ),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            "assets/images/icons/walletIcons/incoming.svg",
                            width: 18,
                            height: 18,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          "شحن المحفظة",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 113,
                        ),
                        Text(
                          "27,فبراير,2021",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Color(
                              0xff9C9C9C,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40, left: 200),
                      child: Text(
                        "255 ر.س",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 343,
                height: 83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Color(
                    0xffffffff,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(
                        0xfff6f6f6,
                      ),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            "assets/images/icons/walletIcons/incoming.svg",
                            width: 18,
                            height: 18,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          "شحن المحفظة",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 113,
                        ),
                        Text(
                          "27,فبراير,2021",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Color(
                              0xff9C9C9C,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40, left: 200),
                      child: Text(
                        "255 ر.س",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 343,
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Color(
                    0xffffffff,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(
                        0xfff6f6f6,
                      ),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            "assets/images/icons/walletIcons/paidTo.svg",
                            width: 18,
                            height: 18,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          "دفعت مقابل هذا الطلب",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 63,
                        ),
                        Text(
                          "27,فبراير,2021",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Color(
                              0xff9C9C9C,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 320,
                      height: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Color(
                          0xffffffff,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(
                              0xfff6f6f6,
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 7,
                              right: 13,
                            ),
                            child: Text(
                              "طلب #4587",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(
                                  "https://w7.pngwing.com/pngs/943/709/png-transparent-tomato-juice-cherry-tomato-tuna-salad-grape-tomato-vegetable-tomato-natural-foods-food-tomato.png",
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(
                                  "https://avatars.mds.yandex.net/get-images-cbir/1723159/CstLegUAebOlAuDtgAlrZg3501/ocr",
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(
                                  "https://avatars.mds.yandex.net/i?id=8a140914a6e6c57a4af0d22faa344a96-5239583-images-thumbs&n=13",
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color(
                                    0xffEDF5E6,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "2+",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 105,
                              ),
                              Text(
                                "180 ر.س",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
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
