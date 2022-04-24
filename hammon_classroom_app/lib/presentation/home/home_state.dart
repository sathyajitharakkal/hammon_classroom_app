part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<Subject> subjetList;
  HomeLoaded({required this.subjetList});
}
class HomeError extends HomeState {
  final String errorMessage;
  HomeError({required this.errorMessage});
}


