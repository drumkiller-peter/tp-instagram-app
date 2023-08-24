// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

sealed class HomeEvent {}

class HomeDataFetchRequested extends HomeEvent {}

class HomeAddPostRequested extends HomeEvent {}

class HomeLikeEditRequested extends HomeEvent {
  int id;
  HomeLikeEditRequested({
    required this.id,
  });
}
