// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      isLiked: json['isLiked'] as bool?,
      likeCount: json['likeCount'] as int?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'likeCount': instance.likeCount,
      'isLiked': instance.isLiked,
      'imagePath': instance.imagePath,
    };
