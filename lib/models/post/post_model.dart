import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Equatable {
  final int? id;
  final String? title;
  final String? description;

  // @JsonKey(name: "date", fromJson: AppSerializer.timeStampToDateTime)
  // final DateTime? date;

  final int? likeCount;
  final bool? isLiked;
  final String? imagePath;

  const PostModel({
    required this.id,
    required this.title,
    required this.description,
    // required this.date,
    required this.isLiked,
    required this.likeCount,
    required this.imagePath,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  @override
  List<Object?> get props =>
      [id, title, description, likeCount, isLiked, imagePath];
}
