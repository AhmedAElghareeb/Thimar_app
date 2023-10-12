import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/features/favourites/events.dart';
import 'package:thimar_app/features/favourites/states.dart';
import 'package:thimar_app/models/favourites.dart';

import '../../../core/logic/helper_methods.dart';
import '../../../features/favourites/bloc.dart';
import '../home/product_details/view.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final bloc = KiwiContainer().resolve<FavouritesBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(
    GetFavouritesDataEvent()
    );
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
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetFavouritesDataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetFavouritesDataSuccessState) {
            if (state.list.isEmpty) {
              return Center(
                child: Text(
                  "لا يوجد بيانات",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              );
            } else {
              return GridView.builder(
                itemBuilder: (context, index) => _Item(
                  model: state.list[index],
                ),
                itemCount: state.list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 11.w,
                  mainAxisSpacing: 2.h,
                  childAspectRatio: 0.70,
                ),
                shrinkWrap: true,
              );
            }
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final FavouritesModel model;

  const _Item({required this.model});

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
                  model.mainImage,
                  fit: BoxFit.cover,
                  width: 145.w,
                  height: 117.h,
                ),
              ),
              onTap: () {
                navigateTo(
                  ProductDetails(
                    id: model.id,
                    isFavorite: model.isFavorite,
                    price: model.price,
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
                    "${model.discount * 100} %",
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
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 11.w,
          ),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              "السعر / ${model.unit.name}",
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
                      "${model.price} ر.س",
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
                      "${model.priceBeforeDiscount} ر.س",
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
      ],
    );
  }
}
