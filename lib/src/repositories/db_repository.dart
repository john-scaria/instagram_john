import 'package:instagram_john/src/models/news_model.dart';
import 'package:instagram_john/src/repositories/db_client.dart';
import 'package:meta/meta.dart';

class DbRepository {
  final DbClient dbClient;
  DbRepository({@required this.dbClient});

  bool addCache(NewsModel newsModel) => dbClient.insertCache(newsModel);

  List<NewsModel> getCache() => dbClient.readCache();

  bool removeCache(NewsModel newsModel) => dbClient.deleteCache(newsModel);
}
