import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class  categorynews extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const categorynews({super.key,
  required this.image,
  required this.description,
  required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
   
      width: Get.width,
      height: Get.height *0.57,
     padding: EdgeInsets.only(left: 10,right: 10,top: 10),
      child: Material(
        elevation: 2,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(2), // Add a border radius to ClipRRect
              child: CachedNetworkImage(
                imageUrl: '$image',
                width:Get.width *1,
                height: Get.height *0.30, 
                fit: BoxFit.cover, 
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
               
                child: Column(
                  
                  children: [
                     Text(
                      '$title',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  
                    ),
                       
                    Text(
                      '$description',
                      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                   
                 
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}