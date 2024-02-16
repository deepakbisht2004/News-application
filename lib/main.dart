import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/homescreen.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/authentications/login_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp (
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const NewsApp());
}

 class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
 @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
   debugShowCheckedModeBanner: false,
   theme: ThemeData.light(useMaterial3: true),
       home:FirebaseAuth.instance.currentUser!=null? Homescreen(): LoginPage()
    );
  }
}