import 'package:kiwi/kiwi.dart';
import '../../features/category/bloc.dart';
import '../../features/category_products/bloc.dart';
import '../../features/get_faqs/bloc.dart';
import '../../features/logout/bloc.dart';
import '../../features/policy/bloc.dart';
import '../../features/slider_images/bloc.dart';
import '../../features/suggestions_and_complaints/bloc.dart';
import '../../features/terms_conditions/bloc.dart';
import 'dio_helper.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();

  container.registerInstance((c) => DioHelper());

  container.registerFactory((c) => LogoutBloc());
  container.registerFactory((c) => PolicyBloc());
  container.registerFactory((c) => FaqsBloc());
  container.registerFactory((c) => TermsBloc());
  container.registerFactory((c) => SuggestionsBloc());
  container.registerFactory((c) => SliderBloc());
  container.registerFactory((c) => CategoriesBloc());
  container.registerFactory((c) => CategoryProductBloc());
}
