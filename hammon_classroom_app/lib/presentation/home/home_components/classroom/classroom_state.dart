part of 'classroom_cubit.dart';

@immutable
abstract class ClassroomState {}

class ClassroomInitial extends ClassroomState {}
class ClassroomLoading extends ClassroomState {}
class ClassroomLoaded extends ClassroomState {
  final List<Classroom> classroomList;
  ClassroomLoaded({required this.classroomList});
}
class ClassroomError extends ClassroomState {
  final String errorMessage;
  ClassroomError({required this.errorMessage});
}

