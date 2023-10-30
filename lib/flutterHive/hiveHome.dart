import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_flutter/flutterHive/boxes/hiveBoxes.dart';
import 'package:test_flutter/flutterHive/models/hiveNotesModel.dart';

class hiveHome extends StatefulWidget {
  const hiveHome({super.key});

  @override
  State<hiveHome> createState() => _hiveHomeState();
}

class _hiveHomeState extends State<hiveHome> {

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Home"),
      ),
      body: ValueListenableBuilder<Box<hiveNotesModel>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _){
          var data = box.values.toList().cast<hiveNotesModel>();
          return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(data[index].title.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),

                            Spacer(),
                            SizedBox(width: 15,),

                            InkWell(
                                onTap: (){
                                  delete(data[index]);
                                },
                                child: Icon(Icons.delete, color: Colors.red,)
                            ),

                            SizedBox(width: 15,),

                            InkWell(
                                onTap: (){

                                  editDialog(data[index], data[index].title.toString(), data[index].description.toString());

                                },
                                child: Icon(Icons.edit)
                            ),
                             ],
                        ),
                        Text(data[index].description.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),),

                      ],
                    ),
                  ),
                );
              }
          );
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          _showDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void delete (hiveNotesModel hiveModel)async{
    await hiveModel.delete();
  }

  Future<void> editDialog(hiveNotesModel hiveModel, String title, String description)async{

    titleController.text        = title;
    descriptionController.text  = description;



    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Edit Notes"),
            content: SingleChildScrollView(
              child: Column(
                  children:[
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintText: "Enter Title",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                          hintText: "Enter description",
                          border: OutlineInputBorder()
                      ),
                    ),

                  ]
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Cancel")),
              TextButton(
                  onPressed: (){

                    hiveModel.title       = titleController.text.toString();
                    hiveModel.description = descriptionController.text.toString();

                    hiveModel.save();

                    titleController.clear();
                    descriptionController.clear();

                    Navigator.pop(context);
                  }, child: Text("Update")),
            ],
          );
        }
    );
  }

  Future<void>   _showDialog()async{

    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Add Notes"),
            content: SingleChildScrollView(
              child: Column(
                children:[
                  TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Enter Title",
                    border: OutlineInputBorder()
                  ),
                ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        hintText: "Enter description",
                        border: OutlineInputBorder()
                    ),
                  ),

                ]
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Cancel")),
              TextButton(
                  onPressed: (){

                    final data = hiveNotesModel(title: titleController.text, description: descriptionController.text);
                    final box = Boxes.getData();

                    box.add(data);
                    data.save();

                    titleController.clear();
                    descriptionController.clear();

                    Navigator.pop(context);
                  }, child: Text("Add")),
            ],
          );
        }
    );
  }
}
