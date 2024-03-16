import 'package:flutter/material.dart';
import 'package:test_flutter/flutterBlocStateMgmt/flutter_freeze/model/freeze_person_model.dart';


class FreezeHomeScreen extends StatefulWidget {
  const FreezeHomeScreen({super.key});

  @override
  State<FreezeHomeScreen> createState() => _FreezeHomeScreenState();
}

class _FreezeHomeScreenState extends State<FreezeHomeScreen> {

  List<FreezePersonModel> personList = [
    FreezePersonModel(name: "Not null"),
    FreezePersonModel(name: "Maarij"),
    FreezePersonModel(name: "Flutter"),
  ];


  @override
  void initState() {
    super.initState();

    var data = [
      {'name' : 'name01'},
      {'name' :  null},
      {'name' : 'name03'},
    ];

    for(int i = 0; i< data.length; i++){
      personList.add(FreezePersonModel.fromJson(data[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Freeze Example"),
      ),
      body: ListView.builder(
          itemCount: personList.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(personList[index].name!),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Map<String, dynamic> data = {
            'name' : 'Syed Shahbaz'
          };

          FreezePersonModel model = FreezePersonModel.fromJson(data);
          print(model.name.toString());
          model = model.copyWith(name: "Updated Shazi");
          
          print("Updated Shazi: "+model.name.toString());
        },
        child: const Icon(Icons.radio_button_checked),
      ),

    );
  }
}
