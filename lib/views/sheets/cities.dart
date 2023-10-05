import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/features/get_cities/events.dart';
import 'package:thimar_app/features/get_cities/states.dart';
import 'package:thimar_app/models/cities.dart';

import '../../features/get_cities/bloc.dart';

class CitiesSheets extends StatefulWidget {
  const CitiesSheets({super.key});

  @override
  State<CitiesSheets> createState() => _CitiesSheetsState();
}

class _CitiesSheetsState extends State<CitiesSheets> {

  final citiesBloc = KiwiContainer().resolve<CitiesBloc>()..add(GetCitiesDataEvent(),);

  @override
  void dispose() {
    super.dispose();
    citiesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
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
                bloc: citiesBloc,
                builder: (context, state) {
                  if (state is GetCitiesLoadingState) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is GetCitiesSuccessState) {
                    return Expanded(
                      child: ListView.builder(
                        padding: EdgeInsetsDirectional.symmetric(
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
        );
      }
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
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 8.w,
          vertical: 8.h,
        ),
        margin: EdgeInsetsDirectional.only(
          bottom: 10.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(7.r),
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
