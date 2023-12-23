import 'package:get/get_navigation/get_navigation.dart';
import 'package:suitmedia_test/views/first_screen.dart';

class Routes{
  static const String first ="/";
  static const String second ="/second";
  static const String third ="/third";

  static List<GetPage> routes = [
    GetPage(name: first, page: () => const FirstScreen(),)
  ];
}