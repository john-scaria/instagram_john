import 'package:flutter/material.dart';

class CommentModel {
  final String userName;
  final String comment;
  CommentModel({
    @required this.userName,
    @required this.comment,
  });
  CommentModel.fromJson(Map<String, dynamic> commentMap)
      : userName = commentMap['username'],
        comment = commentMap['comments'];
}
