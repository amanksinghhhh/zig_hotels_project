import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
        automaticallyImplyLeading: false,
        // leading: Padding(
        //   padding: padding.only(left: Dimensions.smallest),
        //   child:
        //       //Icon(FontAwesomeIcons.arrowLeft)
        //       ZigHotelsAssets.images.arrowLongLeft.svg(
        //     color: theme.zigHotelsColors.onBackground,
        //   ),
        // ),
        // leadingWidth: 40,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Welcome to ZigHotels Tablet'),
            ),
            const Space(Dimensions.small),
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
