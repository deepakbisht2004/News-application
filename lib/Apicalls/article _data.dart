import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/Articlemodel.dart';

class News {
  List<articlemodel> trending = [];

  Future<void> getApi() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3eaa7a86ca9a47fbb2183b4d402da4a4";
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    try {
      if (json['status'] == "ok") {
        json['articles'].forEach((element) {
          if (element['urlToImage'] != null && element["description"] != null) {
            articlemodel article = articlemodel(
              title: element['title'],
              content: element['content'],
              description: element['description'],
               urlTOimage: element["urlToImage"],
            );
            trending.add(article);
         
          }
        });
      }
    } catch (error) {
      print('$error');
    }
  }
}
