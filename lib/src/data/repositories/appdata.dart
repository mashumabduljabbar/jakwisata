import 'dart:convert';

import 'package:jakwisata/src/data/models/appdata.dart';
import 'package:http/http.dart' as http;

class AppDataRepository {
  Future<List<AppData>> fetchData() async {
    final url = Uri.parse('https://dev.ofon.co.id/learnapi/JakWisataAPI/api.json');
    final response = await http.get(url);
    final List json = jsonDecode(response.body);
    final List<AppData> listAppData = [];
    for (var val in json) {
      listAppData
        .add(AppData(name: val['name'], objek: val['objek']));
    }
    return listAppData;
  }
}
