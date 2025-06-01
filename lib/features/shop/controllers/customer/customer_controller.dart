import 'package:get/get.dart';
import 'package:admin/features/authentication/models/user_model.dart';
import '../../../../data/repositories/user/user_repository.dart';

class CustomerController extends GetxController {
  static CustomerController get instance => Get.find();

  final users = <UserModel>[].obs;
  final isLoading = false.obs;

  // Lấy UserRepository từ GetX
  final UserRepository _userRepository = Get.find<UserRepository>();

  CustomerController() {
    print("CustomerController constructor called");
  }

  @override
  void onInit() {
    print("CustomerController onInit called");
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    print("fetchUsers called");
    try {
      isLoading.value = true;
      final userList = await _userRepository.getAllUsers();
      print('Fetched users count: ${userList.length}');
      users.assignAll(userList);
    } catch (e) {
      print('Error fetching customers: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteUserById(String id) async {
    try {
      await _userRepository.deleteUser(id);
      users.removeWhere((user) => user.id == id);
      Get.snackbar('Success', 'Customer deleted successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
