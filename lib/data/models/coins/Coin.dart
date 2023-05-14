import 'package:json_annotation/json_annotation.dart';

part 'Coin.g.dart';

@JsonSerializable()
class Coin {
  final String? uuid;
  final String? symbol;
  final String? name;
  final String? color;
  final String? iconUrl;
  final String? marketCap;
  final String? price;
  final String? btcPrice;
  final int? listedAt;
  final String? change;
  final int? rank;
  final List<String>? sparkline;
  final String? coinrankingUrl;

  @JsonKey(name: '24hVolume')
  final String? volume24h;

  Coin({
    this.uuid,
    this.symbol,
    this.name,
    this.color,
    this.iconUrl,
    this.marketCap,
    this.price,
    this.btcPrice,
    this.listedAt,
    this.change,
    this.rank,
    this.sparkline,
    this.coinrankingUrl,
    this.volume24h,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

  Map<String, dynamic> toJson() => _$CoinToJson(this);

  @override
  String toString() {
    return 'Coin{uuid: $uuid, symbol: $symbol, name: $name, color: $color, iconUrl: $iconUrl, marketCap: $marketCap, price: $price, btcPrice: $btcPrice, listedAt: $listedAt, change: $change, rank: $rank, sparkline: $sparkline, coinrankingUrl: $coinrankingUrl, volume24h: $volume24h}';
  }
}
