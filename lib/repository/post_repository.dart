import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tp_instagram_app/config/app_serializer.dart';
import 'package:tp_instagram_app/config/di_setup.dart';
import 'package:tp_instagram_app/data/database/app_database.dart';
import 'package:tp_instagram_app/data/database/home/home_dao.dart';
import 'package:tp_instagram_app/models/post/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> fetchPosts();
  Future<void> addPosts(PostModel postModel);
  Future<void> addLike(int id);
  Future<String> uploadMedia(
      {required File imageFile, required String fileName});
}

class PostRepositoryImpl implements PostRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final HomeDao _homeDao = HomeDao(getIt.get<MyDatabase>());
  @override
  Future<List<PostModel>> fetchPosts() async {
    try {
      var response = await _firebaseFirestore.collection("post").get().then(
            (value) => value.docs.map((e) {
              log(e.data().toString());
              return PostModel.fromJson(
                e.data(),
              );
            }).toList(),
          );

      for (var element in response) {
        await _homeDao.setHomeData(
          HomeCompanion(
            id: Value(element.id),
            title: Value(element.title),
            description: Value(element.description),
            // date: Value(
            //   AppSerializer.timeStampToDateTime(
            //     Timestamp.fromMillisecondsSinceEpoch(
            //         element.date?.millisecondsSinceEpoch ?? 0),
            //   ),
            // ),
            likeCount: Value(element.likeCount),
            imagePath: Value(element.imagePath),
          ),
        );
      }

      final homeData = await _homeDao.getHomeData();

      return homeData;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> addPosts(PostModel postModel) async {
    try {
      log("Here i am $postModel");
      var postCollection = _firebaseFirestore.collection("post");

      await postCollection.doc(postModel.id.toString()).set(postModel.toJson());
      log("Completed");
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> addLike(int id) async {
    _firebaseFirestore.collection("post").doc(id.toString()).update(
      {
        "likeCount": FieldValue.increment(1),
        // "title": "This is my new title",
      },
    );
  }

  // Get the reference to the root folder of your storage and
  // creates a new subfolder using the [fileName] attribute to store the image.

  @override
  Future<String> uploadMedia(
      {required File imageFile, required String fileName}) async {
    final Reference reference = _firebaseStorage.ref().child("media/$fileName");
    UploadTask uploadTask = reference.putFile(imageFile);
    final downloadUrl = (await uploadTask);
    var finalImageUrl = await downloadUrl.ref.getDownloadURL();
    return finalImageUrl;
  }
}
