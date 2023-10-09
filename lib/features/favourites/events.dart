class FavouritesEvents {}

class GetFavouritesDataEvent extends FavouritesEvents {}

class AddToFavouritesEvent extends FavouritesEvents {
  final int id;

  AddToFavouritesEvent({required this.id});
}

class RemoveFromFavouritesEvent extends FavouritesEvents {
  final int id;

  RemoveFromFavouritesEvent({required this.id});
}