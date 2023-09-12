import 'package:flutter/material.dart';
import 'package:thimar_app/core/design/app_button.dart';



class RateProducts extends StatelessWidget {
  const RateProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تقييم المنتجات",
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
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 41,
        ),
        children: [
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => _Item(),
            itemCount: 2,
            separatorBuilder: (context, index) => SizedBox(
              height: 16,
            ),
          ),
          SizedBox(height: 16,),
          AppButton(
            onTap: () {},
            text: "تقييم",
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final productComment = TextEditingController();

  _Item();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      width: 343,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(
          0xffffffff,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Color(
              0xfff5f5f5,
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: Row(
              children: [
                Image.network(
                  "https://www.seeds-gallery.com/2330-large_default/moneymaker-tomato-seeds.jpg",
                  width: 75,
                  height: 64,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "طماطم",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "السعر / 1كجم",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Color(
                          0xff808080,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "45 ر.س",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "56 ر.س",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Color(0xffFF9529),
              ),
              Icon(
                Icons.star,
                color: Color(0xffFF9529),
              ),
              Icon(
                Icons.star,
                color: Color(0xffFF9529),
              ),
              Icon(
                Icons.star,
                color: Color(0xffFF9529),
              ),
              Icon(
                Icons.star_border,
                color: Color(
                  0xffD5D5D5,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 11,
            ),
            child: TextFormField(
              controller: productComment,
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
                hintText: "تعليق المنتج",
                hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF9C9C9C),
                ),
              ),
              minLines: 2,
              maxLines: 10,
            ),
          ),
        ],
      ),
    );
  }
}
