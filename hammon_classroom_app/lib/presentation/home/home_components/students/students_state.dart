part of 'students_cubit.dart';

@immutable
abstract class StudentsState {}

class StudentsInitial extends StudentsState {}
class StudentsLoading extends StudentsState {}
class StudentsLoaded extends StudentsState {
  final List<Student> studentList;
  StudentsLoaded({required this.studentList});
}
class StudentsError extends StudentsState {
  final String errorMessage;
  StudentsError({required this.errorMessage});
}