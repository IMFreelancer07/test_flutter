import 'package:bloc/bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_favourite_app/favourite_app/fav_app_event.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_favourite_app/favourite_app/fav_app_state.dart';
import '../model/favourite_item_model.dart';
import '../repository/favourite_repository.dart';

class FavAppBloc extends Bloc<FavAppEvent, FavAppState>{

  FavouriteRepository repository;
  List<FavouriteItemModel> favList = [];
  List<FavouriteItemModel> tempFavList = [];
  FavAppBloc(this.repository): super(const FavAppState()){

    on<FetchFavList>(fetchFavList);
    on<FavItemList>(favItemList);
    on<SelectedItemList>(selectedItemList);
    on<UnselectedItemList>(unselectedfavItemList);
  }

  void fetchFavList(FetchFavList event, Emitter<FavAppState> emit) async {

    favList = await repository.fetchItem();
    emit(state.copyWith(favItemList: List.from(favList), status: ListStatus.Success));
  }

  void favItemList(FavItemList event, Emitter<FavAppState> emit) async {

    final index = favList.indexWhere((element) => element.id == event.item.id);
    favList[index] = event.item;
    emit(state.copyWith(favItemList: List.from(favList)));
  }

  void selectedItemList(SelectedItemList event, Emitter<FavAppState> emit) async {

  }

  void unselectedfavItemList(UnselectedItemList event, Emitter<FavAppState> emit) async {

  }
}