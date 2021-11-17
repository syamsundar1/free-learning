import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  const Courses({ Key? key }) : super(key: key);

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return  Scaffold(
      body:  const Center(child:  Text("data"),),
    );
  }
}