import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/models/favourites_model.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  List<FavouritesModel> list = [
    FavouritesModel(
      image:
          "https://spfood.es/wa-data/public/shop/products/95/04/495/images/333/333.970.jpg",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceBefore: "45ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
          "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
    FavouritesModel(
      image:
      "https://avatars.mds.yandex.net/i?id=2d6afa9c074f3d9b120b09417e4b7425559f4cfd-8492261-images-thumbs&n=13",
      title: "جزر",
      body: "السعر / 1كجم",
      priceBefore: "48ر.س",
      priceAfter: "56ر.س",
      discount: "45% -",
    ),
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = true;

  getData() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "المفضلة",
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
            children: [
              GridView.builder(
                itemBuilder: (context, index) => _Item(model: list[index]),
                itemCount: list.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 11.w,
                  mainAxisSpacing: 2.h,
                  childAspectRatio: 0.70,
                ),
                shrinkWrap: true,
              ),
            ],
          ),
    );
  }
}

class _Item extends StatelessWidget {
  final FavouritesModel model;

  const _Item({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 29.h,
        right: 5.w,
        left: 5.w,
      ),
      child: Container(
        height: 215.h,
        width: 163.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
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
              padding: EdgeInsets.only(
                top: 9.h,
                left: 9.w,
                right: 9.w,
              ),
              child: Stack(
                children: [
                  Image.network(
                    model.image,
                    width: 146.w,
                    height: 117.h,
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 12.w
                      ),
                      child: Container(
                        width: 54.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25.r),
                            topLeft: Radius.circular(10.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            model.discount,
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
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 9.w,
                ),
                child: Text(
                  model.title,
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
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 10.w,
                ),
                child: Text(
                  model.body,
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
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 9.w,
                    ),
                    child: Text(
                      model.priceBefore,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      model.priceAfter,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
