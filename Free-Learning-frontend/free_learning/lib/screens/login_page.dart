// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:free_learning/network/auth.dart';
import 'package:free_learning/network/network_handler.dart';
import 'package:free_learning/screens/courses.dart';
import 'package:free_learning/screens/register.dart';
import 'package:http/http.dart';

// ignore: unused_element
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _netork_handler = Networkhandler();
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

  
    return  Scaffold(
      appBar: AppBar(
        title: Row(children: const [
          Text('Free',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),),
          SizedBox(width: 8.0,),
          Text('Learning',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.white),),
        ],),
        centerTitle: true,
        elevation: 0.0,
      ),
      // ignore: prefer_const_constructors
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Center(
            child: const Text('Get Started',
            style: TextStyle(fontSize: 30.0),
            ),
            
          ),
          const SizedBox(height: 30.0,),
           TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your email',
            ),
          ),
           TextFormField(
             controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your password',
            ),
          ),





          // ElevatedButton(onPressed: (){
          //                   Auth().login(
          //                     email: _emailController.text.trim(), 
          //                     password: _passwordController.text.trim(), 
          //                     onSuccess: (){
          //                      Navigator.push(
          //                    context,
          //                    MaterialPageRoute(builder: (context) => const Register()),
          //                      );
          //                     }, 
          //                     onError: (err){
          //                      // ignore: avoid_print
          //                      print('ERROR');
          //                     }
          //                   );
          //                 }, 


          ElevatedButton(onPressed: () async{
            var response = await http.post(Uri.parse("https://free-online-learning.herokuapp.com/user/login"),body: {"email":_emailController.text.trim(),"password":_passwordController.text.trim()});
            if(response.statusCode==200 || response.statusCode==201){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Register()),
              );
                    }    
                    else{
                      print("something went worng");
                    }
          },

                          child: 
          const Text('Login',style: TextStyle(fontSize: 20.0),),
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(width: 100.0,),
              const Text('dont have account?',style: TextStyle(fontSize: 16.0),),
              InkWell(
                onTap: (){
                   Navigator.push(
                  context,
                      MaterialPageRoute(builder: (context) => const Register()),
                          );
                },
                child: const Text('Register',style: TextStyle(fontSize: 16.0,color: Colors.blue),)),
            
            ],
          )
        ],
      ),
    );
  }
}

