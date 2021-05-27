import 'package:http/http.dart' as http;

import 'package:meta/meta.dart';

class NetworkClient {
  final http.Client httpClient;
  final String baseUrl =
      'https://hiit.ria.rocks/videos_api/cdn/com.rstream.crafts?versionCode=40&lurl=Canvas%20painting%20ideas';
  NetworkClient({@required this.httpClient});

  Future<String> fetchJsonString() async {
    final newsUrl = '$baseUrl';
    final newsResponse = await httpClient.get(newsUrl);
    if (newsResponse.statusCode != 200) {
      throw Exception('Error Fetching Data...');
    }
    return newsResponse.body;
  }
}
