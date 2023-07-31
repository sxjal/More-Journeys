import "dart:convert";

import "package:http/http.dart" as http;
import "package:morejourneys/models/datamodel.dart";

class DataService {
  String baseurl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';

    final response = await http.get(Uri.parse(baseurl + apiUrl));

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else
        return <DataModel>[];
    } catch (e) {
      print(response.statusCode);
      print(e);
      return <DataModel>[];
    }
  }
}
