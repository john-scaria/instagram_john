part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsModel> newsList;
  NewsLoaded({@required this.newsList});
}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {}
