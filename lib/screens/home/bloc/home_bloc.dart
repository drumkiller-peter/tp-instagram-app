import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tp_instagram_app/models/post/post_model.dart';
import 'package:tp_instagram_app/repository/post_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeAddPostRequested>((event, emit) async {
      emit(HomeLoading());

      try {
        var result = await imagePicker.pickImage(source: ImageSource.gallery);

        if (result != null) {
          var imageUploadedPath = await postRepository.uploadMedia(
            imageFile: File(result.path),
            fileName: "myImage${DateTime.now().millisecondsSinceEpoch}",
          );
          PostModel postModel = PostModel(
            title: "This is my title ${DateTime.now().millisecondsSinceEpoch}",
            description: "This is description",
            date: DateTime.now(),
            isLiked: false,
            likeCount: 17,
            id: DateTime.now().millisecondsSinceEpoch,
            imagePath: imageUploadedPath,
          );
          await postRepository.addPosts(postModel);

          add(HomeDataFetchRequested());
        }
      } catch (e) {
        log(e.toString());
        emit(
          HomeFailure(error: e.toString()),
        );
      }
    });

    on<HomeDataFetchRequested>((event, emit) async {
      emit(HomeLoading());
      var response = await postRepository.fetchPosts();
      emit(
        HomeLoaded(posts: response),
      );
    });

    on<HomeLikeEditRequested>((event, emit) async {
      emit(HomeLoading());
      try {
        await postRepository.addLike(event.id);
        add(HomeDataFetchRequested());
      } catch (e) {
        log(e.toString());
      }
    });
  }

  PostRepository postRepository = PostRepositoryImpl();
  ImagePicker imagePicker = ImagePicker();
}
