import 'package:json_annotation/json_annotation.dart';

part 'cat.g.dart';

@JsonSerializable(explicitToJson: true)
class Cat {
  @JsonKey(name: 'Body')
  String body;

  Cat({this.body});

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);

  Map<String, dynamic> toJson() => _$CatToJson(this);
}
