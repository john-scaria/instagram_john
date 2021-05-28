import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:instagram_john/src/models/comment_model.dart';
import 'package:meta/meta.dart';

import 'comment_client.dart';

class CommentRepository {
  final CommentClient commentClient;
  CommentRepository({@required this.commentClient});

  Future<String> getJsonString() => commentClient.fetchJsonString();

  List<CommentModel> jsonParser(String jsonString) {
    try {
      final commentJson = jsonDecode(jsonString).cast<Map<String, dynamic>>();
      return commentJson
          .map<CommentModel>((json) => CommentModel.fromJson(json))
          .toList();
    } catch (_) {
      return [];
    }
  }
}
