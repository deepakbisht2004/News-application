import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingNews extends StatelessWidget {
  final  String title;
  final String image;
  final String description;

  const TrendingNews({Key? key, required this.image, required this.description,
  required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 6,bottom: 10),
      child: Material(
        elevation: 2,
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(3), // Add a border radius to ClipRRect
              child: CachedNetworkImage(
                imageUrl: '$image',
                width:Get.width *0.34,
                height: Get.height *0.16, 
                fit: BoxFit.cover, 
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        '$title',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        maxLines: 2,
                    
                      ),

                      Text(
                        '$description',
                        style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                       // Limit the number of lines for description
                     // Handle overflow
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
