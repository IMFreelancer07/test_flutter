import 'package:test_flutter/flutterBlocStateMgmt/bloc_favourite_app/model/favourite_item_model.dart';

class FavouriteRepository {

  Future<List<FavouriteItemModel>> fetchItem() async {
    return List.of(_generateList(10));
}

  List<FavouriteItemModel> _generateList(int length) {
    return List.generate(
        length, (index) => FavouriteItemModel(id: index.toString(), value: "Item # $index")
    );
  }
}