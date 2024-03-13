import 'package:equatable/equatable.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_favourite_app/model/favourite_item_model.dart';

abstract class FavAppEvent extends Equatable {

  const FavAppEvent();

  @override
  List<Object> get props => [];

}

class FetchFavList extends FavAppEvent {}

class FavItemList extends FavAppEvent {

  final FavouriteItemModel item;

  const FavItemList({required this.item});
}

class SelectedItemList extends FavAppEvent {

  final FavouriteItemModel item;

  const SelectedItemList({required this.item});
}

class UnselectedItemList extends FavAppEvent {

  final FavouriteItemModel item;

  const UnselectedItemList({required this.item});
}

class DeleteItem extends FavAppEvent {


}