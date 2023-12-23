import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/utils/colors.dart';
import 'package:suitmedia_test/utils/routes.dart';
import 'package:suitmedia_test/views/widgets/suitmedia_button.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String userName = Get.arguments["userName"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(color: Color(0xFFE2E3E4), width: 0.5),
        ),
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Get.back(),
          child: SvgPicture.asset('assets/images/ic_back.svg',
              width: 24, height: 24, fit: BoxFit.scaleDown),
        ),
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
                const Text(
                  'Welcome',
                  style: TextStyle(
                      color: SuitmediaColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  userName,
                  style: const TextStyle(
                      color: SuitmediaColor.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Center(
              child: Text(
                userName,
                style: const TextStyle(
                    color: SuitmediaColor.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SuitmediaButton(
                text: 'Choose a User',
                onPressed: () async {
                  final result = await Get.toNamed(Routes.third,
                      arguments: {"userName": userName});
                  if (result != null) {
                    print(result);
                    setState(() {
                      userName = result;
                    });
                  }
                })
          ],
        ),
      ),
    );
  }
}
