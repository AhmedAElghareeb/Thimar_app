import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/features/wallet/states.dart';

import '../../../../features/wallet/bloc.dart';
import '../../../../features/wallet/events.dart';

class AllTransactions extends StatefulWidget {
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetWalletTransactionsDataSuccessState) {
            return SafeArea(
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  width: 343.w,
                  height: 83.h,
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
                    horizontal: 5.w,
                    vertical: 5.h,
                  ),
                  margin: EdgeInsetsDirectional.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.all(
                              8.r,
                            ),
                            child: SvgPicture.asset(
                              state.list[index].transactionType == "charge"
                                  ? "assets/images/icons/walletIcons/incoming.svg"
                                  : "assets/images/icons/walletIcons/paidTo.svg",
                              width: 18.w,
                              height: 18.h,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Text(
                            state.list[index].statusTrans == "شحن المحفظة"
                                ? "شحن المحفظة"
                                : "دفعت مقابل هذا الطلب",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 120.w,
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
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 49.w,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "${state.list[index].amount} ر.س",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
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
