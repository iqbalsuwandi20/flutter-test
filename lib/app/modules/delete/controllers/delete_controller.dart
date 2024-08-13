import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DeleteController extends GetxController {
  var data = "data not found".obs;

  Future<void> fetchData() async {
    var response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    Map<String, dynamic> mybody = json.decode(response.body);
    data.value =
        "AKUN : ${mybody['data']['first_name']} ${mybody['data']['last_name']}";
  }

  Future<void> deleteData() async {
    var response =
        await http.delete(Uri.parse("https://reqres.in/api/users/2"));
    if (response.statusCode == 204) {
      data.value = "Berhasil menghapus data";
    }
  }
}
