import 'package:json_annotation/json_annotation.dart';

part 'Coin.g.dart';

@JsonSerializable()
class Coin {
  final String uuid;
  final String symbol;
  final String name;
  final String color;
  final String iconUrl;
  final String marketCap;
  final String price;
  final String btcPrice;
  final int listedAt;
  final String change;
  final int rank;
  final List<int> sparkline;
  final String coinrankingUrl;

  @JsonKey(name: '24hVolume')
  final String volume24h;

  Coin({
    required this.uuid,
    required this.symbol,
    required this.name,
    required this.color,
    required this.iconUrl,
    required this.marketCap,
    required this.price,
    required this.btcPrice,
    required this.listedAt,
    required this.change,
    required this.rank,
    required this.sparkline,
    required this.coinrankingUrl,
    required this.volume24h,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

  Map<String, dynamic> toJson() => _$CoinToJson(this);
}
