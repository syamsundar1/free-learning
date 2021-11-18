import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  var totalcourse;

  Future<http.Response> getdata() async{
    var response = http.get(Uri.parse("https://free-online-learning.herokuapp.com/course/data"));
    // var data = response;
    setState(() {
      totalcourse = response;
    });
    // ignore: avoid_print
    // print(response.body);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: ListView.builder(
        itemCount: totalcourse.length,
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            leading: Icon(Icons.cast_for_education),
            title:Text("List item ${totalcourse['coursename']}"),
            );
        }
        ),
      ),
    );
  }
}