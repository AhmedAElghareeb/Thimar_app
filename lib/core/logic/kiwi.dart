import 'package:kiwi/kiwi.dart';
import '../../features/about_us/bloc.dart';
import '../../features/address/bloc.dart';
import '../../features/cart/bloc.dart';
import '../../features/category/bloc.dart';
import '../../features/category_products/bloc.dart';
import '../../features/confirm_code/bloc.dart';
import '../../features/contact_us/bloc.dart';
import '../../features/edit_profile/bloc.dart';
import '../../features/favourites/bloc.dart';
import '../../features/forget_password/bloc.dart';
import '../../features/get_cities/bloc.dart';
import '../../features/get_faqs/bloc.dart';
import '../../features/login/bloc.dart';
import '../../features/logout/bloc.dart';
import '../../features/notifications/bloc.dart';
import '../../features/orders/bloc.dart';
import '../../features/policy/bloc.dart';
import '../../features/products/bloc.dart';
import '../../features/products_details/bloc.dart';
import '../../features/products_rates/bloc.dart';
import '../../features/register/bloc.dart';
import '../../features/reset_password/bloc.dart';
import '../../features/slider_images/bloc.dart';
import '../../features/suggestions_and_complaints/bloc.dart';
import '../../features/terms_conditions/bloc.dart';
import '../../features/wallet/bloc.dart';
import '../../views/main/home/home/view.dart';
import 'dio_helper.dart';
import 'main_data.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();

  container.registerInstance((c) => DioHelper());

  container.registerFactory((c) => LoginBloc());
  container.registerFactory((c) => RegisterBloc());
  container.registerFactory((c) => ConfirmCodeBloc());
  container.registerFactory((c) => ForgetPasswordBloc());
  container.registerFactory((c) => ResetPasswordBloc());

  container.registerFactory((c) => CitiesBloc());

  container.registerFactory((c) => EditProfileBloc());
  container.registerFactory((c) => AddressBloc());
  container.registerFactory((c) => PolicyBloc());
  container.registerFactory((c) => FaqsBloc());
  container.registerFactory((c) => TermsBloc());
  container.registerFactory((c) => AboutUsBloc());
  container.registerFactory((c) => SuggestionsBloc());
  container.registerFactory((c) => ContactUsBloc());
  container.registerFactory((c) => WalletBloc());

  container.registerFactory((c) => SliderBloc());
  container.registerFactory((c) => CategoriesBloc());
  container.registerFactory((c) => CategoryProductBloc());
  container.registerFactory((c) => ProductsDataBloc());
  container.registerFactory((c) => ProductDetailsBloc());
  container.registerFactory((c) => ProductsRatesBloc());
  container.registerFactory((c) => CartBloc());
  container.registerFactory((c) => OrdersBloc());

  container.registerFactory((c) => NotificationsBloc());

  container.registerFactory((c) => FavouritesBloc());

  container.registerFactory((c) => LogoutBloc());
}
