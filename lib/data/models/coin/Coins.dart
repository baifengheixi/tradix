import 'package:json_annotation/json_annotation.dart';
import 'package:tradix/data/models/coin/Data.dart';

part 'Coins.g.dart';

@JsonSerializable()
class Coins {
  final String status;
  final Data data;

  Coins({required this.status, required this.data});

  factory Coins.fromJson(Map<String, dynamic> json) => _$CoinsFromJson(json);

  Map<String, dynamic> toJson() => _$CoinsToJson(this);
}
