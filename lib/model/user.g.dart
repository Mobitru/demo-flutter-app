// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  firstName: json['firstName'] as String? ?? "",
  lastName: json['lastName'] as String? ?? "",
  email: json['email'] as String,
  address: json['address'] as String? ?? "",
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'address': instance.address,
};
