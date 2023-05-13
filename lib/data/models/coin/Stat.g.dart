// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      total: json['total'] as int,
      totalCoins: json['totalCoins'] as int,
      totalMarkets: json['totalMarkets'] as int,
      totalExchanges: json['totalExchanges'] as int,
      totalMarketCap: json['totalMarketCap'] as String,
      total24hVolume: json['total24hVolume'] as String,
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'total': instance.total,
      'totalCoins': instance.totalCoins,
      'totalMarkets': instance.totalMarkets,
      'totalExchanges': instance.totalExchanges,
      'totalMarketCap': instance.totalMarketCap,
      'total24hVolume': instance.total24hVolume,
    };
