part of 'subject_cubit.dart';

@immutable
abstract class SubjectState {}

class SubjectInitial extends SubjectState {}
class SubjectLoading extends SubjectState {}
class SubjectLoaded extends SubjectState {
  final List<Subject> subjectList;
  SubjectLoaded({required this.subjectList});
}
class SubjectError extends SubjectState {
  final String errorMessage;
  SubjectError({required this.errorMessage});
}

