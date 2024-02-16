
import 'package:flutter/material.dart';
import 'package:news_app/pages/categorynews.dart';
import 'package:news_app/models/Showcategorymodel.dart';
import 'package:news_app/Apicalls/showcategorydata.dart';

class ShowCategoryclass extends StatefulWidget {
  final String choosencategory;
  ShowCategoryclass({super.key,
   required this.choosencategory,
   });

  @override
  State<ShowCategoryclass> createState() => _ShowCategoryState();
}
class _ShowCategoryState extends State<ShowCategoryclass> {
   List<ShowCategoryModel> Showcategory = [];
 @override
  void initState() {
     super.initState();
  }
  Future<void> getShowcategory() async {
 try {  
      ShowCategory showcategoryservice =  ShowCategory();
          await showcategoryservice.getsShowcategoryApi(widget.choosencategory);
      setState(() {
        Showcategory = showcategoryservice.category;
      });
    } catch (error) {
      print('Error fetching news: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    getShowcategory();
    return Scaffold(
      appBar: AppBar(
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
          widget.choosencategory,
            style: TextStyle(fontSize: 26,color: Colors.black),
          ),
          ],
      ),
      centerTitle: true,
    ),
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: Showcategory.length,
          itemBuilder: (context,index){
            return categorynews(image: Showcategory[index].image!, description: Showcategory[index].description!, title: Showcategory[index].title!);
          },
           ),
        ),
      );
    
  }
}