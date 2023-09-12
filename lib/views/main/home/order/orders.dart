import 'package:flutter/material.dart';
import 'package:thimar_app/core/design/bottom_home_navbar.dart';



class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("طلباتي"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => _Item(),
        itemCount: 5,
        padding: EdgeInsets.all(16),
      ),
      bottomNavigationBar: HomeNavBar(),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 14,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 17,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 6),
          )
        ],
      ),
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "طلب #4587",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "27,يونيو,2021",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(
                      0xff9C9C9C,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    ...List.generate(
                      3,
                      (index) => Container(
                        width: 25,
                        height: 25,
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsetsDirectional.only(
                          end: 3,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: Color(
                              0xff61B80C,
                            ).withOpacity(0.06),
                          ),
                        ),
                        child: Image.network(
                          "https://avatars.mds.yandex.net/i?id=1cf01f05034f49faab8c420bdbb317165b831aee-4841096-images-thumbs&ref=rim&n=33&w=236&h=200",
                          width: 25,
                          height: 25,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsetsDirectional.only(
                        end: 3,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Theme.of(context).primaryColor.withOpacity(0.13),
                      ),
                      child: Center(
                        child: Text(
                          "+2",
                          style: TextStyle(
                            fontSize: 11,
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
                  horizontal: 11,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Theme.of(context).primaryColor.withOpacity(0.13),
                ),
                child: Center(
                  child: Text(
                    "بإنتظار الموافقة",
                    style: TextStyle(
                      fontSize: 11,
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
                  fontSize: 15,
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
