
import 'package:news_app/models/Showcategorymodel.dart';


import 'dart:convert';

import 'package:http/http.dart' as http;
class ShowCategory{
   List<ShowCategoryModel> category = [];
 Future<void> getsShowcategoryApi( String categoryname) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$categoryname&apiKey=3eaa7a86ca9a47fbb2183b4d402da4a4";
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    try {
      if (json['status'] == "ok") {
        json['articles'].forEach((element) {
          if (element['urlToImage'] != null && element["title"] != null) {
            ShowCategoryModel ShowCategory = ShowCategoryModel(
              title:element['title'],
              image: element["urlToImage"],
              description: element['description']
            );
            category.add(ShowCategory);
         
          }
        });
      }
    } catch (error) {
      print('$error');
    }
  }
}
