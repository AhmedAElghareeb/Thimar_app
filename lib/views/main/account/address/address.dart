import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:lottie/lottie.dart';
import 'package:thimar_app/core/design/app_empty.dart';
import 'package:thimar_app/core/design/dot_button.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/address/states.dart';
import 'package:thimar_app/models/address.dart';
import 'package:thimar_app/views/main/account/address/add_address.dart';

import '../../../../features/address/bloc.dart';
import '../../../../features/address/events.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "العناوين",
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
      body: AddressesListView(
        onSubmit: (x) {},
      ),
    );
  }
}

class AddressesListView extends StatefulWidget {
  final Function(AddressModel) onSubmit;

  const AddressesListView({super.key, required this.onSubmit});

  @override
  State<AddressesListView> createState() => _AddressesListViewState();
}

class _AddressesListViewState extends State<AddressesListView> {
  final addressBloc = KiwiContainer().resolve<AddressBloc>();

  void _init() {
    addressBloc.add(
      GetUserAddressEvent(),
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: addressBloc,
      builder: (context, state) {
        if (state is GetUserAddressLoadingState) {
          return Center(
            child: Lottie.asset(
              "assets/lottie/loading.json",
              width: 100.w,
              height: 100.h,
            ),
          );
        } else if (state is GetUserAddressSuccessState) {
          return SafeArea(
            child: ListView(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 12.w,
                vertical: 28.h,
              ),
              children: [
                Column(
                  children: [
                    state.list.isEmpty
                        ? const AppEmpty(
                            assetsPath: "empty.json",
                            text: "لا توجد بيانات",
                          )
                        : ListView.separated(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                widget.onSubmit(state.list[index]);
                              },
                              child: Container(
                                width: 343.w,
                                height: 140.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: const Color(
                                    0xffffffff,
                                  ),
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                            start: 16.w,
                                          ),
                                          child: Text(
                                            state.list[index].type,
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 217.w,
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.all(
                                            5.r,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              addressBloc.deleteItem(
                                                state.list[index],
                                              );
                                              state.list.removeWhere(
                                                (element) =>
                                                    element.id ==
                                                    state.list[index].id,
                                              );
                                              setState(() {});
                                            },
                                            child: SvgPicture.asset(
                                              "assets/images/icons/addressIcons/delete.svg",
                                              width: 24.w,
                                              height: 24.h,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.all(
                                            5.r,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              navigateTo(
                                                AddAddress(
                                                  model: state.list[index],
                                                  isEditing: false,
                                                ),
                                              ).then((x) {
                                                print('-==-=-= here');
                                                _init();
                                              });
                                            },
                                            child: SvgPicture.asset(
                                              "assets/images/icons/addressIcons/edit.svg",
                                              width: 24.w,
                                              height: 24.h,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        start: 16.w,
                                      ),
                                      child: Text(
                                        "العنوان : ${state.list[index].location}",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        start: 16.w,
                                      ),
                                      child: Text(
                                        "الوصف : ${state.list[index].description}",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        start: 16.w,
                                      ),
                                      child: Text(
                                        "رقم الجوال : ${state.list[index].phone}",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20.h,
                            ),
                            itemCount: state.list.length,
                          ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DotButton(
                      text: "إضافة عنوان",
                      onTap: () {
                        navigateTo(
                          const AddAddress(),
                        ).then((x) {
                          print('-==-=-= here');
                          _init();
                        });
                      },
                    ),
                  ],
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
