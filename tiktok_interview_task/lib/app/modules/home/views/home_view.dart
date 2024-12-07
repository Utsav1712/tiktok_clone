  import 'dart:math';

  import 'package:flutter/material.dart';

  import 'package:get/get.dart';
  import 'package:tiktok_interview_task/app/modules/home/views/widget/video_player_widget.dart';

  import '../controllers/home_controller.dart';
import 'widget/post_widget.dart';

  class HomeView extends GetView<HomeController> {
    const HomeView({super.key});
    @override
    Widget build(BuildContext context) {
      return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: Obx(() {
              if (controller.posts.isEmpty && controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.posts.length + 1, // Add one for the loader
                onPageChanged: (index) {
                  // Trigger new data fetch when nearing the end of the list
                  if (index >= controller.posts.length - 1) {
                    controller.fetchPosts();
                  }
                },
                itemBuilder: (context, index) {
                  if (index == controller.posts.length) {
                    return Center(
                      child: controller.isLoading.value
                          ? CircularProgressIndicator()
                          : Text("No more content"),
                    );
                  }

                  final post = controller.posts[index];
                  return ContentWidget(post: post);
                },
              );
            }),
          );
        },
      );
    }
  }
