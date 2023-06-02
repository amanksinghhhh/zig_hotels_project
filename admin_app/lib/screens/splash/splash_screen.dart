import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:zig_assets/my_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
        leading: Padding(
          padding: padding.only(left: Dimensions.smallest),
          child:
              //Icon(FontAwesomeIcons.arrowLeft)
              ZigHotelsAssets.images.arrowLongLeft.svg(
            color: theme.zigHotelsColors.onBackground,
          ),
        ),
        leadingWidth: 30,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Welcome to ZigHotels Admin'),
            ),
            const Space(Dimensions.small),
            ZigHotelsAssets.images.dashboardContainer.image(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Test Button'),
            ),
          ],
        ),
      ),
    );
  }
}
