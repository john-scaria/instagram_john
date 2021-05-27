import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:instagram_john/src/models/news_model.dart';
import 'package:instagram_john/src/repositories/network_repository.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NetworkRepository networkRepository;
  NewsBloc({@required this.networkRepository}) : super(NewsInitial());

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is InitTriggerEvent) {
      yield NewsLoading();
      try {
        final String jsonString = await networkRepository.getJsonString();
        final List<NewsModel> newsList =
            networkRepository.jsonParser(jsonString);
        yield NewsLoaded(newsList: newsList);
      } catch (_) {
        yield NewsError();
      }
    }
  }
}
