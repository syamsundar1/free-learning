import 'package:flutter/material.dart';
import 'package:free_learning/network/auth.dart';
import 'package:free_learning/screens/courses.dart';
import 'package:free_learning/screens/login_page.dart';
import 'package:free_learning/screens/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLogged = await Auth().isLogged();
  runApp(MyApp(isLogged));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp(this.isLogged);
  // ignore: prefer_typing_uninitialized_variables
  final isLogged;
  // const MyApp(bool isLogged, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Free Learning',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home:  isLogged?const Courses(): const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  

    return const LoginPage();
  }
}