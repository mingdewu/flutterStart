import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Video Player Demo',
      home:VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget{
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState(){
    super.initState();
    
    _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',);
    _initializeVideoPlayerFuture = _controller.initialize();
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Video'),
    ),
      body: // Use a FutureBuilder to display a loading spinner while waiting for the
// VideoPlayerController to finish initializing.
      FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
// If the VideoPlayerController has finished initialization, use
// the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
// Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
// If the VideoPlayerController is still initializing, show a
// loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
      ,
    );
  }
}


