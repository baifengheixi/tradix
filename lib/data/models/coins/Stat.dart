import 'package:json_annotation/json_annotation.dart';

part 'Stat.g.dart';

@JsonSerializable()
class Stat {
  final int total;
  final int totalCoins;
  final int totalMarkets;
  final int totalExchanges;
  final String totalMarketCap;
  final String total24hVolume;

  Stat({
    required this.total,
    required this.totalCoins,
    required this.totalMarkets,
    required this.totalExchanges,
    required this.totalMarketCap,
    required this.total24hVolume,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);

  @override
  String toString() {
    return 'Stat{total: $total, totalCoins: $totalCoins, totalMarkets: $totalMarkets, totalExchanges: $totalExchanges, totalMarketCap: $totalMarketCap, total24hVolume: $total24hVolume}';
  }
}
