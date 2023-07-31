import "dart:io";

import "package:http/http.dart" as http;

class DataService {
  String baseurl = "http://mark.bslmeiyu.com/api";
  void getInfo() async {
    var apiUrl = '/getPlaces';

    final response = await http.get(Uri.parse(baseurl + apiUrl));
  }
}
