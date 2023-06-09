import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:zig_assets/my_assets.dart';

class YouTubeViewScreen extends StatefulWidget {
  final String videoId;
  final String channelName;

  YouTubeViewScreen({
    Key? key,
    required this.videoId,
    required this.channelName,
  }) : super(key: key);

  @override
  State<YouTubeViewScreen> createState() => _YouTubeViewScreenState();
}

class _YouTubeViewScreenState extends State<YouTubeViewScreen> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(showFullscreenButton: false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppbarWidget(
          backgroundColor: theme.zigHotelsColors.darkBlue,
          title: widget.channelName,
          onBackButtonPressed: () => _onBackButtonPressed(context),
          backIcon: ZigHotelsAssets.images.arrowLongLeft.svg(
            color: theme.zigHotelsColors.onPrimary,
          ),
        ),
      ),
      body: YoutubePlayerScaffold(
        controller: _controller!,
        aspectRatio: 16 / 9,
        builder: (context, player) {
          return player;
        },
      ),
    );
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }
}
