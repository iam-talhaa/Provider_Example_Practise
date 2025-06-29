import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GoogleDriveVideoScreen extends StatefulWidget {
  @override
  _GoogleDriveVideoScreenState createState() => _GoogleDriveVideoScreenState();
}

class _GoogleDriveVideoScreenState extends State<GoogleDriveVideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://drive.google.com/uc?export=download&id=17aFONl8eh1F7yrSRya2_nWdBHV4CbM8P',
      )
      ..initialize().then((_) {
        setState(() {});
        _controller.play(); //
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // release resources
    super.dispose();
  }

  bool isplay = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Drive Video")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            isplay == false
                ? Center(child: Icon(Icons.video_call))
                : Center(
                  child:
                      _controller.value.isInitialized
                          ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                          : CircularProgressIndicator(),
                ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            print(isplay);
            isplay = true;
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
