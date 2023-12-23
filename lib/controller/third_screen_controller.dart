import 'package:get/get.dart';
import 'package:suitmedia_test/injection_container.dart';
import 'package:suitmedia_test/models/user.dart';
import 'package:suitmedia_test/services/user_service.dart';

class ThirdScreenController extends GetxController {
  static ThirdScreenController get i => Get.find();
  int _index = 1;
  final _limit = 10;
  final isLoading = false.obs;
  final hasMore = true.obs;
  final List<User> users = <User>[].obs;
  final service = sl<UserService>();
  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final result = await service.getUser(_index, _limit);
    if (result.length < _limit) {
      hasMore(false);
    }
    users.addAll(result);
    isLoading.value = false;
  }

  void nextPage() {
    if (hasMore.value) {
      _index++;
      fetchUser();
    }
  }

  void reset() {
    _index = 1;
    users.clear();
    hasMore(true);
    fetchUser();
  }
}
