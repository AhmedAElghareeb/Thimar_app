import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/dot_button.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/main/home/account/address/add_address.dart';




class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 28,
          ),
          child: Column(
            children: [
              Row(
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
                    width: 95,
                  ),
                  Text(
                    "العناوين",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 42,
              ),
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => _Item(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
                itemCount: 4,
              ),
              SizedBox(
                height: 20,
              ),
              DotButton(
                text: "إضافة عنوان",
                onTap: () {
                  navigateTo(
                    AddAddress(),
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

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(
          0xffffffff,
        ),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                ),
                child: Text(
                  "المنزل",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 208,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(
                  "assets/images/icons/addressIcons/delete.svg",
                  width: 24,
                  height: 24,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(
                  "assets/images/icons/addressIcons/edit.svg",
                  width: 24,
                  height: 24,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              "العنوان : 119 طريق الملك عبدالعزيز",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              "الوصف",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Color(
                  0xff999797,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              "رقم الجوال",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Color(
                  0xff999797,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
