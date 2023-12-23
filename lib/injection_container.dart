import 'package:get_it/get_it.dart';
import 'package:suitmedia_test/services/user_service.dart';
import 'package:suitmedia_test/utils/request.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Request>(Request());
  sl.registerSingleton<UserService>(UserService());
}
