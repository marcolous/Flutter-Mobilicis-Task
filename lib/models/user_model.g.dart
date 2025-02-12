// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userName: json['userName'] as String,
      email: json['email'] as String,
      profilePicPath: json['profilePicPath'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      mobileNumber: json['mobileNumber'] as String,
      isAccountExpired: json['isAccountExpired'] as bool,
      createdDate: json['createdDate'] as String,
      favListings: json['favListings'] as List<dynamic>,
      userType: json['userType'] as String,
      waOptIn: json['WAOptIn'] as bool,
      userListings: json['userListings'] as List<dynamic>,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'profilePicPath': instance.profilePicPath,
      'city': instance.city,
      'state': instance.state,
      'mobileNumber': instance.mobileNumber,
      'isAccountExpired': instance.isAccountExpired,
      'createdDate': instance.createdDate,
      'favListings': instance.favListings,
      'userType': instance.userType,
      'WAOptIn': instance.waOptIn,
      'userListings': instance.userListings,
    };
