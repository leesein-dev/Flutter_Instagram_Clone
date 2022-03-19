// GetX 콘트롤러들을 필요에 따라 인스턴스 위에 올려주기 위한 클래스

import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
  }
}
