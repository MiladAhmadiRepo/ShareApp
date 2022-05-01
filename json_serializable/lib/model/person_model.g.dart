// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) => PersonModel(
      name: NameModel.fromJson(json['name'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      email: json['email'] as String,
      picture: PictureModel.fromJson(json['picture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonModelToJson(PersonModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'picture': instance.picture,
    };
