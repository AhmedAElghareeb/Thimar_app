import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:lottie/lottie.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/cart/states.dart';
import 'package:thimar_app/features/favourites/events.dart';
import 'package:thimar_app/features/products/states.dart';
import 'package:thimar_app/features/products_details/states.dart';
import 'package:thimar_app/features/products_rates/states.dart';

import '../../../../features/cart/bloc.dart';
import '../../../../features/cart/events.dart';
import '../../../../features/favourites/bloc.dart';
import '../../../../features/products/bloc.dart';
import '../../../../features/products/events.dart';
import '../../../../features/products_details/bloc.dart';
import '../../../../features/products_details/events.dart';
import '../../../../features/products_rates/bloc.dart';
import '../../../../features/products_rates/events.dart';
import 'all_rates.dart';

class ProductDetails extends StatefulWidget {
  final int id;
  final num price;
  bool isFavorite;

  ProductDetails({
    super.key,
    required this.id,
    required this.isFavorite,
    required this.price,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentIndex = 0;
  double counter = 1;

  final bloc = KiwiContainer().resolve<ProductDetailsBloc>();
  final categoryProductBloc = KiwiContainer().resolve<ProductsDataBloc>();
  final ratesBloc = KiwiContainer().resolve<ProductsRatesBloc>();
  final favouritesBloc = KiwiContainer().resolve<FavouritesBloc>();
  final addToCartBloc = KiwiContainer().resolve<CartBloc>();

  void _init() {
    bloc.add(
      GetProductsDetailsEvent(
        id: widget.id,
      ),
    );
    ratesBloc.add(GetProductsRatesEvent(
      id: widget.id,
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: bloc,
      listener: (c, s) {
        if (s is ShowProductsDetailsSuccessState) {
          categoryProductBloc.add(GetProductsDataEvent(
            id: s.model.categoryId.toInt(),
          ));
        }
      },
      builder: (context, state) {
        if (state is ShowProductsDetailsLoadingState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "تفاصيل المنتج",
              ),
              leading: Padding(
                padding: EdgeInsetsDirectional.all(
                  10.r,
                ),
                child: GestureDetector(
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.r),
                      color: const Color(
                        0xff707070,
                      ).withOpacity(0.1),
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
              ),
            ),
            body: Center(
              child: Lottie.asset(
                "assets/lottie/loading.json",
                width: 100.w,
                height: 100.h
              ),
            ),
          );
        } else if (state is ShowProductsDetailsSuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "تفاصيل المنتج",
              ),
              leading: Padding(
                padding: EdgeInsetsDirectional.all(
                  10.r,
                ),
                child: GestureDetector(
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.r),
                      color: const Color(
                        0xff707070,
                      ).withOpacity(0.1),
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
              ),
              actions: [
                BlocBuilder(
                  bloc: favouritesBloc,
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          if (widget.isFavorite == false) {
                            favouritesBloc.add(
                              AddToFavouritesEvent(
                                id: widget.id,
                              ),
                            );
                            widget.isFavorite = !widget.isFavorite;
                          } else {
                            favouritesBloc.add(
                              RemoveFromFavouritesEvent(
                                id: widget.id,
                              ),
                            );
                            widget.isFavorite = !widget.isFavorite;
                          }
                        },
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(
                                  0.1,
                                ),
                            borderRadius: BorderRadius.circular(
                              9.r,
                            ),
                          ),
                          child: Icon(
                            Icons.favorite,
                            size: 20,
                            color: widget.isFavorite ? Colors.red : null,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            body: ListView(
              children: [
                StatefulBuilder(
                  builder: (context, setState) => Column(
                    children: [
                      CarouselSlider(
                        items: List.generate(
                          state.model.images.isNotEmpty
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
                          autoPlay:
                              state.model.images.length > 1 ? true : false,
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
                                  onPress: () {
                                    if (state.model.amount > counter) {
                                      counter++;
                                    } else {
                                      showSnackBar(
                                        "عفوا الكمية المطلوبة غير متوفرة",
                                      );
                                    }
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Theme.of(context).primaryColor,
                                    size: 16.r,
                                  ),
                                ),
                                Text(
                                  counter.toString(),
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                _FloatingActionButton(
                                  onPress: () {
                                    if (counter > 1) {
                                      counter--;
                                    } else {
                                      showSnackBar(
                                        "يجب ان تكون الكمية = 1 على الأقل",
                                      );
                                    }
                                    setState(() {});
                                  },
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
                            onPressed: () {
                              navigateTo(
                                RatesView(
                                  id: state.model.id,
                                ),
                              );
                            },
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
                      BlocBuilder(
                        bloc: ratesBloc,
                        builder: (context, state) {
                          if (state is ProductsRatesLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is ProductsRatesSuccessState) {
                            return SizedBox(
                              width: double.infinity,
                              height: 87.h,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  state.list.length,
                                  (index) => Container(
                                    padding: EdgeInsetsDirectional.only(
                                      start: 13.w,
                                      top: 6.h,
                                    ),
                                    width: 267.w,
                                    height: 87.h,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              20.r),
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
                                                  state.list[index].clientName,
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 7.w,
                                                ),
                                                RatingBar.builder(
                                                  initialRating:
                                                      state.list[index].value,
                                                  minRating:
                                                      state.list[index].value,
                                                  maxRating:
                                                      state.list[index].value,
                                                  ignoreGestures: true,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 18,
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {},
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6.h,
                                            ),
                                            Text(
                                              state.list[index].comment,
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
                                          state.list[index].clientImage,
                                          width: 55.w,
                                          height: 55.h,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
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
                      BlocBuilder(
                        bloc: categoryProductBloc,
                        builder: (context, state2) {
                          if (state2 is GetProductsLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state2 is GetProductsSuccessState) {
                            return SizedBox(
                              width: double.infinity,
                              height: 172.h,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  state2.list.length,
                                  (index) => Container(
                                    height: 172.h,
                                    width: 130.w,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              17.r),
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
                                              GestureDetector(
                                                onTap: () {
                                                  navigateTo(
                                                    ProductDetails(
                                                      id: state2.list[index].id,
                                                      isFavorite: state2
                                                          .list[index]
                                                          .isFavorite,
                                                      price: state2
                                                          .list[index].price,
                                                    ),
                                                  );
                                                },
                                                child: Image.network(
                                                  state2.list[index].mainImage,
                                                  width: 116.w,
                                                  height: 94.h,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional.topEnd,
                                                child: Container(
                                                  width: 43.w,
                                                  height: 16.h,
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
                                                      "${state2.list[index].discount * 100} %",
                                                      style: TextStyle(
                                                        fontSize: 11.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.only(
                                              start: 9.w,
                                            ),
                                            child: Text(
                                              state2.list[index].title,
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.only(
                                              start: 10.w,
                                            ),
                                            child: Text(
                                              state2.list[index].unit.name,
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
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                  start: 9.w,
                                                ),
                                                child: Text(
                                                  "${state2.list[index].price} ر.س",
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
                                              alignment: AlignmentDirectional
                                                  .bottomStart,
                                              child: Text(
                                                "${state2.list[index].priceBeforeDiscount} ر.س",
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  decoration: TextDecoration
                                                      .lineThrough,
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
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: state.model.amount == 0
                ? null
                : BlocBuilder(
                    bloc: addToCartBloc,
                    builder: (context, ss) {
                      if (ss is AddToCartDataLoadingState) {
                        return LinearProgressIndicator(
                          minHeight: 5.h,
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            addToCartBloc.add(AddToCartDataEvent(
                              productId: widget.id,
                              amount: counter,
                            ));
                          },
                          child: Container(
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
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
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
                                      Text(
                                        "إضافة إلي السلة",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(
                                            0xffFFFFFF,
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
                                    "${counter * widget.price} ر.س",
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
                    },
                  ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    categoryProductBloc.close();
    ratesBloc.close();
    favouritesBloc.close();
    addToCartBloc.close();
  }
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
