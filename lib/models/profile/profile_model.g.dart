// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      email: json['email'] as String,
      bio: json['bio'] as String,
      followerCount: json['follower_count'] as int,
      following: json['following'] as int,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'bio': instance.bio,
      'follower_count': instance.followerCount,
      'following': instance.following,
    };
