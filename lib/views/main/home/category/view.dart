import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/products/states.dart';
import 'package:thimar_app/views/main/home/product_details/view.dart';

import '../../../../core/design/app_button.dart';
import '../../../../features/products/bloc.dart';
import '../../../../features/products/events.dart';

class CategoryProducts extends StatefulWidget {
  final String nameCategory;
  final int id;

  const CategoryProducts(
      {super.key, required this.nameCategory, required this.id});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  final searchController = TextEditingController();

  final bloc = KiwiContainer().resolve<ProductsDataBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.nameCategory,
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
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 16.w,
                end: 16.w,
                top: 29.h,
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
              height: 21.h,
            ),
            BlocBuilder(
              bloc: bloc..add(GetProductsDataEvent(
                id: widget.id,
              )),
              builder: (context, state) {
                if (state is GetProductsFailedState) {
                  return const Center(
                    child: Text("FAILEd!!!"),
                  );
                } else if (state is GetProductsSuccessState) {
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
                                  margin:
                                      EdgeInsetsDirectional.only(top: 9.h, end: 12.5.w),
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
                                        "${state.list[index].price} ر.س",
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
                      crossAxisSpacing: 11.w,
                      mainAxisSpacing: 11.h,
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
