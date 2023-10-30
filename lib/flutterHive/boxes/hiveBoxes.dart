
import 'package:hive/hive.dart';

import '../models/hiveNotesModel.dart';

class Boxes {

  static Box<hiveNotesModel> getData() => Hive.box<hiveNotesModel>("notes");


}