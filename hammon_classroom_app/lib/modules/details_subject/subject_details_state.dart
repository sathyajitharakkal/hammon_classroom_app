part of 'subject_details_cubit.dart';

@immutable
abstract class SubjectDetailsState {}

class SubjectDetailsInitial extends SubjectDetailsState {}
class SubjectDetailsLoaded extends SubjectDetailsState {
  final Subjects subjects;
  SubjectDetailsLoaded({required this.subjects});
}
class SubjectDetailsLoading extends SubjectDetailsState {}
class SubjectDetailsError extends SubjectDetailsState {}
