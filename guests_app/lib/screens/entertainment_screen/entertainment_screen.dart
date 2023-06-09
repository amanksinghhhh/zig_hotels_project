import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guests_app/screens/entertainment_screen/youtube_view_screen.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:zig_assets/my_assets.dart';

class EntertainmentScreen extends StatelessWidget {
  EntertainmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<StreamingChannelsModel> _channels = [
      StreamingChannelsModel(
        logo: ZigHotelsAssets.images.aajTak.image(height: 80.h, width: 80.w),
        name: "Aaj Tak",
        videoId: "Nq2wYlWFucg",
      ),
      StreamingChannelsModel(
        logo: ZigHotelsAssets.images.indiaTv.image(height: 80.h, width: 80.w),
        name: "India TV",
        videoId: "noM2rscZ_MI",
      ),
      StreamingChannelsModel(
        logo: ZigHotelsAssets.images.zeeNews.image(height: 80.h, width: 80.w),
        name: "Zee News",
        videoId: "M3OvzlFEa30",
      ),
      StreamingChannelsModel(
        logo: ZigHotelsAssets.images.ndtvIndia.image(height: 80.h, width: 80.w),
        name: "NDTV",
        videoId: "4C_PYQparpU",
      ),
    ];
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppbarWidget(
          backgroundColor: theme.zigHotelsColors.darkBlue,
          title: "Live Streaming Channels",
          onBackButtonPressed: () => _onBackButtonPressed(context),
          backIcon: ZigHotelsAssets.images.arrowLongLeft
              .svg(color: theme.zigHotelsColors.onPrimary),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: GridView.builder(
          itemCount: _channels.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => YouTubeViewScreen(
                      videoId: _channels[index].videoId,
                      channelName: _channels[index].name,
                    ),
                    ),
                  ),
              child: Card(
                elevation: 20,
                child: Padding(
                  padding: EdgeInsetsOf(context).all(Dimensions.medium),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      _channels[index].logo,
                      const Space(Dimensions.medium),
                      Center(
                        child: Text(
                          _channels[index].name,
                          style: theme.textTheme.headlineLarge?.copyWith(
                              color: theme.zigHotelsColors.oceanBlue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }
}

class StreamingChannelsModel {
  Widget logo;
  String name;
  String videoId;

  StreamingChannelsModel({
    required this.logo,
    required this.name,
    required this.videoId,
  });
}
