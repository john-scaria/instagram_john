import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'news_model.g.dart';

@HiveType(typeId: 1)
class NewsModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String channelName;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String photoUrl;

  NewsModel({
    @required this.id,
    @required this.channelName,
    @required this.title,
    @required this.photoUrl,
  });

  NewsModel.fromJson(Map<String, dynamic> newsMap)
      : id = newsMap['id'],
        channelName = newsMap['channelname'],
        title = newsMap['title'],
        photoUrl = newsMap['high thumbnail'];
}
