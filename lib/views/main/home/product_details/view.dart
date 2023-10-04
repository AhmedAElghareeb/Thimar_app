import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/features/products_details/cubit.dart';
import 'package:thimar_app/features/products_details/states.dart';

class ProductDetails extends StatefulWidget {
  final int id;

  const ProductDetails({super.key, required this.id});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ShowProductsDetailsCubit cubit = BlocProvider.of(context);
    cubit.showProducts(
      id: widget.id,
    );
    return Scaffold(
      appBar: const MainAppBar(),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is ShowProductsDetailsFailedState) {
            return const Center(
              child: Text("FAILED!!!!!"),
            );
          } else if (state is ShowProductsDetailsSuccessState) {
            return ListView(
              children: [
                StatefulBuilder(
                  builder: (context, setState) => Column(
                    children: [
                      CarouselSlider(
                        items: List.generate(
                          state.model.images.length > 1
                              ? state.model.images.length
                              : 1,
                          (index) => Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.only(
                                bottomEnd: Radius.circular(40.r),
                                bottomStart: Radius.circular(40.r),
                              ),
                            ),
                            child: Image.network(
                              state.model.images.isNotEmpty
                                  ? state.model.images[index].url
                                  : state.model.mainImage,
                              height: 200.h,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            currentIndex = index;
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      if (state.model.images.length > 1)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            state.model.images.length,
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
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.model.title,
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              state.model.unit.name,
                              style: TextStyle(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w300,
                                color: const Color(
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
                                "${state.model.discount * 100} %",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(
                                    0xffFF0000,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                "${state.model.price} ر.س",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "${state.model.priceBeforeDiscount} ر.س",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.sp,
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Container(
                            width: 109.w,
                            height: 35.h,
                            padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 5.w),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10.r),
                              color: const Color(
                                0xff707070,
                              ).withOpacity(
                                0.2,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _FloatingActionButton(
                                  onPress: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: Theme.of(context).primaryColor,
                                    size: 16.r,
                                  ),
                                ),
                                Text(
                                  "5",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                _FloatingActionButton(
                                  onPress: () {},
                                  icon: Icon(
                                    Icons.remove,
                                    color: Theme.of(context).primaryColor,
                                    size: 16.r,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.5.h,
                ),
                const Divider(
                  color: Color(
                    0xffF9F9F9,
                  ),
                ),
                SizedBox(
                  height: 14.5.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Text(
                        "كود المنتج",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      Text(
                        state.model.code,
                        style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w300,
                          color: const Color(
                            0xff808080,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.5.h,
                ),
                const Divider(
                  color: Color(
                    0xffF9F9F9,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 16.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تفاصيل المنتج",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        state.model.description,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          color: const Color(
                            0xff757575,
                          ).withOpacity(
                            0.7,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "التقييمات",
                            style: TextStyle(
                              fontSize: 17.sp,
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
                                fontSize: 15.sp,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 87.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            3,
                            (index) => Container(
                              padding: EdgeInsetsDirectional.only(
                                start: 13.w,
                                top: 6.h,
                              ),
                              width: 267.w,
                              height: 87.h,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(20.r),
                                color: const Color(
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
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: const Color(
                                              0xffFF9529,
                                            ),
                                            size: 18.w.h,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: const Color(
                                              0xffFF9529,
                                            ),
                                            size: 18.w.h,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: const Color(
                                              0xffFF9529,
                                            ),
                                            size: 18.w.h,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: const Color(
                                              0xffFF9529,
                                            ),
                                            size: 18.w.h,
                                          ),
                                          Icon(
                                            Icons.star_border,
                                            color: const Color(
                                              0xffD5D5D5,
                                            ),
                                            size: 18.w.h,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Text(
                                        "هذا النص هو مثال لنص يمكن أن \n يستبدل في نفس المساحة ، لقد تم \n توليد هذا النص من مولد النص \n العربى، حيث يمكنك أن تولد مثل هذا \n النص أو العديد من النصوص الأخرى \n إضافة إلى زيادة عدد الحروف التى \n يولدها التطبيق",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Image.network(
                                    "https://thimar.amr.aait-d.com/public/dashboardAssets/images/backgrounds/avatar.jpg",
                                    width: 55.w,
                                    height: 55.h,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        "منتجات مشابهة",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 172.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            state.model.images.length,
                            (index) => Container(
                              height: 172.h,
                              width: 130.w,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(17.r),
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(
                                      top: 9.h,
                                      end: 9.w,
                                      start: 9.w,
                                    ),
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          state.model.mainImage,
                                          width: 116.w,
                                          height: 94.h,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topEnd,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: 43.w,
                                              height: 16.h,
                                              margin:
                                                  EdgeInsetsDirectional.only(
                                                end: 11.w,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .only(
                                                  bottomStart:
                                                      Radius.circular(25.r),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "${state.model.discount * 100} %",
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color(
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
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        start: 9.w,
                                      ),
                                      child: Text(
                                        state.model.title,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        start: 10.w,
                                      ),
                                      child: Text(
                                        state.model.unit.name,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: const Color(
                                            0xFF808080,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Row(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.only(
                                            start: 9.w,
                                          ),
                                          child: Text(
                                            "${state.model.price} ر.س",
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional.bottomStart,
                                        child: Text(
                                          "${state.model.priceBeforeDiscount} ر.س",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color:
                                                Theme.of(context).primaryColor,
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 60.h,
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.all(
                      16.r,
                    ),
                    width: 35.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(
                        10.r,
                      ),
                      color: Colors.grey.withOpacity(
                        0.5,
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/icons/cart2.svg",
                      width: 19.w,
                      height: 20.h,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "إضافة إلي السلة",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(
                          0xffFFFFFF,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                end: 20.w,
              ),
              child: Text(
                "225 ر.س",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(
                    0xffFFFFFF,
                  ),
                ),
              ),
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
        margin: EdgeInsetsDirectional.symmetric(
          horizontal: 16.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(9.r),
                  color: Theme.of(context).primaryColor.withOpacity(0.13),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 7.w,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 16.r,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Text(
              "تفاصيل المنتج",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 33.h,
              width: 33.w,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(.13),
                borderRadius: BorderRadius.circular(
                  9.r,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 7.w,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    size: 22.r,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    required this.onPress,
    required this.icon,
  });

  final VoidCallback? onPress;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 29.w,
      height: 29.h,
      child: FloatingActionButton(
        onPressed: onPress,
        mini: true,
        heroTag: null,
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0.0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8.r,
          ),
          borderSide: BorderSide(
            color: const Color(
              0xff707070,
            ).withOpacity(0.1),
          ),
        ),
        child: icon,
      ),
    );
  }
}
