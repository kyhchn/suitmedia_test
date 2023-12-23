import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/utils/constant/colors.dart';
import 'package:suitmedia_test/views/widgets/suitmedia_button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final String userName = Get.arguments["userName"];
    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(color: Color(0xFFE2E3E4), width: 0.5),
        ),
        leading: const Icon(Icons.arrow_back_ios,
            color: Color(0xFF554AF0), size: 24),
        title: const Text("Second Screen"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 16, bottom: 32, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                      color: SuitmediaColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'John Doe',
                  style: TextStyle(
                      color: SuitmediaColor.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Center(
              child: Text(
                userName,
                style: TextStyle(
                    color: SuitmediaColor.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SuitmediaButton(
              text: 'Choose a User',
              onPressed: () => null,
            )
          ],
        ),
      ),
    );
  }
}
