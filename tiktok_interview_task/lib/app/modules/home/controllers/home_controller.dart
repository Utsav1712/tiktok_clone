import 'dart:developer';

import 'package:get/get.dart';
import 'package:tiktok_interview_task/app/model/post_model.dart';
import '../../../../api/api_service.dart';

class HomeController extends GetxController {
  RxList<PostModel> posts = <PostModel>[].obs;
  RxBool isLoading = false.obs;
  int lastPid = -1; // Start with -1 for the first call

  @override
  void onInit() {
    super.onInit();
    fetchPosts(); // Initial fetch
  }

  Future<void> fetchPosts() async {
    if (isLoading.value) return;

    try {
      isLoading(true);

      log("=============>$lastPid");
      final response = await ApiService().getPostData({"pid": lastPid});
      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> records = response.data;
        log('response.data=================>${records.length}');
        log('recordsList=================>${records}');

        // Parse and add new posts
        posts.addAll(records.map((record) => PostModel.fromJson(record)));
        log('postLength=================>${posts.length}');

        lastPid = records.last['pid']; // Update last PID
      }
    } catch (e) {
      log("Failed to fetch posts: $e");
    } finally {
      isLoading(false);
    }
  }
}
