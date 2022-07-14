import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=SDzjW58cHnQ';
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      builder: (context, player) => Scaffold(
        appBar: AppBar(title: const Text("Youtub Player")),
        body: ListView(
          children: [
            player,
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  controller.toggleFullScreenMode();
                },
                child: const Text('Full Screen'))
          ],
        ),
      ),
      player: YoutubePlayer(
        controller: controller,
      ),
    );
  }
}
