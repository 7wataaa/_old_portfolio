import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulHookWidget {
  const VideoPlayerWidget({Key? key, required this.dataSource})
      : super(key: key);
  final String dataSource;

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<VideoPlayerWidget> {
  late VideoPlayerController _playerController;

  @override
  void initState() {
    super.initState();
    _playerController = VideoPlayerController.asset(widget.dataSource)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);

    final isHoverOnSeekBar = useState(false);

    final isVideoPlaying = useState(false);

    final opacityLevel = useState<double>(0);

    void onMouseEnter(PointerEnterEvent e) {
      isHover.value = true;
      opacityLevel.value = 1;
    }

    void onMouseExit(PointerExitEvent _) {
      isHover.value = true;
      opacityLevel.value = 0;
    }

    void onMouseEnterOnSeekBar(PointerEnterEvent e) {
      isHoverOnSeekBar.value = true;
      opacityLevel.value = 1;
    }

    void onMouseExitOnSeekBar(PointerExitEvent _) {
      isHoverOnSeekBar.value = true;
      opacityLevel.value = 0;
    }

    return SizedBox(
      child: _playerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _playerController.value.aspectRatio,
              //動画ウィジェットと、操作盤ウィジェットを重ねるためのStack
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _playerController.value.aspectRatio,
                    child: VideoPlayer(_playerController),
                  ),
                  Container(
                    //操作系ウィジェット類を重ねる
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (!isVideoPlaying.value)
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.play_arrow),
                            ),
                          ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: onMouseEnter,
                          onExit: onMouseExit,
                          child: GestureDetector(
                            onTap: () async {
                              if (_playerController.value.isPlaying) {
                                isVideoPlaying.value = false;
                                await _playerController.pause();
                              } else {
                                isVideoPlaying.value = true;
                                await _playerController.play();
                              }
                            },
                            child: Container(
                              color: const Color(0x00ffffff),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: MouseRegion(
                            onEnter: onMouseEnterOnSeekBar,
                            onExit: onMouseExitOnSeekBar,
                            child: AnimatedOpacity(
                              opacity: opacityLevel.value,
                              duration: const Duration(milliseconds: 50),
                              child: Container(
                                height: 25,
                                margin:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: VideoProgressIndicator(
                                  _playerController,
                                  allowScrubbing: true,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 9, 10, 9),
                                  colors: VideoProgressColors(
                                      playedColor:
                                          Theme.of(context).accentColor),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
