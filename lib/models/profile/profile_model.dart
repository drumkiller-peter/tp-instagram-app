// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends Equatable {
  final String email;
  final String bio;

  @JsonKey(name: "follower_count")
  final int followerCount;
  @JsonKey(name: "following")
  final int following;

  const ProfileModel({
    required this.email,
    required this.bio,
    required this.followerCount,
    required this.following,
  });

  @override
  List<Object?> get props => [email, bio, followerCount, following];

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
