part of 'save_bloc.dart';

@immutable
abstract class SaveState {}

class SaveInitial extends SaveState {}

class SaveLoad extends SaveState {
  final List<NewsModel> newsList;
  SaveLoad({@required this.newsList});
}

class SaveLoading extends SaveState {}

class SaveError extends SaveState {}
