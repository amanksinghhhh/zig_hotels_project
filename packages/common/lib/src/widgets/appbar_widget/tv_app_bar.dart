import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';

class TvAppbarWidget extends StatelessWidget {
  const TvAppbarWidget({
    super.key,
    required this.weatherWidget,
    required this.title,
    this.onWifiPressed,
    required this.roomInfoText,
    this.wifiIcon,
  });

  final String title;
  final String roomInfoText;
  final Widget weatherWidget;
  final Widget? wifiIcon;
  final VoidCallback? onWifiPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return PreferredSize(
      preferredSize: Size.infinite,
      child: AppBar(
        backgroundColor: theme.zigHotelsColors.darkBlue,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        title: Padding(
          padding: padding.symmetric(
            horizontal: Dimensions.medium,
          ),
          child: Text(
            title,
            style: theme.textTheme.displayMedium?.copyWith(
              color: theme.zigHotelsColors.background,
              fontFamily: 'Waterfall',
              fontSize: 50,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: padding.symmetric(
              horizontal: Dimensions.medium,
            ),
            child: Row(
              children: [
                Text(
                  roomInfoText,
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: theme.zigHotelsColors.background,
                  ),
                ),
                const Space(Dimensions.medium),
                weatherWidget,
                wifiIcon == null
                    ? const SizedBox.shrink()
                    : const Space(Dimensions.medium),
                wifiIcon == null
                    ? const SizedBox.shrink()
                    : InkWell(
                        focusColor: theme.zigHotelsColors.oceanBlue,
                        onTap: onWifiPressed,
                        child: wifiIcon,
                      ),
                wifiIcon == null
                    ? const SizedBox.shrink()
                    : const Space(Dimensions.smaller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
