import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
