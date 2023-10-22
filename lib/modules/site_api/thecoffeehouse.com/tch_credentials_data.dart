import 'package:json_annotation/json_annotation.dart';
import 'package:loyalyet_app/modules/storage/storage.dart';

part 'tch_credentials_data.g.dart';

@JsonSerializable()
class TheCoffeeHouseCredentialsData extends CredentialsData {
  const TheCoffeeHouseCredentialsData({
    required this.token,
    required this.version,
  });

  factory TheCoffeeHouseCredentialsData.fromJson(CredentialsDataJson json) =>
      _$TheCoffeeHouseCredentialsDataFromJson(json);

  final String token;

  @override
  final int version;

  @override
  CredentialsDataJson toJson() => _$TheCoffeeHouseCredentialsDataToJson(this);
}
