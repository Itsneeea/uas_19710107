import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app_uas/model/article_model.dart';

class ApiService {
  final endPointurl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'q': 'automotive',
      'apiKey': 'd2792b74b65243bc99ff08be49ebb413'
    };

    final uri = Uri.https(endPointurl, '/v2/everything', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}

class ApiService2 {
  final endPointurl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'country': 'id',
      'category': 'sports',
      'apiKey': 'd2792b74b65243bc99ff08be49ebb413'
    };

    final uri = Uri.https(endPointurl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
