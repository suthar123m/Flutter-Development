import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWithURL extends StatefulWidget {
  const VideoPlayerWithURL({super.key});

  @override
  State<VideoPlayerWithURL> createState() => _VideoPlayerWithURLState();
}

class _VideoPlayerWithURLState extends State<VideoPlayerWithURL> {
  late VideoPlayerController _controller;
  String videourl =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(videourl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.play_arrow : Icons.pause),
      ),
    );
  }
}
