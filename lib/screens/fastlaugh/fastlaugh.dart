import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:video_player/video_player.dart';
import 'widget/listbuttons.dart';

class FastLaughs extends StatefulWidget {
  const FastLaughs({Key? key}) : super(key: key);

  @override
  State<FastLaughs> createState() => _FastLaughsState();
}

class _FastLaughsState extends State<FastLaughs> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _videoPlayerController.play());
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = _videoPlayerController.value.volume == 0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: (_videoPlayerController.value.isInitialized)
            ? PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 100,
                        width: MediaQuery.of(context).size.width,
                        child: VideoPlayer(_videoPlayerController),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: const NetworkImage(
                                  'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png?20201013161117'),
                              backgroundColor: backgroundColor.withOpacity(0.5),
                              radius: 23,
                            ),
                            VideoListAvatarButton(
                              icon: Icons.emoji_emotions,
                              title: 'LOL',
                              onPressed: () {},
                            ),
                            VideoListAvatarButton(
                              icon: Icons.add,
                              title: 'My List',
                              onPressed: () {},
                            ),
                            VideoListAvatarButton(
                              icon: Icons.telegram,
                              title: 'Share',
                              onPressed: () {},
                            ),
                            VideoListAvatarButton(
                              icon: Icons.play_arrow,
                              title: 'Play',
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 5,
                        bottom: 2,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _videoPlayerController.setVolume(isMuted ? 1 : 0);
                            });
                          },
                          icon: Icon(
                            isMuted
                                ? CupertinoIcons.volume_off
                                : CupertinoIcons.volume_up,
                          ),
                        ),
                      )
                    ],
                  );
                })
            : const CircularProgressIndicator(
                color: Colors.black,
              ),
      ),
    );
  }
}
