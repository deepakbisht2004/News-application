import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/Getxcontroller.dart';


import 'package:news_app/authentications/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final AuthenticationController controll = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              
              _forgotPassword(context),
            
            ],
          ),
        ),
      );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter your credential to login"),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: controll.email.value,
          decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none
              ),
              fillColor: Colors.purple.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controll.password.value,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
         controll.login();
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.purple,
          ),
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 20,color: Colors.white),
          ),
        ),
        SizedBox(height: 10,),
        Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have  an account?",
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
          SizedBox(width: 04,),
          GestureDetector(
            onTap: (){
              Get.to(SignupPage());
            },
            child: Text("Signup",style: TextStyle(fontSize:16,color: Colors.blue.withOpacity(0.9) ),))
          ]))
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {
        
      },
      child: const Text("Forgot password?",
        style: TextStyle(color: Colors.purple),
      ),
    );
  }
}