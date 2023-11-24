import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/address/bloc.dart';
import 'package:thimar_app/features/address/events.dart';
import 'package:thimar_app/features/cart/states.dart';
import 'package:thimar_app/features/category/bloc.dart';
import 'package:thimar_app/features/category/states.dart';
import 'package:thimar_app/features/category_products/bloc.dart';
import 'package:thimar_app/features/category_products/states.dart';
import 'package:thimar_app/features/slider_images/bloc.dart';
import 'package:thimar_app/features/slider_images/events.dart';
import 'package:thimar_app/features/slider_images/states.dart';
import 'package:thimar_app/models/address.dart';
import 'package:thimar_app/views/main/home/category/view.dart';
import 'package:thimar_app/views/main/home/product_details/view.dart';
import '../../../../core/logic/main_data.dart';
import '../../../../features/cart/bloc.dart';
import '../../../../features/cart/events.dart';
import '../../../../features/category/events.dart';
import '../../../../features/category_products/events.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../main.dart';
import '../../account/address/address.dart';
import '../cart/view.dart';
import '../search/view.dart';

class HomeScreen extends StatefulWidget {
  final int? id;

  const HomeScreen({super.key, this.id});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = KiwiContainer().resolve<CategoryProductBloc>();

  final cartBloc = KiwiContainer().resolve<CartBloc>();

