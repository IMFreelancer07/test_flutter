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
    on<DeleteItem>(_deleteItem);
  }

  void fetchFavList(FetchFavList event, Emitter<FavAppState> emit) async {

    favList = await repository.fetchItem();
    emit(state.copyWith(favItemList: List.from(favList), status: ListStatus.Success));
  }

  void favItemList(FavItemList event, Emitter<FavAppState> emit) async {

    final index = favList.indexWhere((element) => element.id == event.item.id);

    if(event.item.isFavourite){
      if(favList.contains(favList[index])){
        tempFavList.remove(favList[index]);
        tempFavList.add(event.item);
      }
    }else{
      if(favList.contains(favList[index])){
        tempFavList.remove(favList[index]);
        tempFavList.add(event.item);
      }
    }

    favList[index] = event.item;
    emit(state.copyWith(favItemList: List.from(favList), tempFavItemList: List.from(tempFavList)));
  }

  void selectedItemList(SelectedItemList event, Emitter<FavAppState> emit) async {

    tempFavList.add(event.item);
    emit(state.copyWith(tempFavItemList: List.from(tempFavList)));
  }

  void unselectedfavItemList(UnselectedItemList event, Emitter<FavAppState> emit) async {
    tempFavList.remove(event.item);
    emit(state.copyWith(tempFavItemList: List.from(tempFavList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavAppState> emit) async {

    for(int i = 0; i< tempFavList.length; i++){
      favList.remove(tempFavList[i]);
    }
    tempFavList.clear();
    emit(state.copyWith(
        favItemList: List.from(favList),
        tempFavItemList: List.from(tempFavList)
    ));
  }
}