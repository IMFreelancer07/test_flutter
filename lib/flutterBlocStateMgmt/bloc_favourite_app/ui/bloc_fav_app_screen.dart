import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_favourite_app/favourite_app/fav_app_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_favourite_app/favourite_app/fav_app_event.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_favourite_app/favourite_app/fav_app_state.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_favourite_app/model/favourite_item_model.dart';

class BlocFavAppScreen extends StatefulWidget {
  const BlocFavAppScreen({super.key});

  @override
  State<BlocFavAppScreen> createState() => _BlocFavAppScreenState();
}

class _BlocFavAppScreenState extends State<BlocFavAppScreen> {

  @override
  void initState() {
    super.initState();

    context.read<FavAppBloc>().add(FetchFavList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<FavAppBloc, FavAppState>(
          builder: (context, state){

            switch(state.status){
              case ListStatus.Loading:
                return const Center(child: CircularProgressIndicator());
              case ListStatus.Failure:
                return const Text("Something went wrong!");
              case ListStatus.Success:
                return ListView.builder(
                    itemCount: state.favItemList.length,
                    itemBuilder: (context, index){
                      final item = state.favItemList[index];
                      return Card(
                        child: ListTile(
                          leading: Checkbox(
                            value: true,
                            onChanged: (value){

                            },
                          ),
                          title: Text(item.value.toString()),
                          trailing: IconButton(
                            icon: Icon(
                                item.isFavourite ? Icons.favorite : Icons.favorite_border
                            ),
                            onPressed: (){

                              FavouriteItemModel favItem = FavouriteItemModel(
                                  id: item.id, value: item.value,
                                  isFavourite: item.isFavourite ? false : true
                              );
                              context.read<FavAppBloc>().add(FavItemList(item: favItem));
                            },
                          ),
                        ),
                      );
                    }
                );
            }
          },
        ),
      ),
    );
  }
}
