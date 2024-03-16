import 'package:freezed_annotation/freezed_annotation.dart';
part 'freeze_person_model.freezed.dart';
part 'freeze_person_model.g.dart';

@Freezed()
class FreezePersonModel with _$FreezePersonModel {

  factory FreezePersonModel({
    @Default("") String name
}) = _FreezePersonModel;

  factory FreezePersonModel.fromJson(Map<String, dynamic> json) => _$FreezePersonModelFromJson (json);

}