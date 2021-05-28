import 'package:http/http.dart' as http;

import 'package:meta/meta.dart';

class CommentClient {
  final http.Client httpClient;
  final String baseUrl = 'http://cookbookrecipes.in/test.php';
  CommentClient({@required this.httpClient});

  Future<String> fetchJsonString() async {
    final commentUrl = '$baseUrl';
    final commentResponse = await httpClient.get(commentUrl);
    if (commentResponse.statusCode != 200) {
      throw Exception('Error Fetching Data...');
    }
    return commentResponse.body;
  }
}
