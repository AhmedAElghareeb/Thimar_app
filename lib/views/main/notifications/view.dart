import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/features/notifications/events.dart';
import 'package:thimar_app/features/notifications/states.dart';
import 'package:thimar_app/models/notifications.dart';

import '../../../features/notifications/bloc.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final bloc = KiwiContainer().resolve<NotificationsBloc>()
    ..add(
      GetNotificationsEvent(),
    );

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
          "الإشعارات",
        ),
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if(state is GetNotificationsLoadingState) {
            return const Center(child: CircularProgressIndicator(),);
          } else if (state is GetNotificationsSuccessState) {
            return ListView.builder(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              itemBuilder: (context, index) => _Item(
                model: state.list[index],
              ),
              itemCount: state.list.length,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      // bottomNavigationBar: HomeNavBar(),
    );
  }
}

class _Item extends StatelessWidget {
  final Notifications model;

  const _Item({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: 16.h,
      ),
      child: Row(
        children: [
          Container(
            height: 33.h,
            width: 33.w,
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 6.5.w, vertical: 6.5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              color: Theme.of(context).primaryColor.withOpacity(0.13),
            ),
            child: Image.network(
              model.image,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  model.body,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w300,
                      color: const Color(
                        0xff989898,
                      )),
                ),
                Text(
                  model.createdAt,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
