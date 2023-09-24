import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("طلباتي"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => const _Item(),
        itemCount: 5,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
      ),
      // bottomNavigationBar: HomeNavBar(),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 14.w,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 17.r,
            blurStyle: BlurStyle.outer,
            offset: Offset(0.w, 6.h),
          )
        ],
      ),
      height: 100.h,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "طلب #4587",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "27,يونيو,2021",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(
                      0xff9C9C9C,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Row(
                  children: [
                    ...List.generate(
                      3,
                      (index) => Container(
                        width: 25.w,
                        height: 25.h,
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsetsDirectional.only(
                          end: 3.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          border: Border.all(
                            color: const Color(
                              0xff61B80C,
                            ).withOpacity(0.06),
                          ),
                        ),
                        child: Image.network(
                          "https://avatars.mds.yandex.net/i?id=1cf01f05034f49faab8c420bdbb317165b831aee-4841096-images-thumbs&ref=rim&n=33&w=236&h=200",
                          width: 25.w,
                          height: 25.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsetsDirectional.only(
                        end: 3.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.r),
                        color: Theme.of(context).primaryColor.withOpacity(0.13),
                      ),
                      child: Center(
                        child: Text(
                          "+2",
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
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 11.w,
                  vertical: 5.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  color: Theme.of(context).primaryColor.withOpacity(0.13),
                ),
                child: Center(
                  child: Text(
                    "بإنتظار الموافقة",
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Text(
                "180ر.س",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15.sp,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
