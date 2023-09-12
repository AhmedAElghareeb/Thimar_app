import 'package:flutter/material.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/main/home/home_view/category/category_products.dart';



class SectionsSlider extends StatelessWidget {
  const SectionsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: ListView(
        padding: const EdgeInsets.only(
          right: 4,
        ),
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: ()
            {
              navigateTo(CategoryProducts(nameCategory: "خضروات"),);
            },
            child: Column(
              children: [
                Image.network("https://www.hasanbabamanav.com/Files/bg-crm-program-8469-15-04-2021-12-53-37.png", width: 73, height: 73,),
                const Text(
                  "الخضار",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Tajawal",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 18,),
          Column(
            children: [
              Image.network("https://avatars.mds.yandex.net/i?id=f494bbf3b4b0f43ebd2d1cedeedcdfc500d39c6e-8348537-images-thumbs&n=13", width: 73, height: 73,),
              const Text(
                "الفواكه",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Tajawal",
                ),
              ),
            ],
          ),
          SizedBox(width: 18,),
          Column(
            children: [
              Image.network("https://avatars.mds.yandex.net/get-images-cbir/3105283/APCIRDoSbP2jWlapq9ZFpw7535/ocr", width: 73, height: 73,),
              const Text(
                "اللحوم",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Tajawal",
                ),
              ),
            ],
          ),
          SizedBox(width: 18,),
          Column(
            children: [
              Image.network("https://cdn0.iconfinder.com/data/icons/restaurant-53/64/Ketchup-ketchup_bottle-sauce-sauce_bottle-1024.png", width: 73, height: 73,),
              const Text(
                "البهارات",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Tajawal",
                ),
              ),
            ],
          ),
          SizedBox(width: 18,),
          Column(
            children: [
              Image.network("https://avatars.mds.yandex.net/get-images-cbir/3985439/JWTrR0WoVebJC87-HN3a9g7457/ocr", width: 73, height: 73,),
              const Text(
                "التمور",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Tajawal",
                ),
              ),
            ],
          ),
          SizedBox(width: 18,),
          Column(
            children: [
              Image.network("https://cdn4.iconfinder.com/data/icons/vegan-filloutline/64/almond-fruit-nut-organic-natural-1024.png", width: 73, height: 73,),
              const Text(
                "المكسرات",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Tajawal",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
