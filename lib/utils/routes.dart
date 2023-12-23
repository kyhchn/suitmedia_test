import 'package:get/get_navigation/get_navigation.dart';
import 'package:suitmedia_test/bindings/third_screen_binding.dart';
import 'package:suitmedia_test/views/pages/first_screen.dart';
import 'package:suitmedia_test/views/pages/second_screen.dart';
import 'package:suitmedia_test/views/pages/third_screen.dart';

class Routes {
  static const String first = "/";
  static const String second = "/second";
  static const String third = "/third";

  static List<GetPage> routes = [
    GetPage(
      name: first,
      page: () => const FirstScreen(),
    ),
    GetPage(
      name: second,
      page: () => const SecondScreen(),
    ),
    GetPage(
      name: third,
      page: () => const ThirdScreen(),
      binding: ThirdScreenBinding(),
    )
  ];
}
