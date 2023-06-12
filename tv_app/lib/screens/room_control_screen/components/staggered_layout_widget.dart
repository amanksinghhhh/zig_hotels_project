import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zig_assets/my_assets.dart';

class StaggeredPage extends StatelessWidget {
  const StaggeredPage({
    super.key,
    required this.onService1Tap,
    required this.onService2Tap,
    required this.onService3Tap,
    required this.onService4Tap,
    required this.onService5Tap,
    required this.onService6Tap,
    required this.serviceName1,
    required this.serviceName2,
    required this.serviceName3,
    required this.serviceName4,
    required this.serviceName5,
    required this.serviceName6,
  });

  final VoidCallback onService1Tap;
  final VoidCallback onService2Tap;
  final VoidCallback onService3Tap;
  final VoidCallback onService4Tap;
  final VoidCallback onService5Tap;
  final VoidCallback onService6Tap;

  final String serviceName1;
  final String serviceName2;
  final String serviceName3;
  final String serviceName4;
  final String serviceName5;
  final String serviceName6;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        StaggeredGrid.count(
          crossAxisCount: 6,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1.1,
              child: RoomControlCard(
                serviceName: serviceName1,
                onCardTap: onService1Tap,
                image: ZigHotelsAssets.images.lights.svg(
                  fit: BoxFit.cover,
                  height: 65,
                  width: 65,
                  color: theme.zigHotelsColors.background,
                ),
                buttonsWidget: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: theme.zigHotelsColors.border,
                            ),
                          ),
                        ),
                        child: Text(
                          'On',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.zigHotelsColors.background,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: theme.zigHotelsColors.border,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Off',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.zigHotelsColors.background,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1.1,
              child: RoomControlCard(
                serviceName: serviceName2,
                onCardTap: onService2Tap,
                image: ZigHotelsAssets.images.doNotDisturb.image(
                  fit: BoxFit.cover,
                  height: 65,
                  width: 65,
                  color: theme.zigHotelsColors.background,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1.1,
              child: RoomControlCard(
                serviceName: serviceName3,
                onCardTap: onService3Tap,
                image: Text(
                  "23'C",
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: theme.zigHotelsColors.background,
                    fontWeight: FontWeight.w700,
                    fontSize: 50,
                  ),
                ),
                buttonsWidget: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: theme.zigHotelsColors.border,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          '-',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            color: theme.zigHotelsColors.background,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: theme.zigHotelsColors.border,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          '+',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            color: theme.zigHotelsColors.background,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1.1,
              child: RoomControlCard(
                serviceName: serviceName4,
                onCardTap: onService4Tap,
                image: ZigHotelsAssets.images.makeUpRoom.svg(
                  fit: BoxFit.cover,
                  height: 65,
                  width: 65,
                  color: theme.zigHotelsColors.background,
                ),
                buttonsWidget: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: theme.zigHotelsColors.border,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'On',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.zigHotelsColors.background,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: theme.zigHotelsColors.border,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Off',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.zigHotelsColors.background,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1.1,
              child: RoomControlCard(
                serviceName: serviceName5,
                onCardTap: onService5Tap,
                image: ZigHotelsAssets.images.scenes.image(
                  height: 65,
                  width: 65,
                  color: theme.zigHotelsColors.background,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1.1,
              child: RoomControlCard(
                serviceName: serviceName6,
                onCardTap: onService6Tap,
                image: ZigHotelsAssets.images.fanControl.svg(
                  fit: BoxFit.cover,
                  height: 65,
                  width: 65,
                  color: theme.zigHotelsColors.background,
                ),
                buttonsWidget: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: theme.zigHotelsColors.border,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          '-',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            color: theme.zigHotelsColors.background,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: theme.zigHotelsColors.border,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          '+',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            color: theme.zigHotelsColors.background,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
