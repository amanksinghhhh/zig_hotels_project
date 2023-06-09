// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return _WeatherModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherModel {
  TempDataModel? get main => throw _privateConstructorUsedError;
  List<GetWeatherDataModel>? get weather => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherModelCopyWith<WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherModelCopyWith<$Res> {
  factory $WeatherModelCopyWith(
          WeatherModel value, $Res Function(WeatherModel) then) =
      _$WeatherModelCopyWithImpl<$Res, WeatherModel>;
  @useResult
  $Res call({TempDataModel? main, List<GetWeatherDataModel>? weather});

  $TempDataModelCopyWith<$Res>? get main;
}

/// @nodoc
class _$WeatherModelCopyWithImpl<$Res, $Val extends WeatherModel>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? main = freezed,
    Object? weather = freezed,
  }) {
    return _then(_value.copyWith(
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as TempDataModel?,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<GetWeatherDataModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TempDataModelCopyWith<$Res>? get main {
    if (_value.main == null) {
      return null;
    }

    return $TempDataModelCopyWith<$Res>(_value.main!, (value) {
      return _then(_value.copyWith(main: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherModelCopyWith<$Res>
    implements $WeatherModelCopyWith<$Res> {
  factory _$$_WeatherModelCopyWith(
          _$_WeatherModel value, $Res Function(_$_WeatherModel) then) =
      __$$_WeatherModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TempDataModel? main, List<GetWeatherDataModel>? weather});

  @override
  $TempDataModelCopyWith<$Res>? get main;
}

/// @nodoc
class __$$_WeatherModelCopyWithImpl<$Res>
    extends _$WeatherModelCopyWithImpl<$Res, _$_WeatherModel>
    implements _$$_WeatherModelCopyWith<$Res> {
  __$$_WeatherModelCopyWithImpl(
      _$_WeatherModel _value, $Res Function(_$_WeatherModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? main = freezed,
    Object? weather = freezed,
  }) {
    return _then(_$_WeatherModel(
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as TempDataModel?,
      weather: freezed == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<GetWeatherDataModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherModel implements _WeatherModel {
  const _$_WeatherModel({this.main, final List<GetWeatherDataModel>? weather})
      : _weather = weather;

  factory _$_WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherModelFromJson(json);

  @override
  final TempDataModel? main;
  final List<GetWeatherDataModel>? _weather;
  @override
  List<GetWeatherDataModel>? get weather {
    final value = _weather;
    if (value == null) return null;
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WeatherModel(main: $main, weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherModel &&
            (identical(other.main, main) || other.main == main) &&
            const DeepCollectionEquality().equals(other._weather, _weather));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, main, const DeepCollectionEquality().hash(_weather));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherModelCopyWith<_$_WeatherModel> get copyWith =>
      __$$_WeatherModelCopyWithImpl<_$_WeatherModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherModelToJson(
      this,
    );
  }
}

abstract class _WeatherModel implements WeatherModel {
  const factory _WeatherModel(
      {final TempDataModel? main,
      final List<GetWeatherDataModel>? weather}) = _$_WeatherModel;

  factory _WeatherModel.fromJson(Map<String, dynamic> json) =
      _$_WeatherModel.fromJson;

  @override
  TempDataModel? get main;
  @override
  List<GetWeatherDataModel>? get weather;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherModelCopyWith<_$_WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TempDataModel _$TempDataModelFromJson(Map<String, dynamic> json) {
  return _TempDataModel.fromJson(json);
}

/// @nodoc
mixin _$TempDataModel {
  double? get temp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TempDataModelCopyWith<TempDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempDataModelCopyWith<$Res> {
  factory $TempDataModelCopyWith(
          TempDataModel value, $Res Function(TempDataModel) then) =
      _$TempDataModelCopyWithImpl<$Res, TempDataModel>;
  @useResult
  $Res call({double? temp});
}

/// @nodoc
class _$TempDataModelCopyWithImpl<$Res, $Val extends TempDataModel>
    implements $TempDataModelCopyWith<$Res> {
  _$TempDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = freezed,
  }) {
    return _then(_value.copyWith(
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TempDataModelCopyWith<$Res>
    implements $TempDataModelCopyWith<$Res> {
  factory _$$_TempDataModelCopyWith(
          _$_TempDataModel value, $Res Function(_$_TempDataModel) then) =
      __$$_TempDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? temp});
}

/// @nodoc
class __$$_TempDataModelCopyWithImpl<$Res>
    extends _$TempDataModelCopyWithImpl<$Res, _$_TempDataModel>
    implements _$$_TempDataModelCopyWith<$Res> {
  __$$_TempDataModelCopyWithImpl(
      _$_TempDataModel _value, $Res Function(_$_TempDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = freezed,
  }) {
    return _then(_$_TempDataModel(
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TempDataModel implements _TempDataModel {
  const _$_TempDataModel({this.temp});

  factory _$_TempDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_TempDataModelFromJson(json);

  @override
  final double? temp;

  @override
  String toString() {
    return 'TempDataModel(temp: $temp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TempDataModel &&
            (identical(other.temp, temp) || other.temp == temp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, temp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TempDataModelCopyWith<_$_TempDataModel> get copyWith =>
      __$$_TempDataModelCopyWithImpl<_$_TempDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TempDataModelToJson(
      this,
    );
  }
}

abstract class _TempDataModel implements TempDataModel {
  const factory _TempDataModel({final double? temp}) = _$_TempDataModel;

  factory _TempDataModel.fromJson(Map<String, dynamic> json) =
      _$_TempDataModel.fromJson;

  @override
  double? get temp;
  @override
  @JsonKey(ignore: true)
  _$$_TempDataModelCopyWith<_$_TempDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

GetWeatherDataModel _$GetWeatherDataModelFromJson(Map<String, dynamic> json) {
  return _GetWeatherDataModel.fromJson(json);
}

/// @nodoc
mixin _$GetWeatherDataModel {
  String? get main => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetWeatherDataModelCopyWith<GetWeatherDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetWeatherDataModelCopyWith<$Res> {
  factory $GetWeatherDataModelCopyWith(
          GetWeatherDataModel value, $Res Function(GetWeatherDataModel) then) =
      _$GetWeatherDataModelCopyWithImpl<$Res, GetWeatherDataModel>;
  @useResult
  $Res call({String? main, String? description, String? icon});
}

/// @nodoc
class _$GetWeatherDataModelCopyWithImpl<$Res, $Val extends GetWeatherDataModel>
    implements $GetWeatherDataModelCopyWith<$Res> {
  _$GetWeatherDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? main = freezed,
    Object? description = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetWeatherDataModelCopyWith<$Res>
    implements $GetWeatherDataModelCopyWith<$Res> {
  factory _$$_GetWeatherDataModelCopyWith(_$_GetWeatherDataModel value,
          $Res Function(_$_GetWeatherDataModel) then) =
      __$$_GetWeatherDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? main, String? description, String? icon});
}

/// @nodoc
class __$$_GetWeatherDataModelCopyWithImpl<$Res>
    extends _$GetWeatherDataModelCopyWithImpl<$Res, _$_GetWeatherDataModel>
    implements _$$_GetWeatherDataModelCopyWith<$Res> {
  __$$_GetWeatherDataModelCopyWithImpl(_$_GetWeatherDataModel _value,
      $Res Function(_$_GetWeatherDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? main = freezed,
    Object? description = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$_GetWeatherDataModel(
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetWeatherDataModel implements _GetWeatherDataModel {
  const _$_GetWeatherDataModel({this.main, this.description, this.icon});

  factory _$_GetWeatherDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_GetWeatherDataModelFromJson(json);

  @override
  final String? main;
  @override
  final String? description;
  @override
  final String? icon;

  @override
  String toString() {
    return 'GetWeatherDataModel(main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetWeatherDataModel &&
            (identical(other.main, main) || other.main == main) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, main, description, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetWeatherDataModelCopyWith<_$_GetWeatherDataModel> get copyWith =>
      __$$_GetWeatherDataModelCopyWithImpl<_$_GetWeatherDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetWeatherDataModelToJson(
      this,
    );
  }
}

abstract class _GetWeatherDataModel implements GetWeatherDataModel {
  const factory _GetWeatherDataModel(
      {final String? main,
      final String? description,
      final String? icon}) = _$_GetWeatherDataModel;

  factory _GetWeatherDataModel.fromJson(Map<String, dynamic> json) =
      _$_GetWeatherDataModel.fromJson;

  @override
  String? get main;
  @override
  String? get description;
  @override
  String? get icon;
  @override
  @JsonKey(ignore: true)
  _$$_GetWeatherDataModelCopyWith<_$_GetWeatherDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
