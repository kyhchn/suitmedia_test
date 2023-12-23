import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:suitmedia_test/injection_container.dart';
import 'package:suitmedia_test/utils/colors.dart';
import 'package:suitmedia_test/utils/routes.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Suitmedia Test',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            shape: Border(
              bottom: BorderSide(color: Color(0xFFE2E3E4), width: 0.5),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
                color: SuitmediaColor.black,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          fontFamily: "Poppins",
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: SuitmediaColor.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        getPages: Routes.routes,
        initialRoute: Routes.first,
      ),
    );
  }
}
