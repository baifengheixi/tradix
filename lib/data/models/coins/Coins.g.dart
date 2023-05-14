// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Coins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coins _$CoinsFromJson(Map<String, dynamic> json) => Coins(
      status: json['status'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoinsToJson(Coins instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
