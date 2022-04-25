part of 'classroom_details_cubit.dart';

@immutable
abstract class ClassroomDetailsState {}

class ClassroomDetailsInitial extends ClassroomDetailsState {}
class ClassroomDetailsLoaded extends ClassroomDetailsState {
  final Classroom classroom;
  ClassroomDetailsLoaded({required this.classroom});
}
class ClassroomDetailsLoading extends ClassroomDetailsState {}
class ClassroomDetailsError extends ClassroomDetailsState {}


