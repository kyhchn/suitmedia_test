import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:suitmedia_test/controller/third_screen_controller.dart';
import 'package:suitmedia_test/models/user.dart';
import 'package:suitmedia_test/utils/colors.dart';
import 'package:suitmedia_test/utils/constant/constant.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = ThirdScreenController.i;
    final scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        controller.nextPage();
      }
    });
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(color: Color(0xFFE2E3E4), width: 0.5),
        ),
        leading: const Icon(Icons.arrow_back_ios,
            color: Color(0xFF554AF0), size: 24),
        title: const Text("Third Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: RefreshIndicator(
          onRefresh: () async {
            controller.reset();
            await Future.delayed(const Duration(seconds: 1));
          },
          child: Obx(() => controller.users.isNotEmpty
              ? ListView.builder(
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    if (index < controller.users.length) {
                      return userItem(
                          controller.users[index],
                          () => Get.back(
                              result: controller.users[index].fullName));
                    } else {
                      return controller.hasMore.value
                          ? const Center(child: CircularProgressIndicator())
                          : const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "No More Data",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: SuitmediaColor.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            );
                    }
                  },
                  itemCount: controller.users.length + 1,
                )
              : controller.isLoading.value
                  ? Skeletonizer(
                      child: ListView(
                      children: List.generate(
                          10, (index) => userItem(dummyUser, null)),
                    ))
                  : const Center(child: Text("No Data"))),
        ),
      ),
    );
  }

  ListTile userItem(User user, void Function()? onTap) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(18, 16, 0, 16),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: user.avatar.isNotEmpty
            ? NetworkImage(
                user.avatar,
              )
            : null,
      ),
      title: Text(
        user.fullName,
        style: const TextStyle(
            color: SuitmediaColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        user.email.toUpperCase(),
        style: const TextStyle(
            color: Color(0xFF686777),
            fontSize: 10,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
