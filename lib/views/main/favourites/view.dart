import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/features/favourites/events.dart';
import 'package:thimar_app/features/favourites/states.dart';
import 'package:thimar_app/models/favourites.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_empty.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../features/cart/bloc.dart';
import '../../../features/cart/events.dart';
import '../../../features/cart/states.dart';
import '../../../features/favourites/bloc.dart';
import '../home/product_details/view.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final bloc = KiwiContainer().resolve<FavouritesBloc>();

  void init() {
    bloc.add(
      GetFavouritesDataEvent(),
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "المفضلة",
        ),
      ),
      body: CacheHelper.getToken().isEmpty
          ? const AppEmpty(
              assetsPath: "empty.json",
              text: "الرجاء تسجيل الدخول اولا",
            )
          : BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is GetFavouritesDataLoadingState) {
                  return GridView.builder(
                    itemBuilder: (context, index) => const _LoadingItem(),
                    itemCount: 3,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 11.w,
                      mainAxisSpacing: 2.h,
                      childAspectRatio: 0.70,
                    ),
                  );
                } else if (state is GetFavouritesDataSuccessState) {
                  return state.list.isEmpty
                      ? const AppEmpty(
                          assetsPath: "empty_favourites.json",
                          text: "لا توجد بيانات",
                        )
                      : GridView.builder(
                          itemBuilder: (context, index) => _Item(
                            model: state.list[index],
                          ),
                          itemCount: state.list.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 11.w,
                            mainAxisSpacing: 2.h,
                            childAspectRatio: 0.70,
                          ),
                        );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
    );
  }
}

class _Item extends StatefulWidget {
  final FavouritesModel model;

  const _Item({required this.model});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  final cartBloc = KiwiContainer().resolve<CartBloc>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cartBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(
                    11.r,
                  ),
                ),
                margin: EdgeInsetsDirectional.only(
                  top: 9.h,
                  start: 9.w,
                  end: 9.w,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  widget.model.mainImage,
                  fit: BoxFit.cover,
                  width: 145.w,
                  height: 117.h,
                ),
              ),
              onTap: () {
                navigateTo(
                  ProductDetails(
                    id: widget.model.id,
                    isFavorite: widget.model.isFavorite,
                    price: widget.model.price,
                  ),
                );
              },
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                margin: EdgeInsetsDirectional.only(
                  top: 9.h,
                  end: 28.w,
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
                    "${widget.model.discount * 100} %",
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
              widget.model.title,
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
              "السعر / ${widget.model.unit.name}",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 9.w),
              child: Row(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "${widget.model.price} ر.س",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Text(
                      "${widget.model.priceBeforeDiscount} ر.س",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
            child: widget.model.amount != 0
                ? BlocBuilder(
                    builder: (context, sA) {
                      if (sA is AddToCartDataLoadingState) {
                        return const Center(
                          child: LinearProgressIndicator(),
                        );
                      } else {
                        return AppButton(
                          onTap: () {
                            cartBloc.add(
                              AddToCartDataEvent(
                                productId: widget.model.id,
                                amount: widget.model.amount,
                              ),
                            );
                          },
                          text: "أضف للسلة",
                          width: 120.w,
                          height: 30.h,
                          radius: 9.r,
                          backColor: const Color(
                            0xff61B80C,
                          ),
                        );
                      }
                    },
                    bloc: cartBloc,
                  )
                : AppButton(
                    onTap: () {},
                    text: "تم نفاذ الكمية",
                    width: 120.w,
                    height: 30.h,
                    radius: 9.r,
                    backColor: Colors.white,
                    textColor: Colors.red,
                  ),
          ),
        ),
      ],
    );
  }
}

class _LoadingItem extends StatelessWidget {
  const _LoadingItem();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.4),
      highlightColor: Colors.grey.withOpacity(0.8),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(
                    11.r,
                  ),
                ),
                margin: EdgeInsetsDirectional.only(
                  top: 20.h,
                  start: 9.w,
                  end: 20.w,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/logo/logo1.svg",
                    fit: BoxFit.scaleDown,
                    width: 70.w,
                    height: 70.h,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                    top: 9.h,
                    end: 28.w,
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
                      "الخصم",
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
              start: 15.w,
            ),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "اسم المنتج",
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
              start: 16.w,
            ),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "السعر / كيلو",
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
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        "السعر بعد \n الخصم ر.س",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        "السعر قبل \n الخصم ر.س",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.lineThrough,
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
    );
  }
}
