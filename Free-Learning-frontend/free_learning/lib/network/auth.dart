import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:free_learning/network/network_handler.dart';


class Auth {
  void login({required String email, required String password, required Function() onSuccess, required Function(String err) onError}) async {
    Map<String,dynamic> body={
      "email":email,
      "password":password,
    };
    try{
      var response = await Networkhandler().post("auth/login", body);
      print(response.body);
      if(response.statusCode == 200 || response.statusCode == 201){
        Map<String,dynamic> output = json.decode(response.body);
        await const FlutterSecureStorage().write(key: "token", value: output["token"]);
        onSuccess();
      }else{
        onError("Error");

      }
    }catch (err){
      print(err);
      onError("Error");
    }
  }

  void signup({required String name, required String email,  required String password, required Function() onSuccess, required Function(String err) onError}) async {
    Map<String,dynamic> body={
      "email":email,
      "password":password,
      "username":name,
      // "phone":phone,
      // "confpassword":cPassword
    };

    try{
      var response = await Networkhandler().post("auth/register", body);
      print(response.body);
      if(response.statusCode == 200 || response.statusCode == 201){
        Map<String,dynamic> output = json.decode(response.body);
        await const FlutterSecureStorage().write(key: "token", value: output["token"]);
        onSuccess();
      }else{
        onError("Error");
      }
    }catch (err){
      print(err);
      onError("Error");
    }
  }

  Future<bool> isLogged() async{
    String? token = await const FlutterSecureStorage().read(key: 'token');
    if(token==null){
      return false;
    }
    return true;
  }
}