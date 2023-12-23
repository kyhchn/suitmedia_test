import 'package:suitmedia_test/injection_container.dart';
import 'package:suitmedia_test/models/user.dart';
import 'package:suitmedia_test/utils/request.dart';

class UserService {
  Future<List<User>> getUser(int page, int limit) async {
    final request = sl<Request>();
    final response = await request.dio.get("/users?page=$page&per_page=$limit");
    final data = response.data['data'] as List<dynamic>;
    final users = data.map((e) => User.fromJson(e)).toList();
    return users;
  }
}
