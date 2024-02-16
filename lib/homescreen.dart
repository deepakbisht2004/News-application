

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/categoryTile.dart';
import 'package:news_app/carousel_slider.dart';
import 'package:news_app/controllers/Getxcontroller.dart';
import 'package:news_app/models/Articlemodel.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/slidermodel.dart';
import 'package:news_app/Apicalls/article%20_data.dart';
import 'package:news_app/Apicalls/categorydata.dart';


import 'package:news_app/Apicalls/sliderdata.dart';
import 'package:news_app/trendingNews.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  AuthenticationController controller = Get.put(AuthenticationController());

  List<CategoryModel> category = [];
  List<slidermodel> sliders = [];
  List<articlemodel> articles = [];
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    category = getCategories();
     getSlider();
    getnews();

  }

 Future<void> getSlider() async {
    sliderrrr sliderservice =sliderrrr();
    try {
      await sliderservice.getsliderApi();
      setState(() {
          sliders = sliderservice.slider;
      });
       
    } catch (error) {
      print('Error fetching news: $error');
    }
  }
  Future<void> getnews() async {
    News newsService = News();
    try {
      await newsService.getApi();
      setState(() {
         articles = newsService.trending;
      });
     
    } catch (error) {
      print('Error fetching news: $error');
    }
  }

 
 @override
Widget build(BuildContext context) {
   if (sliders.isEmpty || articles.isEmpty ) {
    return Center(
      child:const  CircularProgressIndicator(backgroundColor: Colors.purple,color: Colors.white,), // Or any other loading indicator
    );
  }

  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      elevation: 0.0,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( "Apna",style: TextStyle(fontSize: 26), ),
           Text( "News", style: TextStyle( fontSize: 26,fontWeight: FontWeight.bold,color: Colors.blue, ),
          ),
        ],
      ),
      actions: [InkWell(onTap:(){
       controller.Diologfunction();
      } ,
        child: Icon(Icons.logout,size: 30,))
        
      ],
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: category.length,
              itemBuilder: (context, index) {
                return Categorytile(
                  image: category[index].image!,
                  title: category[index].categoryName!,
                );
              },
            ),
          ),
          SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "𝙗𝙧𝙚𝙖𝙠𝙞𝙣𝙜 𝙣𝙚𝙬𝙨",
                  style: TextStyle(fontSize: 27),
                ),
                Text(
                  "​View All",
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          CarouselSlider.builder(
            itemCount: sliders.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              print(sliders.length);
              final res = sliders[index].image!;
              return carousel_slider(
                image: res,
                description: sliders[index].description!,
              );
            },
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              onPageChanged: (index, reason) {
              activeIndex = index;}
            ),
          ),
          SizedBox(height: 17),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: sliders.length,
              effect: const SlideEffect(
                spacing: 8.0,
                radius: 12.0,
                dotWidth: 15.0,
                dotHeight: 16.0,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: Colors.indigo,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Trending News",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
                Text(
                  "​View All",
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return TrendingNews(
                title: articles[index].title!,
                image: articles[index].urlTOimage!,
                description: articles[index].description!,
              );
            },
          ),
        ],
      ),
    ),
  );
}

    
}

