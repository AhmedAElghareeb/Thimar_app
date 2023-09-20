import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/features/products_details/cubit.dart';
import 'package:thimar_app/features/products_details/states.dart';

class ProductDetails extends StatefulWidget {
  final int id;

  ProductDetails({super.key, required this.id});

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
      appBar: MainAppBar(),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is ShowProductsDetailsFailedState) {
            return Center(
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
                          state.model.images.length > 1 ? state.model.images.length : 1,
                          (index) => Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(35),
                                bottomRight: Radius.circular(35),
                              ),
                            ),
                            child: Image.network(
                              state.model.images.isNotEmpty
                                  ? state.model.images[index].url
                                  : state.model.mainImage,
                              height: 200,
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
                        height: 5,
                      ),
                      if (state.model.images.length > 1)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            state.model.images.length,
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.model.title,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              state.model.unit.name,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w300,
                                color: Color(
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
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  color: Color(
                                    0xffFF0000,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "${state.model.price} ر.س",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "${state.model.priceBeforeDiscount} ر.س",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Container(
                            width: 109,
                            height: 35,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(
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
                                    size: 16,
                                  ),
                                ),
                                Text(
                                  "5",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                _FloatingActionButton(
                                  onPress: () {},
                                  icon: Icon(
                                    Icons.remove,
                                    color: Theme.of(context).primaryColor,
                                    size: 16,
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
                  height: 12.5,
                ),
                Divider(
                  color: Color(
                    0xffF9F9F9,
                  ),
                ),
                SizedBox(
                  height: 14.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16
                  ),
                  child: Row(
                    children: [
                      Text(
                        "كود المنتج",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        state.model.code,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w300,
                          color: Color(
                            0xff808080,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.5,
                ),
                Divider(
                  color: Color(
                    0xffF9F9F9,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تفاصيل المنتج",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        state.model.description,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(
                            0xff757575,
                          ).withOpacity(
                            0.7,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "التقييمات",
                            style: TextStyle(
                              fontSize: 17,
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
                                fontSize: 15,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 87,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            3,
                            (index) => Container(
                              padding: EdgeInsets.only(
                                right: 13,
                                top: 6,
                              ),
                              width: 267,
                              height: 87,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(
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
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color(
                                              0xffFF9529,
                                            ),
                                            size: 18,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color(
                                              0xffFF9529,
                                            ),
                                            size: 18,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color(
                                              0xffFF9529,
                                            ),
                                            size: 18,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color(
                                              0xffFF9529,
                                            ),
                                            size: 18,
                                          ),
                                          Icon(
                                            Icons.star_border,
                                            color: Color(
                                              0xffD5D5D5,
                                            ),
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "هذا النص هو مثال لنص يمكن أن \n يستبدل في نفس المساحة ، لقد تم \n توليد هذا النص من مولد النص \n العربى، حيث يمكنك أن تولد مثل هذا \n النص أو العديد من النصوص الأخرى \n إضافة إلى زيادة عدد الحروف التى \n يولدها التطبيق",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Image.network(
                                    "https://thimar.amr.aait-d.com/public/dashboardAssets/images/backgrounds/avatar.jpg",
                                    width: 55,
                                    height: 55,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "منتجات مشابهة",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 172,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            state.model.images.length,
                            (index) => Container(
                              height: 172,
                              width: 130,
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
                                        Image.network(
                                          state.model.mainImage,
                                          width: 116,
                                          height: 94,
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional.topEnd,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: 43,
                                              height: 16,
                                              margin: EdgeInsets.only(
                                                left: 9,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(25),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "${state.model.discount * 100} %",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(
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
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 9,
                                      ),
                                      child: Text(
                                        state.model.title,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right: 10,
                                      ),
                                      child: Text(
                                        state.model.unit.name,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(
                                            0xFF808080,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            right: 9,
                                          ),
                                          child: Text(
                                            "${state.model.price} ر.س",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Theme.of(context).primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding: EdgeInsets.zero,
                                          child: Text(
                                            "${state.model.priceBeforeDiscount} ر.س",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color:
                                                  Theme.of(context).primaryColor,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 13,
                                          ),
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                6,
                                              ),
                                              color: Color(0xff61B80C,),
                                            ),
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.add_rounded,
                                                color: Color(0xFFFFFFFF),
                                                size: 13,
                                              ),
                                            ),
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
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(
                      16,
                    ),
                    width: 35,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: Colors.grey.withOpacity(
                        0.5,
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/icons/cart2.svg",
                      width: 19,
                      height: 20,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "إضافة إلي السلة",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(
                          0xffFFFFFF,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "225 ر.س",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(
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
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Theme.of(context).primaryColor.withOpacity(0.13),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 7,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 16,
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(.13),
                borderRadius: BorderRadius.circular(
                  9,
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Center(
                  child: Icon(
                    Icons.favorite_border,
                    size: 22,
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
  Size get preferredSize => Size.fromHeight(60);
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
    return Container(
      width: 29,
      height: 29,
      child: FloatingActionButton(
        onPressed: onPress,
        child: icon,
        mini: true,
        heroTag: null,
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0.0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
          borderSide: BorderSide(
            color: Color(
              0xff707070,
            ).withOpacity(0.1),
          ),
        ),
      ),
    );
  }
}
