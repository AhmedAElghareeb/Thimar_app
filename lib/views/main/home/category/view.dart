import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/products/cubit.dart';
import 'package:thimar_app/features/products/states.dart';
import 'package:thimar_app/views/main/home/product_details/view.dart';

class CategoryProducts extends StatefulWidget {
  final String nameCategory;
  final int id;

  const CategoryProducts({super.key, required this.nameCategory, required this.id});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductsCubit cubit = BlocProvider.of(context);
    cubit.getProducts(
      id: widget.id,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.nameCategory,
        ),
        leading: Padding(
          padding: EdgeInsets.all(10.w.h),
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
                padding: EdgeInsets.only(
                  right: 7.w,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16.w.h,
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
              padding: EdgeInsets.only(
                right: 16.w,
                left: 16.w,
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
              bloc: cubit,
              builder: (context, state) {
                if (state is GetProductsFailedState) {
                  return const Center(
                    child: Text("FAILEd!!!"),
                  );
                } else if (state is GetProductsSuccessState) {
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11.r,),
                                  ),
                                  margin: EdgeInsets.only(
                                    top: 9.h,
                                    right: 9.w,
                                    left: 9.w,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 9.w
                                ),
                                child: Row(
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
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.w),
                                  width: 30.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: const Color(0xff61B80C,),
                                  ),
                                  child: IconButton(
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
                              child: Container(
                                width: 115.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.r),
                                  color: const Color(0xff61B80C,),
                                ),
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Text(
                                    "أضف للسلة",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                  ),
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
