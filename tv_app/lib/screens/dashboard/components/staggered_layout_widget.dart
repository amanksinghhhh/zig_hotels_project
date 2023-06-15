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
    required this.onService7Tap,
    required this.onService8Tap,
    required this.onService9Tap,
    required this.onService10Tap,
    required this.onService11Tap,
    required this.onService12Tap,
    required this.serviceName1,
    required this.serviceName2,
    required this.serviceName3,
    required this.serviceName4,
    required this.serviceName5,
    required this.serviceName6,
    required this.serviceName7,
    required this.serviceName8,
    required this.serviceName9,
    required this.serviceName10,
    required this.serviceName11,
    required this.serviceName12,
  });

  final VoidCallback onService1Tap;
  final VoidCallback onService2Tap;
  final VoidCallback onService3Tap;
  final VoidCallback onService4Tap;
  final VoidCallback onService5Tap;
  final VoidCallback onService6Tap;
  final VoidCallback onService7Tap;
  final VoidCallback onService8Tap;
  final VoidCallback onService9Tap;
  final VoidCallback onService10Tap;
  final VoidCallback onService11Tap;
  final VoidCallback onService12Tap;

  final String serviceName1;
  final String serviceName2;
  final String serviceName3;
  final String serviceName4;
  final String serviceName5;
  final String serviceName6;
  final String serviceName7;
  final String serviceName8;
  final String serviceName9;
  final String serviceName10;
  final String serviceName11;
  final String serviceName12;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        StaggeredGrid.count(
          crossAxisCount: 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 1.5,
              child: CardWidget(
                serviceName: serviceName1,
                onCardTap: onService1Tap,
                image: ZigHotelsAssets.images.hotelInfoJpg.image(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 0.8,
              child: CardWidget(
                serviceName: serviceName2,
                onCardTap: onService2Tap,
                image: ZigHotelsAssets.images.roomDiningBack.image(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 0.8,
              child: CardWidget(
                serviceName: serviceName3,
                onCardTap: onService3Tap,
                image: ZigHotelsAssets.images.restuarrants.image(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 0.8,
              child: CardWidget(
                serviceName: serviceName4,
                onCardTap: onService4Tap,
                image: ZigHotelsAssets.images.spaImage.image(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 0.8,
              child: CardWidget(
                serviceName: serviceName5,
                onCardTap: onService5Tap,
                image: ZigHotelsAssets.images.whereToBack.image(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),

            /// fixed layout
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: CardWidget(
                serviceName: serviceName6,
                onCardTap: onService6Tap,
                image: ZigHotelsAssets.images.roomServiceBack.image(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: CardWidget(
                serviceName: serviceName7,
                onCardTap: onService7Tap,
                image: ZigHotelsAssets.images.hotelMenu.image(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 0.9,
              child: CardWidget(
                serviceName: serviceName8,
                onCardTap: onService8Tap,
                image: ZigHotelsAssets.images.viewBills.image(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 0.9,
              child: CardWidget(
                serviceName: serviceName9,
                onCardTap: onService9Tap,
                image: ZigHotelsAssets.images.myOrdersJpg.image(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: CardWidget(
                serviceName: serviceName10,
                onCardTap: onService10Tap,
                image: ZigHotelsAssets.images.settings.image(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 1,
              child: CardWidget(
                serviceName: serviceName11,
                onCardTap: onService11Tap,
                image: ZigHotelsAssets.images.roomControlJpg.image(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: CardWidget(
                serviceName: serviceName12,
                onCardTap: onService12Tap,
                image: ZigHotelsAssets.images.moreJpg.image(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
