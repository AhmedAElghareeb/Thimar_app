import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/features/get_cities/cubit.dart';
import 'package:thimar_app/features/get_cities/states.dart';
import 'package:thimar_app/models/cities.dart';

class CitiesSheets extends StatefulWidget {
  const CitiesSheets({super.key});

  @override
  State<CitiesSheets> createState() => _CitiesSheetsState();
}

class _CitiesSheetsState extends State<CitiesSheets> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCitiesCubit()..getData(),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Text(
              "اختر مدينتك",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
              ),
            ),
            BlocBuilder(
              builder: (context, state) {
                if (state is GetCitiesLoadingState) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  );
                } else if (state is GetCitiesSuccessState) {
                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      itemBuilder: (context, index) => _ItemCity(
                        model: state.list[index],
                      ),
                      itemCount: state.list.length,
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "فشل فى ايجاد المدن",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemCity extends StatelessWidget {
  final CityModel model;

  const _ItemCity({required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, model);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 8.h,
        ),
        margin: EdgeInsets.only(
          bottom: 10.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
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
