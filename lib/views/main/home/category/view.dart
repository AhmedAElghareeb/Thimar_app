import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/products_cubit/cubit.dart';
import 'package:thimar_app/features/products_cubit/states.dart';
import 'package:thimar_app/views/main/home/product_details/view.dart';

class CategoryProducts extends StatefulWidget {
  final String nameCategory;
  final int id;

  CategoryProducts({super.key, required this.nameCategory, required this.id});

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
      body: SafeArea(
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
                prefixIcon: "assets/images/icons/Search.svg",
              ),
            ),
            SizedBox(
              height: 21,
            ),
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (state is GetProductsFailedState) {
                  return Center(
                    child: Text("FAILEd!!!"),
                  );
                } else if (state is GetProductsSuccessState) {
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    itemCount: state.list.length,
                    itemBuilder: (context, index) => Container(
                      height: 250,
                      width: 163,
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
                                GestureDetector(
                                  child: Container(
                                    child: Image.network(
                                      state.list[index].mainImage,
                                      fit: BoxFit.cover,
                                      width: 145,
                                      height: 117,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11,),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
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
                                    width: 54,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(25),
                                        topLeft: Radius.circular(11),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${state.list[index].discount * 100} %",
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
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                state.list[index].title,
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
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                state.list[index].unit.name,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 5
                                ),
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        "${state.list[index].price} ر.س",
                                        style: TextStyle(
                                          fontSize: 16,
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
                                          fontSize: 13,
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
                                  margin: EdgeInsets.only(left: 10),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Color(0xff61B80C,),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      navigateTo(
                                        ProductDetails(
                                          id: state.list[index].id,
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.add_rounded,
                                      color: Color(0xFFFFFFFF),
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 19,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 24,
                                right: 24,
                                bottom: 10,
                              ),
                              child: Container(
                                width: 115,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color(0xff61B80C,),
                                ),
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "أضف للسلة",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xFFFFFFFF),
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
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 11,
                      mainAxisSpacing: 11,
                      childAspectRatio: 0.55,
                    ),
                    shrinkWrap: true,
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
          ],
        ),
      ),
    );
  }
}
