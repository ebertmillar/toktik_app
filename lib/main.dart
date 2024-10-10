import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_app/config/theme/theme_app.dart';
import 'package:toktik_app/infraestructure/datasources/local_video_datasourcde_implementation.dart';
import 'package:toktik_app/infraestructure/repositories/video_posts_repository_implementation.dart';
import 'package:toktik_app/presentation/providers/discover_providers.dart';
import 'package:toktik_app/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostsRepository = VideoPostsRepositoryImplementation(
      videoDatasource: LocalVideoDatasourcdeImplementation()
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProviders(videosRepository: videoPostsRepository)..loadNextPage()),
      ],
      child: MaterialApp(
          title: 'Toktik',
          debugShowCheckedModeBanner: false,
          theme: ThemeApp().getTheme(),
          home: const DiscoverScreen(),
      ),
    );
  }
}