part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<Student> studentList;
  final List<Classroom> classroomList;
  final List<Subject> subjetList;
  HomeLoaded({required this.subjetList, required this.classroomList, required this.studentList});
}
class HomeError extends HomeState {
  final String errorMessage;
  HomeError({required this.errorMessage});
}


