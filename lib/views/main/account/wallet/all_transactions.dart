import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:lottie/lottie.dart';
import 'package:thimar_app/core/design/app_empty.dart';
import 'package:thimar_app/features/wallet/states.dart';

import '../../../../features/wallet/bloc.dart';
import '../../../../features/wallet/events.dart';

class AllTransactions extends StatefulWidget {
  // final OrderDetailsModel? data;

  const AllTransactions({super.key});

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  final getTransactionsBloc = KiwiContainer().resolve<WalletBloc>()
    ..add(
      GetWalletTransactionsDataEvent(),
    );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    getTransactionsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "سجل المعاملات",
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
      body: BlocBuilder(
        bloc: getTransactionsBloc,
        builder: (context, state) {
          if (state is GetWalletTransactionsDataLoadingState) {
            return Center(
              child: Lottie.asset(
                "assets/lottie/loading.json",
                width: 100.w,
                height: 100.h,
              ),
            );
          } else if (state is GetWalletTransactionsDataSuccessState) {
            return state.list.isEmpty
                ? const AppEmpty(
                    assetsPath: "empty.json",
                    text: "لا توجد بيانات",
                  )
                : SafeArea(
                    child: ListView.builder(
                      itemBuilder: (context, index) => Container(
                        width: 343.w,
                        height: state.list[index].transactionType == "charge"
                            ? 95.h
                            : 200.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            17.r,
                          ),
                          color: const Color(
                            0xffffffff,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.r,
                              color: const Color(
                                0xfff6f6f6,
                              ),
                            ),
                          ],
                        ),
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        margin: EdgeInsetsDirectional.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.all(
                                    5.r,
                                  ),
                                  child: SvgPicture.asset(
                                    state.list[index].transactionType ==
                                            "charge"
                                        ? "assets/images/icons/walletIcons/incoming.svg"
                                        : "assets/images/icons/walletIcons/paidTo.svg",
                                    width: 18.w,
                                    height: 18.h,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Text(
                                  state.list[index].transactionType == "charge"
                                      ? "شحن المحفظة"
                                      : "دفعت مقابل هذا الطلب",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 50.w,
                                ),
                                Text(
                                  state.list[index].date,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.sp,
                                    color: const Color(
                                      0xff9C9C9C,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            state.list[index].transactionType == "charge"
                                ? Padding(
                                    padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 49.w,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Text(
                                        "${state.list[index].amount} ر.س",
                                        style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  )
                                : state.list[index].transactionType ==
                                        "withdraw"
                                    ? Container(
                                        height: 120.h,
                                        padding:
                                            EdgeInsetsDirectional.symmetric(
                                          vertical: 10.h,
                                          horizontal: 14.w,
                                        ),
                                        margin: EdgeInsetsDirectional.symmetric(
                                          vertical: 10.h,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                            15.r,
                                          ),
                                          color: Colors.black.withOpacity(
                                            0.005,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.02),
                                              blurRadius: 2.r,
                                              blurStyle: BlurStyle.inner,
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "طلب رقم : ${state.list[index].modelId}#",
                                                      style: TextStyle(
                                                        fontSize: 17.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    Text(
                                                      state.list[index].date,
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: const Color(
                                                          0xff9C9C9C,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 1.5,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    ...List.generate(
                                                      state.list[index].images.length,
                                                          (i) => Container(
                                                        width: 25.w,
                                                        height: 25.h,
                                                        clipBehavior: Clip.antiAlias,
                                                        margin: EdgeInsetsDirectional.only(
                                                          end: 3.w,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadiusDirectional.circular(7.r),
                                                          border: Border.all(
                                                            color: const Color(
                                                              0xff61B80C,
                                                            ).withOpacity(0.06),
                                                          ),
                                                        ),
                                                        child: Image.network(
                                                          state.list[index].images[i].url,
                                                          width: 25.w,
                                                          height: 25.h,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    if (state.list[index].images.length > 3)
                                                      Container(
                                                        width: 25.w,
                                                        height: 25.h,
                                                        clipBehavior: Clip.antiAlias,
                                                        margin: EdgeInsetsDirectional.only(
                                                          end: 3.w,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadiusDirectional.circular(7.r),
                                                          color: Theme.of(context)
                                                              .primaryColor
                                                              .withOpacity(0.13),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "+${state.list[index].images.length - 3}",
                                                            style: TextStyle(
                                                              fontSize: 11.sp,
                                                              fontWeight: FontWeight.bold,
                                                              color: Theme.of(context).primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Text(
                                                  "${state.list[index].amount} ر.س",
                                                  style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w900,
                                                    fontSize: 15.sp,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                      itemCount: state.list.length,
                      scrollDirection: Axis.vertical,
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
