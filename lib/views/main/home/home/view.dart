import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/category_cubit/cubit.dart';
import 'package:thimar_app/features/category_cubit/states.dart';
import 'package:thimar_app/features/category_products_cubit/cubit.dart';
import 'package:thimar_app/features/category_products_cubit/states.dart';
import 'package:thimar_app/views/main/home/category/view.dart';
import 'package:thimar_app/views/main/home/product_details/view.dart';
import 'package:thimar_app/models/slider_model.dart';

class HomeScreen extends StatefulWidget {
  final int? id;
  HomeScreen({super.key, this.id});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getSliderImages();
  }

  bool isLoading = true;

  late SlidersModel model;

  void getSliderImages() async {
    final response = await Dio().get(
      "https://thimar.amr.aait-d.com/public/api/sliders",
    );
    model = SlidersModel.fromJson(
      response.data,
    );
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    CategoryProductsCubit cubit = BlocProvider.of(context);
    cubit.getCategoryProducts();
    return Scaffold(
      appBar: MainAppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 15,
              ),
              child: AppInput(
                controller: searchController,
                keyboardType: TextInputType.text,
                isFilled: true,
                labelText: "ابحث عن ما تريد؟",
                prefixIcon: "assets/images/icons/Search.svg",
              ),
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : StatefulBuilder(
                    builder: (context, setState) => Column(
                      children: [
                        CarouselSlider(
                          items: List.generate(
                            model.data.length,
                            (index) => Image.network(
                              model.data[index].media,
                              height: 164,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          options: CarouselOptions(
                            height: 164,
                            autoPlay: true,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              currentIndex = index;
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            model.data.length,
                            (index) => Padding(
                              padding: const EdgeInsetsDirectional.only(
                                end: 3,
                              ),
                              child: CircleAvatar(
                                radius: currentIndex == index ? 4 : 2,
                                backgroundColor: currentIndex == index
                                    ? Theme.of(context).primaryColor
                                    : Color(0xff707070),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            const SizedBox(
              height: 29,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
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
            ),
            const SizedBox(
              height: 18,
            ),
            const SectionsSlider(),
            const SizedBox(
              height: 27.9,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                "الأصناف",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                print(state.runtimeType.toString());
                if (state is CategoryProductsFailedStates) {
                  return Center(
                    child: Text("FAILED.."),
                  );
                } else if (state is CategoryProductsSuccessStates) {
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    itemCount: state.list.length,
                    itemBuilder: (context, index) => Container(
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
                              right: 9,
                            ),
                            child: Stack(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    child: Image.network(
                                      state.list[index].mainImage,
                                      fit: BoxFit.cover,
                                      width: 145,
                                      height: 117,
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11)
                                    ),
                                  ),
                                  onTap: () {
                                    navigateTo(
                                      ProductDetails(
                                        id: state.list[index].id,
                                      ),
                                    );
                                  },
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: Container(
                                    width: 54,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(25),
                                        topLeft: Radius.circular(11),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${state.list[index].discount * 100} %",
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
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                state.list[index].title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                state.list[index].unit.name,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF808080),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 1,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        "${state.list[index].price} ر.س",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "${state.list[index].priceBeforeDiscount} ر.س",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Theme.of(context).primaryColor,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Color(0xff61B80C,),
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        navigateTo(
                                          ProductDetails(
                                            id: state.list[index].id,
                                          ),
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
                              ],
                            ),
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
                              child: AppButton(
                                onTap: (){},
                                text: "أضف للسلة",
                                width: double.infinity,
                                height: 30,
                                radius: 9,
                                backColor: Color(0xff61B80C,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 11,
                      mainAxisSpacing: 11,
                      childAspectRatio: 0.55,
                    ),
                    shrinkWrap: true,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/images/logo/logo1.svg",
              width: 21,
              height: 21,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              "سلة ثمار",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "التوصيل إلى",
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                  children: [
                    TextSpan(
                      text: "\n",
                    ),
                    TextSpan(
                      text: "شارع الملك فهد - جدة",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Badge(
              alignment: AlignmentDirectional.topStart,
              padding: EdgeInsets.all(5),
              label: Center(
                child: Text(
                  "3",
                  style: TextStyle(
                    fontSize: 6,
                    fontWeight: FontWeight.bold,
                    color: Color(
                      0xffFFFFFF,
                    ),
                  ),
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              child: Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.13),
                  borderRadius: BorderRadius.circular(
                    9,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset("assets/images/icons/cart.svg"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class SectionsSlider extends StatefulWidget {
  const SectionsSlider({super.key});

  @override
  State<SectionsSlider> createState() => _SectionsSliderState();
}

class _SectionsSliderState extends State<SectionsSlider> {
  @override
  Widget build(BuildContext context) {
    CategoryCubit cubit = BlocProvider.of(context);
    cubit.getCategories();
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is CategoryFailedState) {
            return Center(
              child: Text("Failed"),
            );
          } else if (state is CategorySuccessState) {
            var model = state.list;
            return ListView.builder(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 16
              ),
              scrollDirection: Axis.horizontal,
              itemCount: model.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  navigateTo(
                    CategoryProducts(
                      nameCategory: "${model[index].name}",
                      id: model[index].id,
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      child: Image.network(
                        model[index].media,
                        width: 73,
                        height: 73,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                    ),
                    SizedBox(
                      height: .7,
                    ),
                    Text(
                      model[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
