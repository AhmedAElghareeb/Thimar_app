import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/views/main/account/view/view.dart';
import 'package:thimar_app/views/main/favourites/view.dart';
import 'package:thimar_app/views/main/home/home/view.dart';
import 'package:thimar_app/views/main/notifications/view.dart';
import 'package:thimar_app/views/main/order/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    OrdersScreen(),
    NotificationsScreen(),
    FavouritesScreen(),
    AccountScreen(),
  ];

  List<String> titles = [
    "الرئيسية",
    "طلباتي",
    "الإشعارات",
    "المفضلة",
    "حسابي",
  ];

  List<String> icons = [
    "home",
    "orders",
    "notifications",
    "favs",
    "my_account",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
          pages.length,
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/icons/homeNavBarIcons/${icons[index]}.svg",
              color: currentIndex == index ? Colors.white : const Color(0xFFB9C9A8),
            ),
            label: titles[index],
          ),
        ),
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
          print(index);
          print(currentIndex);
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFFB9C9A8),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
