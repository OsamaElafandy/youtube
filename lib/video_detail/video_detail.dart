import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube/home/home.dart';
import 'package:youtube/models/youtube_model.dart';
import 'package:youtube/video_detail/widgets/channel_Info_widget.dart';
import 'package:youtube/video_detail/widgets/more_Info_widget.dart';
import 'package:youtube/video_detail/widgets/video_Info_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetail extends StatefulWidget {
  final YoutubeModel detail;

  const VideoDetail({Key key, @required this.detail}) : super(key: key);

  @override
  VideoDetailState createState() => VideoDetailState();
}

class VideoDetailState extends State<VideoDetail> {
  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;
  PlayerState playerState;
  YoutubeMetaData videoMetaData;
  final double volume = 100;
  final bool muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.detail.videoUrl),
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: true,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    videoMetaData = const YoutubeMetaData();
    playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        playerState = _controller.value.playerState;
        videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> layouts = [
      VideoInfoWidget(
        detail: widget.detail,
      ),
      ChannelInfoWidget(
        detail: widget.detail,
      ),
      const MoreInfoWidget(),
      const HomeScreen(
        isMiniList: true,
      ),
    ];

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      layouts.clear();
    }

    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.red,
        ),
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {},
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller.load(YoutubePlayer.convertUrlToId(widget.detail.videoUrl)[
              (YoutubePlayer.convertUrlToId(widget.detail.videoUrl)
                          .indexOf(data.videoId) +
                      1) %
                  YoutubePlayer.convertUrlToId(widget.detail.videoUrl).length]);
          //_showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) => Scaffold(
          body: Column(
        children: <Widget>[
          player,
          Expanded(
            child: ListView(
              children: layouts,
            ),
          )
        ],
      )),
    );
  }
}
