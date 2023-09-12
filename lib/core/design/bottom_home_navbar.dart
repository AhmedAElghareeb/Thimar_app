import 'package:flutter/material.dart';



class HomeNavBar extends StatefulWidget {
  HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  int currentIndex = 0;

  // final screens = [
  //   HomeScreen(),
  //   OrdersScreen(),
  //   NotificationsScreen(),
  //   FavouritesScreen(),
  //   AccountScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/images/homeNavBarIcons/home.png"),
          ),
          label: "الرئيسية",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/images/homeNavBarIcons/orders.png"),
          ),
          label: "طلباتي",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/images/homeNavBarIcons/notification.png"),
          ),
          label: "الإشعارات",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/images/homeNavBarIcons/fav.png"),
          ),
          label: "المفضلة",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/images/homeNavBarIcons/account.png"),
          ),
          label: "حسابي",
        ),
      ],
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
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
    //   Scaffold(
    //   body: screens[currentIndex],
    //   bottomNavigationBar: ,
    // );
  }
}
