import 'package:flutter/material.dart';
import 'package:tiktok_interview_task/app/model/post_model.dart';

import 'video_player_widget.dart';

class ContentWidget extends StatelessWidget {
  final PostModel post;

  const ContentWidget({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (post.type == "video") {
      if(post.url.isEmpty){
        return Center(
          child: Text(
            "Text Here${post.description}",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        );
      }
      return VideoPlayerWidget(videoUrl: post.url, description: post.description);
    } else if (post.type == "image") {
      if(post.url.isEmpty){
        return Center(
          child: Text(
            "Text Here${post.description}",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        );
      }
      return Stack(
        fit: StackFit.expand,
        children: [
          Image.network(post.url, fit: BoxFit.cover),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              post.description,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );
    } else {
      return Center(
        child: Text(
          "Text Here${post.description}",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      );
    }
  }
}