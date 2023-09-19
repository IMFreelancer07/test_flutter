import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/favourite_Provider.dart';

class MyFavouritesScreen extends StatefulWidget {
  const MyFavouritesScreen({super.key});

  @override
  State<MyFavouritesScreen> createState() => _MyFavouritesScreenState();
}

class _MyFavouritesScreenState extends State<MyFavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<Favourite_Provider>(context);
    print("Complete Widget Builds");
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favourites"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favProvider.selected_item.length,
                itemBuilder: (context, index) {
                  return Consumer<Favourite_Provider>(builder: (context, value, child){
                    return ListTile(
                      onTap: (){
                        if(value.selected_item.contains(index)) {
                          value.removeIndex(index);
                        } else {
                          value.addIndex(index);
                        }

                      },
                      title: Text("Item # "+index.toString()),
                      trailing: Icon(
                          value.selected_item.contains(index)? Icons.favorite : Icons.favorite_outline_rounded),
                    );
                  });
                }),
          ),
        ],
      ),
    );
  }
}
