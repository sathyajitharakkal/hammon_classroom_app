part of 'student_details_cubit.dart';

@immutable
abstract class StudentDetailsState {}

class StudentDetailsInitial extends StudentDetailsState {}
class StudentDetailsLoaded extends StudentDetailsState {
  final Students students;
  StudentDetailsLoaded({required this.students});
}
class StudentDetailsLoading extends StudentDetailsState {}
class StudentDetailsError extends StudentDetailsState {}


