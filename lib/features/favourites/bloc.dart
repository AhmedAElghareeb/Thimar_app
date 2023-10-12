import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/models/favourites.dart';
import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
import 'events.dart';
import 'states.dart';

class FavouritesBloc extends Bloc<FavouritesEvents, FavouritesStates> {
  FavouritesBloc() : super(FavouritesStates()) {
    on<GetFavouritesDataEvent>(getFavData);
    on<AddToFavouritesEvent>(addToFav);
    on<RemoveFromFavouritesEvent>(removeFromFav);
  }

  Future<void> getFavData(
      GetFavouritesDataEvent event, Emitter<FavouritesStates> emit) async {
    emit(
      GetFavouritesDataLoadingState(),
    );

    final response = await DioHelper().getFromServer(
      url: "client/products/favorites",
    );

    if (response.success) {
      final list = FavouritesData.fromJson(response.response!.data).list;
      emit(
        GetFavouritesDataSuccessState(
          list: list,
        ),
      );
    } else {
      emit(
        GetFavouritesDataFailedState(),
      );
    }
  }

  Future<void> addToFav(
      AddToFavouritesEvent event, Emitter<FavouritesStates> emit) async {
    final response = await DioHelper().sendToServer(
      url: "client/products/${event.id}/add_to_favorite",
    );
    showSnackBar(
      response.msg,
      typ: MessageType.success,
    );
    emit(
      AddToFavouritesSuccessState(),
    );
  }

  Future<void> removeFromFav(
      RemoveFromFavouritesEvent event, Emitter<FavouritesStates> emit) async {
    final response = await DioHelper().sendToServer(
      url: "client/products/${event.id}/remove_from_favorite",
    );
    showSnackBar(
      response.msg,
      typ: MessageType.success,
    );
    emit(
      RemoveFromFavouritesSuccessState(),
    );
  }
}
