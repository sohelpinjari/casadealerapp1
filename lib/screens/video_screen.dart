import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class VideoPlayerPage extends StatefulWidget {
  final String videoFilePath;

  VideoPlayerPage({required this.videoFilePath});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network((widget.videoFilePath))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Player'),
      backgroundColor: Color(0xff333389),
      ),
      body: Stack(
        children: [
          Center(
            child: _videoPlayerController.value.isInitialized
                ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
                : CircularProgressIndicator(),
          ),
Positioned(top: 40.h,
  left: 42.w,
  child:   IconButton(onPressed: (){

    setState(() {

      if (_videoPlayerController.value.isPlaying) {

        _videoPlayerController.pause();

      } else {

        _videoPlayerController.play();

      }

    });

  },

      icon:  Icon(_videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
      size: 5.h,

      ),),
)
        ],
      ),

    );
  }
}
