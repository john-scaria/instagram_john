import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:instagram_john/src/models/news_model.dart';
import 'package:meta/meta.dart';

import 'network_client.dart';

class NetworkRepository {
  final NetworkClient networkClient;
  NetworkRepository({@required this.networkClient});

  Future<String> getJsonString() => networkClient.fetchJsonString();

  List<NewsModel> jsonParser(String jsonString) {
    try {
      final newsJson = jsonDecode(jsonString).cast<Map<String, dynamic>>();
      return newsJson
          .map<NewsModel>((json) => NewsModel.fromJson(json))
          .toList();
    } catch (_) {
      return [];
    }
  }
}
