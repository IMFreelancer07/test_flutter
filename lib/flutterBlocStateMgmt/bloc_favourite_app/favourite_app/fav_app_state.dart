import 'package:equatable/equatable.dart';
import '../model/favourite_item_model.dart';


enum ListStatus {Loading, Success, Failure}

class FavAppState extends Equatable {

  final List<FavouriteItemModel> favItemList;
  final List<FavouriteItemModel> tempFavItemList;
  final ListStatus status;

  const FavAppState({
    this.favItemList = const [],
    this.tempFavItemList = const [],
    this.status = ListStatus.Loading
  });


  FavAppState copyWith({ListStatus? status, List<FavouriteItemModel>? favItemList, List<FavouriteItemModel>? tempFavItemList}){

    return FavAppState(
      status: status ?? this.status,
      favItemList: favItemList ?? this.favItemList,
      tempFavItemList: tempFavItemList ?? this.tempFavItemList
    );

  }

  @override
  List<Object?> get props => [favItemList, status, tempFavItemList];


}