import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/providerStateMngmnt/Provider/favourite_Provider.dart';
import 'package:test_flutter/providerStateMngmnt/providerScreens/favourite/myFavourite_Screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  List<int> selected_item = [];

  @override
  Widget build(BuildContext context) {
    print("Complete Widget Builds");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyFavouritesScreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
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
