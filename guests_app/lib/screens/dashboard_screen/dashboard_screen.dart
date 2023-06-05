import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:network/core/core.dart';
import 'package:translations/translations.dart';
import 'package:zig_assets/my_assets.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper(Preference());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: -3,
              child: ZigHotelsAssets.images.dashboardBackground.image(),
            ),
            Padding(
              padding: padding.symmetric(
                horizontal: Dimensions.medium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Space(Dimensions.medium),
                  Text(
                    '${context.l10n.welcome}, ${_sharedPreferenceHelper.lastName}',
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: theme.zigHotelsColors.background,
                    ),
                  ),
                  const Space(Dimensions.smaller),
                  Text(
                    '${context.l10n.room} ${_sharedPreferenceHelper.roomNo}',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.zigHotelsColors.background,
                    ),
                  ),
                  const Space(Dimensions.larger),
                  const Space(Dimensions.larger),
                  const BookingDetailsWidget(
                    daysCount: '02',
                    nightTag: 'Nights',
                    checkInTag: 'Check In',
                    checkInDate: '02-Jun-23',
                    checkOutTag: 'Check Out',
                    checkOutTime: '05-Jun-23',
                  ),
                  const Space(Dimensions.large),
                  Padding(
                    padding: padding.symmetric(
                      vertical: Dimensions.small,
                    ),
                    child: Text(
                      'Quick Services',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.zigHotelsColors.background,
                      ),
                    ),
                  ),
                  const Space(Dimensions.small),
                  const StaggeredPage()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.image,
  });

  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        //set border radius more than 50% of height and width to make circle
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: image,
          ),
          const Text('Room Services'),
        ],
      ),
    );
  }
}

class StaggeredPage extends StatelessWidget {
  const StaggeredPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: CardWidget(
                image: ZigHotelsAssets.images.roomService.image(
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: CardWidget(
                image: ZigHotelsAssets.images.roomDining.image(
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: CardWidget(
                image: ZigHotelsAssets.images.restuarrants.image(
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: CardWidget(
                image: ZigHotelsAssets.images.spaImage.image(
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: CardWidget(
                image: ZigHotelsAssets.images.whereTo.image(
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
