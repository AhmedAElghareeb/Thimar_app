import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thimar_app/models/cities/cities.dart';



class CitiesSheets extends StatefulWidget {
  const CitiesSheets({super.key});

  @override
  State<CitiesSheets> createState() => _CitiesSheetsState();
}

class _CitiesSheetsState extends State<CitiesSheets> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = true;

  late GetCitiesData model;

  void getData() async {
    final response = await Dio().get(
      "https://thimar.amr.aait-d.com/public/api/cities/1",
    );
    model = GetCitiesData.fromJson(
      response.data,
    );
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            "اختر مدينتك",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
            ),
          ),
          isLoading
              ? Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(
                      16,
                    ),
                    itemBuilder: (context, index) => _ItemCity(
                      model: model.list[index],
                    ),
                    itemCount: model.list.length,
                  ),
                ),
        ],
      ),
    );
  }
}

class _ItemCity extends StatelessWidget {
  final CityModel model;

  _ItemCity({required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, model);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Theme.of(context).primaryColor.withOpacity(
                0.04,
              ),
        ),
        child: Center(
          child: Text(
            model.name,
          ),
        ),
      ),
    );
  }
}
