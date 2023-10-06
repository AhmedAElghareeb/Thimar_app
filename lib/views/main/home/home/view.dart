import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/category/bloc.dart';
import 'package:thimar_app/features/category/states.dart';
import 'package:thimar_app/features/category_products/bloc.dart';
import 'package:thimar_app/features/category_products/states.dart';
import 'package:thimar_app/features/slider_images/bloc.dart';
import 'package:thimar_app/features/slider_images/events.dart';
import 'package:thimar_app/features/slider_images/states.dart';
import 'package:thimar_app/views/main/home/cart/view.dart';
import 'package:thimar_app/views/main/home/category/view.dart';
import 'package:thimar_app/views/main/home/product_details/view.dart';
import '../../../../features/category/events.dart';
import '../../../../features/category_products/events.dart';

class HomeScreen extends StatefulWidget {
  final int? id;

  const HomeScreen({super.key, this.id});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  final bloc = KiwiContainer().resolve<CategoryProductBloc>()..add(GetCategoryProductsDataEvent());

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
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
              height: 24.h,
            ),
            const SliderImages(),
            SizedBox(
              height: 29.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 16.w,
              ),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "الأقسام",
                  style:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 15.sp),
                ),
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
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 16.w,
              ),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "الأصناف",
                  style:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 15.sp),
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is CategoryProductsFailedState) {
                  return const Center(
                    child: Text("فشل فى الاتصال"),
                  );
                } else if (state is CategoryProductsSuccessState) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 16.w,
                    ),
                    itemCount: state.list.length,
                    itemBuilder: (context, index) => Container(
                      height: 250.h,
                      width: 163.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(17.r),
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
                                  margin: EdgeInsetsDirectional.only(
                                    top: 9.h,
                                    start: 9.w,
                                    end: 9.w,
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      11.r,
                                    ),
                                  ),
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
                                      isFavorite: state.list[index].isFavorite,
                                    ),
                                  );
                                },
                              ),
                              Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Container(
                                  margin: EdgeInsetsDirectional.only(
                                    top: 9.h,
                                    end: 12.5.w,
                                  ),
                                  width: 54.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadiusDirectional.only(
                                      bottomStart: Radius.circular(25.r),
                                      topEnd: Radius.circular(11.r),
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
                            padding: EdgeInsetsDirectional.only(
                              start: 10.w,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional.topStart,
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
                            padding: EdgeInsetsDirectional.only(
                              start: 11.w,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "السعر / ${state.list[index].unit.name}",
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
                            padding: EdgeInsetsDirectional.only(
                              start: 9.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional.topStart,
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
                                      alignment:
                                          AlignmentDirectional.bottomStart,
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
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 19.h,
                          ),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                end: 24.w,
                                start: 24.w,
                                bottom: 10.h,
                              ),
                              child: AppButton(
                                onTap: () {},
                                text: state.list[index].amount == 0
                                    ? "تم نفاذ الكمية"
                                    : "أضف للسلة",
                                width: 120.w,
                                height: 30.h,
                                radius: 9.r,
                                backColor: state.list[index].amount == 0
                                    ? Colors.grey
                                    : const Color(
                                        0xff61B80C,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: 0.652,
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
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 16.w,
        ),
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
              alignment: AlignmentDirectional.topEnd,
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
                  padding: EdgeInsetsDirectional.all(
                    7.r,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.13),
                    borderRadius: BorderRadiusDirectional.circular(
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

class SliderImages extends StatefulWidget {
  const SliderImages({super.key});

  @override
  State<SliderImages> createState() => _SliderImagesState();
}

class _SliderImagesState extends State<SliderImages> {

  final bloc = KiwiContainer().resolve<SliderBloc>()..add(GetSliderDataEvent());

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is GetSliderImagesLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (state is GetSliderImagesSuccessState) {
          return StatefulBuilder(
            builder: (context, setState2) => Stack(
              alignment: AlignmentDirectional.bottomCenter,
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
                      bloc.currentIndex = index;
                      setState2(() {});
                    },
                  ),
                ),
                Container(
                  width: 60.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(
                      7.r,
                    ),
                    color: Theme.of(context).primaryColor.withOpacity(
                      0.8,
                    ),
                  ),
                  margin: EdgeInsetsDirectional.only(
                    bottom: 5.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      state.list.length,
                          (index) => Padding(
                        padding: EdgeInsetsDirectional.only(
                          end: 6.w,
                        ),
                        child: CircleAvatar(
                          radius: bloc.currentIndex == index ? 4 : 2,
                          backgroundColor: bloc.currentIndex == index
                              ? Theme.of(context).primaryColor
                              : const Color(0xffFFFFFF).withOpacity(
                            0.8,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("فشل فى الاتصال"),
          );
        }
      },
    );
  }
}

class SectionsSlider extends StatefulWidget {
  const SectionsSlider({super.key});

  @override
  State<SectionsSlider> createState() => _SectionsSliderState();
}

class _SectionsSliderState extends State<SectionsSlider> {

  final bloc = KiwiContainer().resolve<CategoriesBloc>()..add(GetCategoriesEvent());

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 103.h,
      width: 375.w,
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is CategoryFailedState) {
            return const Center(
              child: Text("فشل فى الاتصال"),
            );
          } else if (state is CategorySuccessState) {
            var model = state.list;
            return ListView.builder(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 16.w,
              ),
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
                        borderRadius: BorderRadiusDirectional.circular(
                          30.r,
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(15.r),
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

