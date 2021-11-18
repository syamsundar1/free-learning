import 'package:flutter/material.dart';
import 'package:free_online_learning/screens/register.dart';
import 'package:http/http.dart' as http; 

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            TextFormField(
              controller: emailcontroller,
              decoration: const InputDecoration(
                labelText: "email",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.email)
              ),
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              controller: passcontroller,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "email",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.password)
              ),
            ),
            OutlinedButton.icon(onPressed: (){login();}, icon: Icon(Icons.login), label: Text("LOGIN")),
          ],),
        ),
      ),
    );
  }
  Future<void> login() async{
    var response = await http.post(Uri.parse("https://free-online-learning.herokuapp.com/user/login"),
    body: {'email':emailcontroller.text,'password':passcontroller.text}
    );
    if(response.statusCode==200){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
    }
    else{
      // ignore: avoid_print
      print("error");
    }
  }
}