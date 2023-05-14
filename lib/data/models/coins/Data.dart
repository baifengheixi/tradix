import 'package:json_annotation/json_annotation.dart';
import 'package:tradix/data/models/coins/Coin.dart';
import 'package:tradix/data/models/coins/Stat.dart';

part 'Data.g.dart';

@JsonSerializable()
class Data {
  final Stat stats;
  final List<Coin> coins;

  Data({
    required this.stats,
    required this.coins,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  String toString() {
    return 'Data{stat: $stats, coins: $coins}';
  }
}
