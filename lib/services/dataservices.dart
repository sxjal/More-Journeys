import "dart:convert";
import "dart:io";

import "package:http/http.dart" as http;

class DataService {
  String baseurl = "http://mark.bslmeiyu.com/api";
  void getInfo() async {
    var apiUrl = '/getplaces';

    final response = await http.get(Uri.parse(baseurl + apiUrl));

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        
      }
    } catch (e) {
      print(response.statusCode);
      print(e);
    }
  }
}
