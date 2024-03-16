// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freeze_person_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FreezePersonModel _$FreezePersonModelFromJson(Map<String, dynamic> json) {
  return _FreezePersonModel.fromJson(json);
}

/// @nodoc
mixin _$FreezePersonModel {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FreezePersonModelCopyWith<FreezePersonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezePersonModelCopyWith<$Res> {
  factory $FreezePersonModelCopyWith(
          FreezePersonModel value, $Res Function(FreezePersonModel) then) =
      _$FreezePersonModelCopyWithImpl<$Res, FreezePersonModel>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$FreezePersonModelCopyWithImpl<$Res, $Val extends FreezePersonModel>
    implements $FreezePersonModelCopyWith<$Res> {
  _$FreezePersonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FreezePersonModelImplCopyWith<$Res>
    implements $FreezePersonModelCopyWith<$Res> {
  factory _$$FreezePersonModelImplCopyWith(_$FreezePersonModelImpl value,
          $Res Function(_$FreezePersonModelImpl) then) =
      __$$FreezePersonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$FreezePersonModelImplCopyWithImpl<$Res>
    extends _$FreezePersonModelCopyWithImpl<$Res, _$FreezePersonModelImpl>
    implements _$$FreezePersonModelImplCopyWith<$Res> {
  __$$FreezePersonModelImplCopyWithImpl(_$FreezePersonModelImpl _value,
      $Res Function(_$FreezePersonModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$FreezePersonModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FreezePersonModelImpl implements _FreezePersonModel {
  _$FreezePersonModelImpl({this.name = ""});

  factory _$FreezePersonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FreezePersonModelImplFromJson(json);

  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'FreezePersonModel(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FreezePersonModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FreezePersonModelImplCopyWith<_$FreezePersonModelImpl> get copyWith =>
      __$$FreezePersonModelImplCopyWithImpl<_$FreezePersonModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FreezePersonModelImplToJson(
      this,
    );
  }
}

abstract class _FreezePersonModel implements FreezePersonModel {
  factory _FreezePersonModel({final String name}) = _$FreezePersonModelImpl;

  factory _FreezePersonModel.fromJson(Map<String, dynamic> json) =
      _$FreezePersonModelImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$FreezePersonModelImplCopyWith<_$FreezePersonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
