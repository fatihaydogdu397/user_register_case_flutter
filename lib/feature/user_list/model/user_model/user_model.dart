import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? id;
  final String name;
  final String surname;
  final DateTime birthDate;
  final String phoneNumber;
  final String identityNumber;
  final String salary;

  UserModel({
    this.id,
    required this.name,
    required this.surname,
    required this.birthDate,
    required this.phoneNumber,
    required this.identityNumber,
    required this.salary,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
