import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/features/logout/bloc.dart';

import 'dio_helper.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  
  container.registerInstance((c) => DioHelper());

  container.registerFactory((c) => LogoutBloc());
}