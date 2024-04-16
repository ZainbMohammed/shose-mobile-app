import 'package:http/http.dart' as http;

import 'dart:convert';

class Info {
  getReq(String url) async {
    try{
      var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      return resBody;
    } else {
      print('error ${res.statusCode}');
    }
    }catch(e){
            print('error catch $e');

    }
  }

  postReq(String url,Map data) async {
    try{
      var res = await http.post(Uri.parse(url),body: data);
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      return resBody;
    } else {
      print('error ${res.statusCode}');
    }
    }catch(e){
            print('error catch $e');

    }
  }
}
