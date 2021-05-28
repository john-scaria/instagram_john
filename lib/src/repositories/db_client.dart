import 'package:hive/hive.dart';
import 'package:instagram_john/src/models/news_model.dart';
import 'package:meta/meta.dart';

class DbClient {
  final Box<NewsModel> sBox;
  DbClient({
    @required this.sBox,
  });

  bool insertCache(NewsModel newsModel) {
    try {
      sBox.put(newsModel.id, newsModel);
      return true;
    } catch (_) {
      return false;
    }
  }

  List<NewsModel> readCache() {
    try {
      final List<NewsModel> _newsList = sBox.keys
          .map((e) => sBox.get(e.toString(),
              defaultValue: NewsModel(
                  id: '1',
                  channelName: 'channelName',
                  title: 'title',
                  photoUrl: 'photoUrl')))
          .toList();
      return _newsList;
    } catch (_) {
      return [];
    }
  }

  bool deleteCache(NewsModel newsModel) {
    try {
      sBox.delete(newsModel.id);
      return true;
    } catch (_) {
      return false;
    }
  }
}
