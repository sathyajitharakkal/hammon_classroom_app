part of 'index_cubit.dart';

@immutable
abstract class IndexState {}

class IndexInitial extends IndexState {}
class IndexLoading extends IndexState {}
class IndexLoaded extends IndexState {
  final List<Subject> subjetList;
  IndexLoaded({required this.subjetList});
}
class IndexError extends IndexState {}


