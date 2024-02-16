
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/slidermodel.dart';


class sliderrrr {
  List<slidermodel> slider = [];

  Future<void> getsliderApi() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=3eaa7a86ca9a47fbb2183b4d402da4a4";
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    try {
      if (json['status'] == "ok") {
        json['articles'].forEach((element) {
          if (element['urlToImage'] != null && element["title"] != null) {
            slidermodel slidermodell = slidermodel(
              description:  element['title'],
              image: element["urlToImage"],
            );
            slider.add(slidermodell);
         
          }
        });
      }
    } catch (error) {
      print('$error');
    }
  }
}
