part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<PostModel> posts;

  HomeLoaded({required this.posts});
}

final class HomeFailure extends HomeState {
  final String error;

  HomeFailure({required this.error});
}
