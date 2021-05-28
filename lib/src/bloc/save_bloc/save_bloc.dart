import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:instagram_john/src/models/news_model.dart';
import 'package:instagram_john/src/repositories/db_repository.dart';
import 'package:meta/meta.dart';

part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  final DbRepository dbRepository;
  SaveBloc({@required this.dbRepository}) : super(SaveInitial());

  @override
  Stream<SaveState> mapEventToState(
    SaveEvent event,
  ) async* {
    if (event is SaveInitEvent) {
      yield SaveLoading();
      final List<NewsModel> _newsList = dbRepository.getCache();
      yield SaveLoad(newsList: _newsList);
    }
    if (event is SaveItemEvent) {
      yield SaveLoading();
      dbRepository.addCache(event.newsModel);
      final List<NewsModel> _newsList = dbRepository.getCache();
      yield SaveLoad(newsList: _newsList);
    }
    if (event is UnSaveItemEvent) {
      yield SaveLoading();
      dbRepository.removeCache(event.newsModel);
      final List<NewsModel> _newsList = dbRepository.getCache();
      yield SaveLoad(newsList: _newsList);
    }
  }
}
