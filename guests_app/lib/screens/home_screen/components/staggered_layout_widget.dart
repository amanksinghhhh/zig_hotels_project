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
    required this.serviceName1,
    required this.serviceName2,
    required this.serviceName3,
    required this.serviceName4,
    required this.serviceName5,
  });

  final VoidCallback onService1Tap;
  final VoidCallback onService2Tap;
  final VoidCallback onService3Tap;
  final VoidCallback onService4Tap;
  final VoidCallback onService5Tap;

  final String serviceName1;
  final String serviceName2;
  final String serviceName3;
  final String serviceName4;
  final String serviceName5;

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
              mainAxisCellCount: 1,
              child: CardWidget(
                serviceName: serviceName1,
                onCardTap: onService1Tap,
                image: ZigHotelsAssets.images.roomService.image(
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: CardWidget(
                serviceName: serviceName2,
                onCardTap: onService2Tap,
                image: ZigHotelsAssets.images.roomDining.image(
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: CardWidget(
                serviceName: serviceName3,
                onCardTap: onService3Tap,
                image: ZigHotelsAssets.images.restuarrants.image(
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: CardWidget(
                serviceName: serviceName4,
                onCardTap: onService4Tap,
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
                serviceName: serviceName5,
                onCardTap: onService5Tap,
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
