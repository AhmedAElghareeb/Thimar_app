import 'package:thimar_app/core/logic/helper_methods.dart';

import '../../models/favourites.dart';

class FavouritesStates {}

class GetFavouritesDataLoadingState extends FavouritesStates {}

class GetFavouritesDataSuccessState extends FavouritesStates {
  final List<FavouritesModel> list;

  GetFavouritesDataSuccessState({required this.list});
}

class GetFavouritesDataFailedState extends FavouritesStates {}

class AddToFavouritesSuccessState extends FavouritesStates {}

class RemoveFromFavouritesSuccessState extends FavouritesStates {}
