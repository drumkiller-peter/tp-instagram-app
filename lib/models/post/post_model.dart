import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  int? id;
  String? title;
  String? description;
  DateTime? date;
  int? likeCount;
  bool? isLiked;
  String? imagePath;

  PostModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isLiked,
    required this.likeCount,
    required this.imagePath,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    date = (json['date'] as Timestamp).toDate();
    likeCount = json['likeCount'];
    isLiked = json['isLiked'];
    id = json['id'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['date'] = date;
    data['likeCount'] = likeCount;
    data['isLiked'] = isLiked;
    data['id'] = id;
    data['imagePath'] = imagePath;
    return data;
  }
}
