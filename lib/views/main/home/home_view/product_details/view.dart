import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 37,
              height: 20,
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
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    size: 22,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
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
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        children: [
          ImageSlideshow(
            width: double.infinity,
            height: 250,
            initialPage: 0,
            indicatorColor: const Color(0xFFFFFFFF),
            indicatorBackgroundColor: Color(
              0xffFFFFFF,
            ).withOpacity(
              0.3,
            ),
            indicatorRadius: 4,
            autoPlayInterval: 3000,
            isLoop: true,
            indicatorBottomPadding: 10,
            indicatorPadding: 3,
            children: [
              Image.network(
                "https://avatars.mds.yandex.net/get-images-cbir/485180/wfAh-eaV4ZAeHReHXY7Ugw6289/ocr",
              ),
              Image.network(
                "https://avatars.mds.yandex.net/get-images-cbir/485180/wfAh-eaV4ZAeHReHXY7Ugw6289/ocr",
              ),
              Image.network(
                "https://avatars.mds.yandex.net/get-images-cbir/485180/wfAh-eaV4ZAeHReHXY7Ugw6289/ocr",
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "طماطم",
                      style: TextStyle(
                        fontSize: 22,
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
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                        color: Color(
                          0xff9C9C9C,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        "40%",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Color(
                            0xffFF0000,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "45ر.س",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        "56ر.س",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Container(
                    width: 109,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                                8,
                              ),
                              borderSide: BorderSide(
                                color: Color(
                                  0xff707070,
                                ).withOpacity(0.1),
                              ),
                            ),
                          ),
                          width: 29,
                          height: 29,
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
                                8,
                              ),
                              borderSide: BorderSide(
                                color: Color(
                                  0xff707070,
                                ).withOpacity(0.1),
                              ),
                            ),
                          ),
                          width: 29,
                          height: 29,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12.5,
          ),
          Divider(
            color: Color(
              0xffF9F9F9,
            ),
          ),
          SizedBox(
            height: 14.5,
          ),
          Row(
            children: [
              Text(
                "كود المنتج",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                "56638",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w300,
                  color: Color(
                    0xff808080,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18.5,
          ),
          Divider(
            color: Color(
              0xffF9F9F9,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "تفاصيل المنتج",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. \n إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(
                    0xff757575,
                  ).withOpacity(
                    0.7,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "التقييمات",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "عرض الكل",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        right: 13,
                        top: 6,
                      ),
                      width: 267,
                      height: 87,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(
                          0xff707070,
                        ).withOpacity(0.008),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "محمد علي",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(
                                      0xffFF9529,
                                    ),
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(
                                      0xffFF9529,
                                    ),
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(
                                      0xffFF9529,
                                    ),
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(
                                      0xffFF9529,
                                    ),
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Color(
                                      0xffD5D5D5,
                                    ),
                                    size: 18,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "هذا النص هو مثال لنص يمكن أن \n يستبدل في نفس المساحة ، لقد تم \n توليد هذا النص من مولد النص \n العربى، حيث يمكنك أن تولد مثل هذا \n النص أو العديد من النصوص الأخرى \n إضافة إلى زيادة عدد الحروف التى \n يولدها التطبيق",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Image.network(
                            "https://avatars.mds.yandex.net/get-images-cbir/2400088/FrGoj_yhpuzd8oEjn6-SaQ1398/ocr",
                            width: 55,
                            height: 55,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 13,
                        top: 6,
                      ),
                      width: 267,
                      height: 87,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(
                          0xff707070,
                        ).withOpacity(0.008),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "محمد علي",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(
                                      0xffFF9529,
                                    ),
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(
                                      0xffFF9529,
                                    ),
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(
                                      0xffFF9529,
                                    ),
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(
                                      0xffFF9529,
                                    ),
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Color(
                                      0xffD5D5D5,
                                    ),
                                    size: 18,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "هذا النص هو مثال لنص يمكن أن \n يستبدل في نفس المساحة ، لقد تم \n توليد هذا النص من مولد النص \n العربى، حيث يمكنك أن تولد مثل هذا \n النص أو العديد من النصوص الأخرى \n إضافة إلى زيادة عدد الحروف التى \n يولدها التطبيق",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Image.network(
                            "https://avatars.mds.yandex.net/get-images-cbir/2400088/FrGoj_yhpuzd8oEjn6-SaQ1398/ocr",
                            width: 55,
                            height: 55,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "منتجات مشابهة",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              SizedBox(
                width: double.infinity,
                height: 175,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 172,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Color(
                          0xffffffff,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
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
                              top: 9,
                              left: 9,
                              right: 9,
                            ),
                            child: Stack(
                              children: [
                                Image.network(
                                  "https://avatars.mds.yandex.net/get-images-cbir/769682/5bEDDWrMSh2Loudd_AKJ_g2371/ocr",
                                  width: 116,
                                  height: 94,
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 2),
                                    child: Container(
                                      width: 43,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(25),
                                          topLeft: Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "45%-",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Color(
                                              0xffFFFFFF,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 9,
                              ),
                              child: Text(
                                "طماطم",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 10,
                              ),
                              child: Text(
                                "السعر / 1كجم",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(
                                    0xFF808080,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 9,
                                  ),
                                  child: Text(
                                    "45 ر.س",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "56 ر.س",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 13,
                                  ),
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        6,
                                      ),
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.8),
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add_rounded,
                                        color: Color(0xFFFFFFFF),
                                        size: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 172,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Color(
                          0xffffffff,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
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
                              top: 9,
                              left: 9,
                              right: 9,
                            ),
                            child: Stack(
                              children: [
                                Image.network(
                                  "https://avatars.mds.yandex.net/get-images-cbir/61254/FU9v-KTGu8YWnzL0LrSJNA3147/ocr",
                                  width: 116,
                                  height: 94,
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 2),
                                    child: Container(
                                      width: 43,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(25),
                                          topLeft: Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "45%-",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Color(
                                              0xffFFFFFF,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 9,
                              ),
                              child: Text(
                                "جزر",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 10,
                              ),
                              child: Text(
                                "السعر / 1كجم",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(
                                    0xFF808080,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 9,
                                  ),
                                  child: Text(
                                    "48 ر.س",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "56 ر.س",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 13,
                                  ),
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        6,
                                      ),
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.8),
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add_rounded,
                                        color: Color(0xFFFFFFFF),
                                        size: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 172,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Color(
                          0xffffffff,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
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
                              top: 9,
                              left: 9,
                              right: 9,
                            ),
                            child: Stack(
                              children: [
                                Image.network(
                                  "https://elmina.club/uploads/posts/2023-05/1684227809_elmina-club-p-arbuz-belii-fon-foni-instagram-85.jpg",
                                  width: 116,
                                  height: 94,
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 2),
                                    child: Container(
                                      width: 43,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(25),
                                          topLeft: Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "45%-",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Color(
                                              0xffFFFFFF,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 9,
                              ),
                              child: Text(
                                "بطيخ",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 10,
                              ),
                              child: Text(
                                "السعر / 1كجم",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(
                                    0xFF808080,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 9,
                                  ),
                                  child: Text(
                                    "45 ر.س",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "56 ر.س",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 13,
                                  ),
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        6,
                                      ),
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.8),
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add_rounded,
                                        color: Color(0xFFFFFFFF),
                                        size: 13,
                                      ),
                                    ),
                                  ),
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
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(
                      16,
                    ),
                    width: 35,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: Colors.grey.withOpacity(
                        0.5,
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/icons/cart2.svg",
                      width: 19,
                      height: 20,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: (){},
                    child: Text(
                      "إضافة إلي السلة",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "225 ر.س",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFFFFF,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
