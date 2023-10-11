import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/dot_button.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/wallet/events.dart';
import 'package:thimar_app/features/wallet/states.dart';
import 'package:thimar_app/views/main/account/wallet/all_transactions.dart';

import '../../../../features/wallet/bloc.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {

  final _formKey = GlobalKey<FormState>();

  final getBloc = KiwiContainer().resolve<WalletBloc>()
    ..add(
      GetWalletDataEvent(),
    );

  final chargeBloc = KiwiContainer().resolve<WalletBloc>();

  @override
  void dispose() {
    super.dispose();
    getBloc.close();
    chargeBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المحفظة"),
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
      body: SafeArea(
        child: BlocBuilder(
          bloc: getBloc,
          builder: (context, state) {
            if (state is GetWalletDataLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetWalletDataSuccessState) {
              return ListView(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 16.w,
                  vertical: 20.h,
                ),
                children: [
                  Container(
                    width: 343.w,
                    height: 168.h,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "رصيدك",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "${state.wallet} ر.س",
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  DotButton(
                    text: "اشحن الآن",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          title: Center(
                            child: Text(
                              "شحن المحفظة",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          contentPadding: EdgeInsetsDirectional.symmetric(
                            horizontal: 8.w,
                            vertical: 8.h,
                          ),
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 250.w,
                                        child: AppInput(
                                          controller: chargeBloc.amountController,
                                          labelText: "ادخل المبلغ المطلوب",
                                          validator: (value) {
                                            if(value!.isEmpty) {
                                              return "هذا الحقل مطلوب";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Text(
                                        "ر.س",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Theme
                                              .of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Center(
                                    child: BlocBuilder(
                                      bloc: chargeBloc,
                                      builder: (context, state) {
                                        return AppButton(
                                          onTap: () {
                                            if(_formKey.currentState!.validate()) {
                                              chargeBloc.add(
                                                PostChargeWalletEvent(
                                                  amount: chargeBloc.amountController.text,
                                                ),
                                              );
                                              Navigator.pop(context);
                                            }
                                          },
                                          text: "تطبيق",
                                          width: 300.w,
                                          height: 50.h,
                                          radius: 15.r,
                                          isLoading: state is PostWalletChargeLoadingState,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 59.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "سجل المعاملات",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(
                            const AllTransactions(),
                          );
                        },
                        child: Text(
                          "عرض الكل",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  ListView.builder(
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
                                state.list[index].statusTrans,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: 113.w,
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
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
