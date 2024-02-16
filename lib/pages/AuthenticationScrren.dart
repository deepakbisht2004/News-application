import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/homescreen.dart';

class Initaialpage extends StatelessWidget {
  const Initaialpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      child: Center(
        child: Container(
 
          width: MediaQuery.of(context).size.width *0.90,
          height:  MediaQuery.of(context).size.height *0.87,
       
          child: Column(
          
            
            children: <Widget>[
              const Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Apna",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500 ),),
        Text("News",style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),)],),
               Image(image: AssetImage("assets/images/cartooonimage.webp"),
              width: MediaQuery.of(context).size.width *0.9,
              fit: BoxFit.cover,
               height: MediaQuery.of(context).size.height *0.6,),
              Text("Welcomes Sir",style: TextStyle(
                fontSize: 30,wordSpacing:2,fontWeight: FontWeight.bold
              ),) ,
              SizedBox(height: 50,) ,
                ClipRRect(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(14),
                  right:Radius.circular(14), ),
                  child: InkWell(
                    onTap: (){
                      Get.to((Homescreen()));
                    },
                    child: Container(
                      width: Get.width,
                       height:Get.height *0.09,

                     color: Color.fromRGBO(0,19,222,0.9),
                     child: Center(child: Text("Get Started",style: TextStyle(
                      fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500
                     ),)),
                    ),
                  ),
                )
             
            ],
          ),
        ),
      ),
    ),
    );

  }
}