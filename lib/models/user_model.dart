import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'userName')
  final String userName;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'profilePicPath')
  final String profilePicPath;

  @JsonKey(name: 'city')
  final String city;

  @JsonKey(name: 'state')
  final String state;

  @JsonKey(name: 'mobileNumber')
  final String mobileNumber;

  @JsonKey(name: 'isAccountExpired')
  final bool isAccountExpired;

  @JsonKey(name: 'createdDate')
  final String createdDate;

  @JsonKey(name: 'favListings')
  final List<dynamic> favListings;

  @JsonKey(name: 'userType')
  final String userType;

  @JsonKey(name: 'WAOptIn')
  final bool waOptIn;

  @JsonKey(name: 'userListings')
  final List<dynamic> userListings;

  UserModel({
    required this.userName,
    required this.email,
    required this.profilePicPath,
    required this.city,
    required this.state,
    required this.mobileNumber,
    required this.isAccountExpired,
    required this.createdDate,
    required this.favListings,
    required this.userType,
    required this.waOptIn,
    required this.userListings,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
