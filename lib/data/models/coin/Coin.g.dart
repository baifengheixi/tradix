// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) => Coin(
      uuid: json['uuid'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      iconUrl: json['iconUrl'] as String,
      marketCap: json['marketCap'] as String,
      price: json['price'] as String,
      btcPrice: json['btcPrice'] as String,
      listedAt: json['listedAt'] as int,
      change: json['change'] as String,
      rank: json['rank'] as int,
      sparkline:
          (json['sparkline'] as List<dynamic>).map((e) => e as int).toList(),
      coinrankingUrl: json['coinrankingUrl'] as String,
      volume24h: json['24hVolume'] as String,
    );

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'symbol': instance.symbol,
      'name': instance.name,
      'color': instance.color,
      'iconUrl': instance.iconUrl,
      'marketCap': instance.marketCap,
      'price': instance.price,
      'btcPrice': instance.btcPrice,
      'listedAt': instance.listedAt,
      'change': instance.change,
      'rank': instance.rank,
      'sparkline': instance.sparkline,
      'coinrankingUrl': instance.coinrankingUrl,
      '24hVolume': instance.volume24h,
    };
