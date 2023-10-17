import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_empty.dart';
import 'package:thimar_app/features/category_products/events.dart';
import 'package:thimar_app/features/category_products/states.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../../../../core/design/app_button.dart';
import '../../../../core/design/app_input.dart';
import '../../../../core/logic/helper_methods.dart';
import '../../../../features/cart/bloc.dart';
import '../../../../features/cart/events.dart';
import '../../../../features/cart/states.dart';
import '../../../../features/category_products/bloc.dart';
import '../product_details/view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final bloc = KiwiContainer().resolve<CategoryProductBloc>();

  final cartBloc = KiwiContainer().resolve<CartBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    cartBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.Search_about_You_Want.tr(),
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
                borderRadius: BorderRadiusDirectional.circular(9.r),
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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 10.w,
                vertical: 20.h,
              ),
              child: AppInput(
                controller: bloc.searchController,
                isFilled: true,
                isSearch: true,
                labelText: LocaleKeys.Search_about_You_Want.tr(),
                prefixIcon: "assets/images/icons/Search.svg",
                onChanged: (value) {
                  bloc.add(
                    GetSearchDataEvent(
                      keyWord: value.toString(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is GetSearchDataSuccessState) {
                    return state.data.isEmpty
                        ? const AppEmpty(
                            assetsPath: "empty.json",
                            text: "لا يوجد نتائج بحث",
                          )
                        : GridView.builder(
                            padding: EdgeInsetsDirectional.symmetric(
                              horizontal: 10.w,
                            ),
                            itemCount: state.data.length,
                            itemBuilder: (context, index) => Container(
                              height: 250.h,
                              width: 163.w,
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
                                  Stack(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          margin: EdgeInsetsDirectional.only(
                                            top: 9.h,
                                            start: 9.w,
                                            end: 9.w,
                                          ),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              11.r,
                                            ),
                                          ),
                                          child: Image.network(
                                            state.data[index].mainImage,
                                            fit: BoxFit.cover,
                                            width: 145.w,
                                            height: 117.h,
                                          ),
                                        ),
                                        onTap: () {
                                          navigateTo(
                                            ProductDetails(
                                              id: state.data[index].id,
                                              isFavorite:
                                                  state.data[index].isFavorite,
                                              price: state.data[index].price,
                                            ),
                                          );
                                        },
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional.topEnd,
                                        child: Container(
                                          margin: EdgeInsetsDirectional.only(
                                            top: 9.h,
                                            end: 18.w,
                                          ),
                                          width: 54.w,
                                          height: 20.h,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadiusDirectional.only(
                                              bottomStart:
                                                  Radius.circular(25.r),
                                              topEnd: Radius.circular(11.r),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${state.data[index].discount * 100} %",
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
                                        state.data[index].title,
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
                                        LocaleKeys.Price_1_Kilogram.tr(),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional.topStart,
                                              child: Text(
                                                "${state.data[index].price} ${LocaleKeys.SAR.tr()}",
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional
                                                  .bottomStart,
                                              child: Text(
                                                "${state.data[index].priceBeforeDiscount} ${LocaleKeys.SAR.tr()}",
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  fontSize: 13.sp,
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
                                      child: state.data[index].amount != 0
                                          ? BlocBuilder(
                                              builder: (context, sA) {
                                                if (sA
                                                    is AddToCartDataLoadingState) {
                                                  return const Center(
                                                    child:
                                                        LinearProgressIndicator(),
                                                  );
                                                } else {
                                                  return AppButton(
                                                    onTap: () {
                                                      cartBloc.add(
                                                        AddToCartDataEvent(
                                                          productId: state
                                                              .data[index].id,
                                                          amount: state
                                                              .data[index]
                                                              .amount,
                                                        ),
                                                      );
                                                    },
                                                    text: LocaleKeys.Add_To_Cart
                                                        .tr(),
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
                                              text: LocaleKeys
                                                  .No_Amount_Available.tr(),
                                              width: 120.w,
                                              height: 30.h,
                                              radius: 9.r,
                                              backColor: Colors.white,
                                              textColor: Colors.red,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.w,
                              mainAxisSpacing: 10.h,
                              childAspectRatio: 0.6,
                            ),
                          );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
