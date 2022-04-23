// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:netflix/constants/constants.dart';
// import 'package:video_player/video_player.dart';
// import 'listbuttons.dart';

// class VideoListPage extends StatefulWidget {
//   const VideoListPage({Key? key, required this.videos}) : super(key: key);
//   final String videos;

//   @override
//   State<VideoListPage> createState() => _VideoListPageState();
// }

// class _VideoListPageState extends State<VideoListPage> {
//   Future<void>? _video;
//   VideoPlayerController? controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = VideoPlayerController.network(widget.videos);
//     controller!.play();
//     _video = controller!.initialize();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     controller!.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMuted = controller!.value.volume == 0;
//     return Stack(
//       children: [
//         FutureBuilder(
//           future: _video,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return VideoPlayer(controller!);
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     controller!.setVolume(isMuted ? 1 : 0);
//                   });
//                 },
//                 icon: Icon(
//                   isMuted
//                       ? CupertinoIcons.volume_off
//                       : CupertinoIcons.volume_up,
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const CircleAvatar(
//                     backgroundImage: NetworkImage(
//                         'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png?20201013161117'),
//                   ),
//                   constHeight,
//                   VideoListAvatarButton(
//                     icon: Icons.emoji_emotions,
//                     title: 'LOL',
//                     onPressed: () {},
//                   ),
//                   VideoListAvatarButton(
//                     icon: Icons.add,
//                     title: 'My List',
//                     onPressed: () {},
//                   ),
//                   VideoListAvatarButton(
//                     icon: Icons.telegram,
//                     title: 'Share',
//                     onPressed: () {},
//                   ),
//                   VideoListAvatarButton(
//                     icon: Icons.play_arrow,
//                     title: 'Play',
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
