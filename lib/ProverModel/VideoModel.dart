import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoModel extends ChangeNotifier {
  VideoPlayerController? _controller;
  VideoPlayerController? get controller => _controller;

  Future<void> playAndStop() async {
    if (_controller == null) {
      _controller = VideoPlayerController.network(
        'https://drive.google.com/uc?export=download&id=17aFONl8eh1F7yrSRya2_nWdBHV4CbM8P',
      );

      await _controller!.initialize();
      notifyListeners(); // optional for UI update
    }

    if (_controller!.value.isPlaying) {
      _controller!.pause();
    } else {
      _controller!.play();
    }

    notifyListeners();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
