import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:test_space/models/dataModel.dart';

class apiDecoder {
  Future getDataModel() async {
    var client = http.Client();

    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var json = res.body;
      return dataModelFromJson(json);
    }
    throw Exception();
  }
}
