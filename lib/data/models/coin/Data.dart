import 'package:json_annotation/json_annotation.dart';
import 'package:tradix/data/models/coin/Coin.dart';
import 'package:tradix/data/models/coin/Stat.dart';

part 'Data.g.dart';

@JsonSerializable()
class Data {
  final Stat stat;
  final List<Coin> coins;

  Data({required this.stat, required this.coins});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