  void init() {
    bloc.add(
      GetCategoryProductsDataEvent(
        fromPagination: false,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    cartBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent &&
                notification is ScrollUpdateNotification &&
                bloc.pageNumber != null) {
              bloc.add(
                GetCategoryProductsDataEvent(
                  fromPagination: true,
                ),
              );
            }
            return true;
          },
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 16.w,
                  vertical: 15.h,
                ),
                child: AppInput(
                  isFilled: true,
                  isEnabled: false,
                  onPress: () {
                    navigateTo(
                      const SearchView(),
                    );
                  },
                  labelText: LocaleKeys.Search_about_You_Want.tr(),
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
                    LocaleKeys.Sections.tr(),
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
                    LocaleKeys.Categories.tr(),
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
                buildWhen: (previous, current) =>
                    current is! GetDataFromPaginationLoadingState &&
                    current is! GetDataFromPaginationFailState,
                builder: (context, state) {
                  if (state is CategoryProductsLoadingState) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 10.w,
                      ),
                      itemCount: 7,
                      itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.4),
                        highlightColor: Colors.grey.withOpacity(0.8),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(
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
                                      borderRadius:
                                          BorderRadiusDirectional.only(
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
                                          color: Colors.white,
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
                                start: 11.w,
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
                            Row(
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
                                      alignment:
                                          AlignmentDirectional.bottomStart,
                                      child: Text(
                                        "السعر قبل \n الخصم ر.س",
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
                  } else if (state is CategoryProductsSuccessState) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 10.w,
                      ),
                      itemCount: bloc.productsList.length,
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
                                      bloc.productsList[index].mainImage,
                                      fit: BoxFit.cover,
                                      width: 145.w,
                                      height: 117.h,
                                    ),
                                  ),
                                  onTap: () {
                                    navigateTo(
                                      ProductDetails(
                                        id: bloc.productsList[index].id,
                                        isFavorite:
                                            bloc.productsList[index].isFavorite,
                                        price: bloc.productsList[index].price,
                                      ),
                                    );
                                  },
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: Container(
                                    margin: EdgeInsetsDirectional.only(
                                      top: 9.h,
                                      end: 19.w,
                                    ),
                                    width: 54.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius:
                                          BorderRadiusDirectional.only(
                                        bottomStart: Radius.circular(25.r),
                                        topEnd: Radius.circular(11.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${bloc.productsList[index].discount * 100} %",
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
                                  bloc.productsList[index].title,
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
                                          "${bloc.productsList[index].price} ${LocaleKeys.SAR.tr()}",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor,
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
                                          "${bloc.productsList[index].priceBeforeDiscount} ${LocaleKeys.SAR.tr()}",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontSize: 13.sp,
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
                                child: bloc.productsList[index].amount != 0
                                    ? BlocBuilder(
                                        builder: (context, sA) {
                                          if (sA is AddToCartDataLoadingState &&
                                              sA.id ==
                                                  bloc.productsList[index].id) {
                                            return const Center(
                                              child: LinearProgressIndicator(),
                                            );
                                          } else {
                                            return AppButton(
                                              onTap: () {
                                                cartBloc.add(
                                                  AddToCartDataEvent(
                                                    productId: bloc
                                                        .productsList[index].id,
                                                    amount: 1,
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
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 35.h,
          child: BlocBuilder(
            bloc: bloc,
            buildWhen: (previous, current) => [
              GetDataFromPaginationLoadingState,
              CategoryProductsSuccessState,
              GetDataFromPaginationFailState
            ].contains(current),
            builder: (context, state) {
              if (state is GetDataFromPaginationLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetDataFromPaginationFailState) {
                return Center(
                  child: Text(state.msg),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}

class HomeAppBarTitle extends StatefulWidget {
  const HomeAppBarTitle({super.key});

  @override
  State<HomeAppBarTitle> createState() => _HomeAppBarTitleState();
}

class _HomeAppBarTitleState extends State<HomeAppBarTitle> {
  AddressModel? addressModel;
  final addressBloc = KiwiContainer().resolve<AddressBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setMainCartCount();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
          LocaleKeys.Thimar_Basket.tr(),
          style: TextStyle(
            fontSize: 14.sp,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(
                      38.r,
                    ),
                    topEnd: Radius.circular(
                      38.r,
                    ),
                  ),
                ),
                context: context,
                builder: (context) => BlocBuilder(
                  bloc: addressBloc
                    ..add(
                      GetUserAddressEvent(),
                    ),
                  builder: (context, state) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: Text(
                            LocaleKeys.Addresses.tr(),
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: AddressesListView(
                            onSubmit: (x) {
                              addressModel = x;
                              Navigator.of(context).pop();
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    );
                  },
                ),
              );
            },
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: LocaleKeys.Delivery_To.tr(),
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
                    text: addressModel?.location,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        StreamBuilder(
          initialData: '',
          stream: getIt.get<AppGlobals>().counterController.stream,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && snapshot.data != '') {
              return Badge(
                alignment: AlignmentDirectional.topEnd,
                label: Text(
                  "${snapshot.data ?? ''}",
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
                      const Cart(),
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
                    child: SvgPicture.asset(
                      "assets/images/icons/cart.svg",
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        )
      ],
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
          child: const HomeAppBarTitle()),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}

void setCartCount(int number) {
  getIt.get<AppGlobals>().counterController.sink.add(number);
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
          return SizedBox(
            width: double.infinity,
            height: 164.h,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.4),
              highlightColor: Colors.grey.withOpacity(0.8),
              child: Container(
                color: Colors.grey.withOpacity(0.4),
              ),
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
          return const SizedBox.shrink();
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
  final bloc = KiwiContainer().resolve<CategoriesBloc>()
    ..add(GetCategoriesEvent());

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
          if (state is CategoryLoadingState) {
            return ListView.builder(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 14.w,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.4),
                highlightColor: Colors.grey.withOpacity(0.8),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(
                        end: 18.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(
                          30.r,
                        ),
                      ),
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(
                            15.r,
                          ),
                        ),
                        child: SvgPicture.asset(
                          "assets/images/logo/logo1.svg",
                          width: 73.w,
                          height: 73.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "اسم القسم",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is CategorySuccessState) {
            var model = state.list;
            return ListView.builder(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 14.w,
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
                      margin: EdgeInsetsDirectional.only(
                        end: 18.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(
                          30.r,
                        ),
                      ),
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(
                            15.r,
                          ),
                        ),
                        child: Image.network(
                          model[index].media,
                          width: 73.w,
                          height: 73.h,
                          fit: BoxFit.fill,
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
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
