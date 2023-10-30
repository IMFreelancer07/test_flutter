

import 'package:hive/hive.dart';
part 'hiveNotesModel.g.dart';

@HiveType(typeId: 0)
class hiveNotesModel extends HiveObject{

  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  hiveNotesModel({required this.title, required this.description});


}