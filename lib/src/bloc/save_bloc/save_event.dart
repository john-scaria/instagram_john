part of 'save_bloc.dart';

@immutable
abstract class SaveEvent {}

class SaveInitEvent extends SaveEvent {}

class SaveItemEvent extends SaveEvent {
  final NewsModel newsModel;
  SaveItemEvent({@required this.newsModel});
}
