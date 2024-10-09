import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';
import 'package:toktik_app/infraestructure/models/local_video_model.dart';
import 'package:toktik_app/shared/data/local_video_posts.dart';

class DiscoverProviders extends ChangeNotifier{

  bool initialLoading = true;
  List<VideoPost> videos = [
  ];

  Future<void> loadNextPage() async{

    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map(
    (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()).toList();

    /*
    final List<VideoPost> newVideos = videoPosts.map( 
      (video) => VideoPost(
      caption: video['name'],
      videoUrl: video['videoUrl'],
      likes: video['likes'],
      views: video['views'],
    )).toList();
    */


    videos.addAll(newVideos);
    initialLoading =false;
    notifyListeners();
  
  }

    


}