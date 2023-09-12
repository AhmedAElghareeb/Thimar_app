import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/views/main/home/home_view/category/category_products_model.dart';


class CategoryProducts extends StatefulWidget {
  late String nameCategory;

  CategoryProducts({super.key, required this.nameCategory});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  final searchController = TextEditingController();

  List<CategoryProductsModel> list = [

    CategoryProductsModel(
      image: "https://avatars.mds.yandex.net/get-images-cbir/2827919/FU9v-KTGu8YWnzL0LrSJNA5770/ocr",
      discount: "% 45",
      title: "جزر",
      body: "السعر / 1كجم",
      priceAfter: "45 ر.س",
      priceBefore: "56 ر.س",
    ),
    CategoryProductsModel(
      image: "https://avatars.mds.yandex.net/get-images-cbir/1606199/5bEDDWrMSh2Loudd_AKJ_g6446/ocr",
      discount: "% 45",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceAfter: "45 ر.س",
      priceBefore: "56 ر.س",
    ),
    CategoryProductsModel(
      image: "https://avatars.mds.yandex.net/get-images-cbir/1606199/5bEDDWrMSh2Loudd_AKJ_g6446/ocr",
      discount: "% 45",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceAfter: "45 ر.س",
      priceBefore: "56 ر.س",
    ),
    CategoryProductsModel(
      image: "https://avatars.mds.yandex.net/get-images-cbir/1606199/5bEDDWrMSh2Loudd_AKJ_g6446/ocr",
      discount: "% 45",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceAfter: "45 ر.س",
      priceBefore: "56 ر.س",
    ),
    CategoryProductsModel(
      image: "https://avatars.mds.yandex.net/get-images-cbir/1606199/5bEDDWrMSh2Loudd_AKJ_g6446/ocr",
      discount: "% 45",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceAfter: "45 ر.س",
      priceBefore: "56 ر.س",
    ),
    CategoryProductsModel(
      image: "https://avatars.mds.yandex.net/get-images-cbir/1606199/5bEDDWrMSh2Loudd_AKJ_g6446/ocr",
      discount: "% 45",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceAfter: "45 ر.س",
      priceBefore: "56 ر.س",
    ),
    CategoryProductsModel(
      image: "https://avatars.mds.yandex.net/get-images-cbir/1606199/5bEDDWrMSh2Loudd_AKJ_g6446/ocr",
      discount: "% 45",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceAfter: "45 ر.س",
      priceBefore: "56 ر.س",
    ),
    CategoryProductsModel(
      image: "https://avatars.mds.yandex.net/get-images-cbir/1606199/5bEDDWrMSh2Loudd_AKJ_g6446/ocr",
      discount: "% 45",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceAfter: "45 ر.س",
      priceBefore: "56 ر.س",
    ),
    CategoryProductsModel(
      image: "https://avatars.mds.yandex.net/get-images-cbir/1606199/5bEDDWrMSh2Loudd_AKJ_g6446/ocr",
      discount: "% 45",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceAfter: "45 ر.س",
      priceBefore: "56 ر.س",
    ),
    CategoryProductsModel(
      image: "https://avatars.mds.yandex.net/get-images-cbir/1606199/5bEDDWrMSh2Loudd_AKJ_g6446/ocr",
      discount: "% 45",
      title: "طماطم",
      body: "السعر / 1كجم",
      priceAfter: "45 ر.س",
      priceBefore: "56 ر.س",
    ),
  ];



  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = true;

  getData() async {
    await Future.delayed(Duration(seconds: 3));
    isLoading = false;
    setState(() {});
  }

  // bool isLoading = true;
  //
  // late CategoryProductsModel model;
  //
  // void getData() async {
  //
  //   await Future.delayed(Duration(seconds: 3));
  //
  //   final response = await Dio().get(
  //     "https://thimar.amr.aait-d.com/public/api/categories/1",
  //   );
  //   model = CategoryProductsModel.fromJson(
  //     response.data,
  //   );
  //
  //   isLoading = false;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.nameCategory}",
        ),
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Color(
                  0xff707070,
                ).withOpacity(0.1),
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
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      left: 16,
                      top: 29,
                    ),
                    child: AppInput(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      isFilled: true,
                      labelText: "ابحث عن ما تريد؟",
                      prefixIcon: "assets/images/icons/search.png",
                    ),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => _Item(model: list[index]),
                    itemCount: list.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 11,
                      mainAxisSpacing: 2,
                      childAspectRatio: 0.73,
                    ),
                    shrinkWrap: true,
                  ),
                ],
              ),
            ),
    );
  }
}

class _Item extends StatelessWidget {
  final CategoryProductsModel model;

  const _Item({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 29,
        right: 5,
        left: 5,
      ),
      child: Container(
        height: 215,
        width: 163,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
                    //"https://avatars.mds.yandex.net/get-images-cbir/2827919/FU9v-KTGu8YWnzL0LrSJNA5770/ocr",
                    model.image,
                    width: 146,
                    height: 117,
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 2, top: 1),
                      child: Container(
                        width: 54,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(25),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            model.discount,
                            style: TextStyle(
                              fontSize: 14,
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
                  model.title,
                  style: TextStyle(
                    fontSize: 16,
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
                  model.body,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF808080),
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
                      model.priceAfter,
                      style: TextStyle(
                        fontSize: 16,
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
                      model.priceBefore,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 20,
                    ),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_rounded,
                          color: Color(0xFFFFFFFF),
                          size: 16,
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
    );
  }
}
