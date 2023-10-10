import '../../models/products_rates.dart';

class GetProductsRatesStates {}

class ProductsRatesLoadingState extends GetProductsRatesStates {}

class ProductsRatesSuccessState extends GetProductsRatesStates {
  final List<ProductsRatesModel> list;

  ProductsRatesSuccessState({required this.list});
}

class ProductsRatesFailedState extends GetProductsRatesStates {}

class AddRateToProductLoadingState extends GetProductsRatesStates {}

class AddRateToProductSuccessState extends GetProductsRatesStates {}

class AddRateToProductFailedState extends GetProductsRatesStates {}
