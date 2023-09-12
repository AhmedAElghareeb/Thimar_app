import 'package:flutter/material.dart';
import 'package:thimar_app/core/design/app_button.dart';




class ConvertToVip extends StatelessWidget {
  const ConvertToVip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تحويل لحساب VIP",
        ),
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Color(
                  0xff707070,
                ).withOpacity(0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 7,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16,
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
        child: ListView(
          padding: EdgeInsets.only(
            right: 30,
            left: 30,
          ),
          children: [
            Image.network(
              "https://jpsrenewableenergy.co.uk/wp-content/uploads/2019/11/jps-20year-inverter-guarantee.png",
              width: 82,
              height: 102,
            ),
            SizedBox(
              height: 13,
            ),
            Center(
              child: Text(
                "حساب Vip",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Center(
              child: Text(
                "150 ر.س/شهريا",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Center(
              child: Text(
                "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.",
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 12,
                  child: Icon(
                    Icons.done,
                    color: Color(
                      0xffFFFFFF,
                    ),
                    size: 18,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "تسوق من المتجر ودفع التكاليف شهريا",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 12,
                  child: Icon(
                    Icons.done,
                    color: Color(
                      0xffFFFFFF,
                    ),
                    size: 18,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "خصومات وكوبونات مخصصه لك",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 12,
                  child: Icon(
                    Icons.done,
                    color: Color(
                      0xffFFFFFF,
                    ),
                    size: 18,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "دعم فني 24/7",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 12,
                  child: Icon(
                    Icons.done,
                    color: Color(
                      0xffFFFFFF,
                    ),
                    size: 18,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "تسوق من المتجر ودفع التكاليف شهريا",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            AppButton(
              onTap: () {},
              text: "طلب تحويل",
            ),
          ],
        ),
      ),
    );
  }
}
