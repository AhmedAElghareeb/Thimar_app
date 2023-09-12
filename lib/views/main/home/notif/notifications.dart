import 'package:flutter/material.dart';
import 'package:thimar_app/core/design/bottom_home_navbar.dart';
import 'package:thimar_app/views/main/home/notif/model.dart';



class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationModel> list = [
    NotificationModel(
      image:
          "https://img.freepik.com/free-vector/speech-bubble_53876-43873.jpg?w=740&t=st=1694029114~exp=1694029714~hmac=1c0d0bc90609e58ff236b3c73f11ca86a4174852b91096419757401909b41327",
      title: "تم قبول طلبك وجاري تحضيره الأن",
      body:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
      time: "منذ ساعتان",
    ),
    NotificationModel(
      image:
          "https://img.freepik.com/free-vector/speech-bubble_53876-43873.jpg?w=740&t=st=1694029114~exp=1694029714~hmac=1c0d0bc90609e58ff236b3c73f11ca86a4174852b91096419757401909b41327",
      title: "تم قبول طلبك رقم 2",
      body: "اهلا وسهلا",
      time: "منذ ساعة",
    ),
    NotificationModel(
      image:
      "https://img.freepik.com/free-vector/speech-bubble_53876-43873.jpg?w=740&t=st=1694029114~exp=1694029714~hmac=1c0d0bc90609e58ff236b3c73f11ca86a4174852b91096419757401909b41327",
      title: "تم قبول طلبك رقم 3",
      body: "اهلا",
      time: "منذ ساعتين",
    ),
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = true;

  getData() async {
    await Future.delayed(Duration(seconds: 3));
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الإشعارات",
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) => _Item(model: list[index]),
              itemCount: list.length,
            ),
      bottomNavigationBar: HomeNavBar(),
    );
  }
}

class _Item extends StatelessWidget {
  final NotificationModel model;

  _Item({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Row(
        children: [
          Container(
            height: 33,
            width: 33,
            padding: EdgeInsets.all(6.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Theme.of(context).primaryColor.withOpacity(0.13),
            ),
            child: Image.network(
              model.image,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  model.body,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: Color(
                        0xff989898,
                      )),
                ),
                Text(
                  model.time,
                  style: TextStyle(
                    fontSize: 10,
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
