import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  void logout() => Get.offNamed(Routes.LOGIN);
}
