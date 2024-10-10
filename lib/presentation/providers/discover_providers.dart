import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';
import 'package:toktik_app/domain/repositories/video_posts_repository.dart';
import 'package:toktik_app/infraestructure/models/local_video_model.dart';
import 'package:toktik_app/shared/data/local_video_posts.dart';

class DiscoverProviders extends ChangeNotifier{
  
  final VideoPostsRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProviders({required this.videosRepository});

  Future<void> loadNextPage() async{

    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading =false;
    notifyListeners();


    //await Future.delayed(const Duration(seconds: 2));

    //final List<VideoPost> newVideos = videoPosts.map(
    //(video) => LocalVideoModel.fromJson(video).toVideoPostEntity()).toList();

    /*
    final List<VideoPost> newVideos = videoPosts.map( 
      (video) => VideoPost(
      caption: video['name'],
      videoUrl: video['videoUrl'],
      likes: video['likes'],
      views: video['views'],
    )).toList();
    */


    
  
  }

    


}