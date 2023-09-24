import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/category_cubit/cubit.dart';
import 'package:thimar_app/features/category_cubit/states.dart';
import 'package:thimar_app/features/category_products_cubit/cubit.dart';
import 'package:thimar_app/features/category_products_cubit/states.dart';
import 'package:thimar_app/features/slider_images/cubit.dart';
import 'package:thimar_app/features/slider_images/states.dart';
import 'package:thimar_app/views/main/home/cart/view.dart';
import 'package:thimar_app/views/main/home/category/view.dart';
import 'package:thimar_app/views/main/home/product_details/view.dart';

class HomeScreen extends StatefulWidget {
  final int? id;

  const HomeScreen({super.key, this.id});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CategoryProductsCubit cubit = BlocProvider.of(context);
    cubit.getCategoryProducts();
    return Scaffold(
      appBar: const MainAppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 15.h,
              ),
              child: AppInput(
                controller: searchController,
                keyboardType: TextInputType.text,
                isFilled: true,
                labelText: "ابحث عن ما تريد؟",
                prefixIcon: "assets/images/icons/Search.svg",
              ),
            ),
            SizedBox(
              height: 29.h,
            ),
            const SliderImages(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الأقسام",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15.sp
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "عرض الكل",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            const SectionsSlider(),
            SizedBox(
              height: 27.9.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: Text(
                "الأصناف",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15.sp
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (state is CategoryProductsFailedState) {
                  return const Center(
                    child: Text("FAILED.."),
                  );
                } else if (state is CategoryProductsSuccessState) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    itemCount: state.list.length,
                    itemBuilder: (context, index) => Container(
                      height: 250.h,
                      width: 163.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.r),
                        color: const Color(
                          0xffffffff,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.r,
                            color: const Color(
                              0xfff5f5f5,
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 9.h,
                                    right: 9.w,
                                    left: 9.w
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(11.r),),
                                  child: Image.network(
                                    state.list[index].mainImage,
                                    fit: BoxFit.cover,
                                    width: 145.w,
                                    height: 117.h,
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
                                  margin: EdgeInsets.only(
                                    top: 9.h,
                                    left: 12.w
                                  ),
                                  width: 54.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(25.r),
                                      topLeft: Radius.circular(11.r),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${state.list[index].discount * 100} %",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(
                                          0xffFFFFFF,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: 10.w,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                state.list[index].title,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: 11.w,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                state.list[index].unit.name,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF808080),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: 9.w
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
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "${state.list[index].priceBeforeDiscount} ر.س",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 13.sp,
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
                                    margin: EdgeInsets.only(left: 10.w),
                                    width: 30.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      color: const Color(
                                        0xff61B80C,
                                      ),
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
                                      icon: Icon(
                                        Icons.add_rounded,
                                        color: const Color(0xFFFFFFFF),
                                        size: 16.w.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 19.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 24.w,
                                right: 24.w,
                                bottom: 10.h,
                              ),
                              child: AppButton(
                                onTap: () {},
                                text: "أضف للسلة",
                                width: 115.w,
                                height: 30.h,
                                radius: 9.r,
                                backColor: const Color(
                                  0xff61B80C,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 11.w,
                      mainAxisSpacing: 11.h,
                      childAspectRatio: 0.62,
                    ),
                    shrinkWrap: true,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
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
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/images/logo/logo1.svg",
              width: 21.w,
              height: 21.h,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              "سلة ثمار",
              style: TextStyle(
                fontSize: 14.sp,
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
                    fontSize: 12.sp,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                  children: [
                    const TextSpan(
                      text: "\n",
                    ),
                    TextSpan(
                      text: "شارع الملك فهد - جدة",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Badge(
              alignment: AlignmentDirectional.topStart,
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 2.h,
              ),
              label: Text(
                "3",
                style: TextStyle(
                  fontSize: 6.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(
                    0xffFFFFFF,
                  ),
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              child: GestureDetector(
                onTap: () {
                  navigateTo(
                    Cart(),
                  );
                },
                child: Container(
                  height: 33.h,
                  width: 33.w,
                  padding: EdgeInsets.all(7.w.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.13),
                    borderRadius: BorderRadius.circular(
                      9.r,
                    ),
                  ),
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
  Size get preferredSize => Size.fromHeight(60.h);
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
      height: 103.h,
      width: 375.w,
      child: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is CategoryFailedState) {
            return const Center(
              child: Text("Failed"),
            );
          } else if (state is CategorySuccessState) {
            var model = state.list;
            return ListView.builder(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              itemCount: model.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  navigateTo(
                    CategoryProducts(
                      nameCategory: model[index].name,
                      id: model[index].id,
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          30.r,
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            12.r
                          ),
                        ),
                        child: Image.network(
                          model[index].media,
                          width: 73.w,
                          height: 73.h,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .7.h,
                    ),
                    Text(
                      model[index].name,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class SliderImages extends StatefulWidget {
  const SliderImages({super.key});

  @override
  State<SliderImages> createState() => _SliderImagesState();
}

class _SliderImagesState extends State<SliderImages> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    GetSliderImagesCubit cubit = BlocProvider.of(context);
    cubit.getSliderImages();
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (state is GetSliderImagesLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (state is GetSliderImagesSuccessState) {
          return Column(
            children: [
              CarouselSlider(
                items: List.generate(
                  state.list.length,
                  (index) => Image.network(
                    state.list[index].media,
                    height: 164.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                options: CarouselOptions(
                  height: 164.h,
                  autoPlay: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    currentIndex = index;
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  state.list.length,
                  (index) => Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: 3.w,
                    ),
                    child: CircleAvatar(
                      radius: currentIndex == index ? 4 : 2,
                      backgroundColor: currentIndex == index
                          ? Theme.of(context).primaryColor
                          : const Color(0xff707070),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text("فشل فى ايجاد الصور"),
          );
        }
      },
    );
  }
}
