import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/bottom_home_navbar.dart';
import 'package:thimar_app/core/design/image_slider.dart';
import 'package:thimar_app/core/design/sections_slider.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/main/home/home_view/cart/view.dart';
import 'package:thimar_app/views/main/home/home_view/view/home_product_model.dart';
import 'package:thimar_app/views/main/home/home_view/product_details/view.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  List<HomeProductModel> list = [
    HomeProductModel(
      image:
          "https://w7.pngwing.com/pngs/943/709/png-transparent-tomato-juice-cherry-tomato-tuna-salad-grape-tomato-vegetable-tomato-natural-foods-food-tomato.png",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceBefore: "45ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    HomeProductModel(
      image:
          "https://w7.pngwing.com/pngs/943/709/png-transparent-tomato-juice-cherry-tomato-tuna-salad-grape-tomato-vegetable-tomato-natural-foods-food-tomato.png",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceBefore: "45ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    HomeProductModel(
      image:
          "https://w7.pngwing.com/pngs/943/709/png-transparent-tomato-juice-cherry-tomato-tuna-salad-grape-tomato-vegetable-tomato-natural-foods-food-tomato.png",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceBefore: "45ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    HomeProductModel(
      image:
          "https://w7.pngwing.com/pngs/943/709/png-transparent-tomato-juice-cherry-tomato-tuna-salad-grape-tomato-vegetable-tomato-natural-foods-food-tomato.png",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceBefore: "45ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    HomeProductModel(
      image:
          "https://w7.pngwing.com/pngs/943/709/png-transparent-tomato-juice-cherry-tomato-tuna-salad-grape-tomato-vegetable-tomato-natural-foods-food-tomato.png",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceBefore: "45ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = true;

  getData() async {
    await Future.delayed(Duration(seconds: 3));
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0.0,
        title: Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/logo/logo1.svg",
                  width: 25,
                  height: 25,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "سلة ثمار",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              children: [
                Text(
                  "التوصيل إلى",
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  "شارع الملك فهد - جدة",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              left: 17,
              top: 17,
            ),
            child: Container(
              width: 37,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Color(
                  0xff707070,
                ).withOpacity(0.1),
              ),
              child: IconButton(
                onPressed: () {
                  navigateTo(
                    Cart(),
                  );
                },
                icon: SvgPicture.asset(
                  "assets/images/icons/cart.svg",
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 25,
                ),
                children: [
                  AppInput(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    isFilled: true,
                    labelText: "ابحث عن ما تريد؟",
                    prefixIcon: "assets/images/icons/Search.svg",
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const ImageSliderShow(),
                  const SizedBox(
                    height: 29,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "الأقسام",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "عرض الكل",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const SectionsSlider(),
                  const SizedBox(
                    height: 27.9,
                  ),
                  Row(
                    children: const [
                      Text(
                        "الأصناف",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) => _Item(
                      model: list[index],
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 11,
                      mainAxisSpacing: 11,
                      childAspectRatio: 0.58,
                    ),
                    shrinkWrap: true,
                  ),
                ],
              ),
            ),
      bottomNavigationBar: HomeNavBar(),
    );
  }
}

class _Item extends StatelessWidget {
  final HomeProductModel model;

  const _Item({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 163,
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
              right: 15,
            ),
            child: Stack(
              children: [
                GestureDetector(
                  child: Image.network(
                    model.image,
                    width: 146,
                    height: 117,
                  ),
                  onTap: () {
                    navigateTo(
                      ProductDetails(),
                    );
                  },
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 5, top: 1),
                    child: Container(
                      width: 54,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          model.discount,
                          style: TextStyle(
                            fontSize: 14,
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
          Align(
            alignment: Alignment.topRight,
            child: Text(
              model.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              model.body,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF808080),
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
                child: Text(
                  model.priceBefore,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Text(
                    model.priceAfter,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 13,
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
                    right: 30,
                  ),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        navigateTo(
                          ProductDetails(),
                        );
                      },
                      icon: const Icon(
                        Icons.add_rounded,
                        color: Color(0xFFFFFFFF),
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 19,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 10,
              ),
              child: Container(
                width: 115,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    "أضف للسلة",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
