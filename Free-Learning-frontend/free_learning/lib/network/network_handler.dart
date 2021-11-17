import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class Networkhandler{
  FlutterSecureStorage storage = const FlutterSecureStorage();
  var baseurl = "https://free-learning-backend.herokuapp.com/";
  Logger log = Logger();

  

  // Future<dynamic> get(String url) async{
  Future get(String url) async{
    String? token = await storage.read(key: "token");
    url = formater(url);
    Map<String, String> requestHeaders = {
       'Content-type': 'application/json',
       'Accept': 'application/json',
       'x-auth-token': '$token'
     };
    // ignore: avoid_print
    print(requestHeaders);
    var response = await http.get(Uri.parse(url,),headers: requestHeaders);
    // var response = await http.get(Uri.parse(url,),headers: {"Authorization":"Bearer $token"});
    log.i(response.body);
    log.i(response);
    return response;
  }

  Future post(String url, Map<String,dynamic> body) async{
    url = formater(url);
    var response = await http.post(Uri.parse(url),body: body);
    return response;
   
  }

  String formater(String url){
    return baseurl+url;
  }

}