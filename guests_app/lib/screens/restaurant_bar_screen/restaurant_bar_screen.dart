import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translations/translations.dart';
import 'package:zig_assets/my_assets.dart';

class RestaurantBarScreen extends StatelessWidget {
  const RestaurantBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding  = EdgeInsetsOf(context);
    List<RoomServicesModel> items = [
      RoomServicesModel(
        image: ZigHotelsAssets.images.indianRestaurant
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        serviceName: context.l10n.indianRes,
      ),
      RoomServicesModel(
        image: ZigHotelsAssets.images.italianCafe
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        serviceName: context.l10n.italianCafe,
      ),
      RoomServicesModel(
          image: ZigHotelsAssets.images.heavenBar
              .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
          serviceName: context.l10n.heavenBar),
      RoomServicesModel(
        image: ZigHotelsAssets.images.lobbyBar
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        serviceName: context.l10n.lobbyBar,
      ),
    ];
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppbarWidget(
          backgroundColor: theme.zigHotelsColors.darkBlue,
          title: context.l10n.restaurantsAndBar,
          onBackButtonPressed: () =>  _onBackButtonPressed(context),
          backIcon: ZigHotelsAssets.images.arrowLongLeft
              .svg(color: theme.zigHotelsColors.onPrimary),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: padding.symmetric(
                horizontal: DimensionToken.medium,
                vertical: DimensionToken.smallest),
            child: ServicesCard(
              items: items[index],
            ),
          );
        },
      ),
    );
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }
}
