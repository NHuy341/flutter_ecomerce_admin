import 'package:admin/features/authentication/controllers/user_controller.dart';
import 'package:admin/features/shop/controllers/customer/customer_controller.dart';
import 'package:admin/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    //Core
    Get.lazyPut(() => NetworkManager(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
    Get.put(CustomerController(), permanent: true);
  }
}
