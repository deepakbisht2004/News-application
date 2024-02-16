import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Showcategory.dart';


class Categorytile extends StatelessWidget {
final String image;
final String title;

  
  Categorytile({
     required this.image, required this.title,});

  @override

  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ShowCategoryclass(choosencategory: title,));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 07),
        
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              child: Container(
                width: 150,
                color: Colors.black.withOpacity(0.4),
                 child: Image.asset(image,width:140, fit: BoxFit.cover,),
               
              ),
            ),
            Container(
              width: 150,
              height:100,
              child: Center(
                child: Text(title,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight:FontWeight.bold),)),
            )
          ],
        ),
      ),
    );
  }
}