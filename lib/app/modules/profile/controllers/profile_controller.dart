import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileController extends GetxController {
  // Observable list of users
  var allUser = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllUser();
  }

  Future<void> getAllUser() async {
    try {
      var response = await http.get(
        Uri.parse("https://reqres.in/api/users?page=2"),
      );

      // Decode response body
      var decodedResponse = json.decode(response.body) as Map<String, dynamic>;

      // Check if 'data' is a list
      if (decodedResponse['data'] is List) {
        List<dynamic> data = decodedResponse['data'];

        // Convert dynamic list to List<Map<String, dynamic>>
        List<Map<String, dynamic>> userList =
            List<Map<String, dynamic>>.from(data);

        // Update observable list
        allUser.assignAll(userList);
      } else {
        print("Unexpected format for 'data'");
      }
    } catch (e) {
      // Handle error
      print("Error occurred");
      print(e);
    }
  }
}
