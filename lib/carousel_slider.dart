import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class carousel_slider  extends StatelessWidget {
  final image;
  final description;
  carousel_slider({this.image,this.description});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.elliptical(8, 8)
      ,bottomLeft:Radius.elliptical(8, 8),topRight: Radius.elliptical(8, 8),
      bottomRight: Radius.elliptical(8, 8) ),
      
      child: Stack(
        children: [
          Container(
         child: CachedNetworkImage(
          imageUrl:
          image,fit: BoxFit.cover,width: Get.width,),
        ),
        Container(
          height: Get.height,
          width: Get.width,
          margin: EdgeInsets.only(top: 140),
          color: Colors.black87.withOpacity(
            0.6
          ),
          child: Center(
            child: Text(description,style: TextStyle(color:
            Colors.white,fontSize: 23),),
          ),
        )
        ]
      ),
    );
  }
}