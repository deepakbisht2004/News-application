import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/homescreen.dart';
import 'package:news_app/authentications/login_screen.dart';
import 'package:news_app/pages/AuthenticationScrren.dart';

class AuthenticationController extends GetxController {
  final username = TextEditingController().obs;
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final cpassword = TextEditingController().obs;

  Future<void> signUp() async {
    if (password.value.text == cpassword.value.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.value.text.trim(),
          password: password.value.text.trim(),
        );
       Get.to(Initaialpage());
      } catch (error) {
        // Handle specific errors if needed
        print("Signup failed: $error");
        Get.snackbar("Signup Failed", "An error occurred while signing up",
            colorText: Colors.red);
      }
    } else {
      Get.snackbar("Passwords Don't Match", "Please correct the passwords",
          colorText: Colors.green);
    }
  }

 Future<void> login() async {
  try {
     await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.value.text.trim(), 
      password: password.value.text.trim()
    );

    navigateToHomeScreen();
  } catch (e) {
    print("Login failed: $e");
  
    Get.snackbar(
      "Login Failed", 
      "An error occurred while logging in",
      colorText: Colors.red
    );
  }
}

void navigateToHomeScreen() {
 Get.off(() => Homescreen());
}

Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    navigateToLoginPage();
  } catch (error) {
    print("Error occurred: $error");
  }
}

void navigateToLoginPage() {
  Get.off(() => LoginPage());
}
   
  void Diologfunction(){
   Get.dialog(
      AlertDialog(
      
        title: Text('Sign Out'),
        content: Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () {
                 Get.back(result: true);
                  },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
               signOut();
             
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
      
    
  }


}


