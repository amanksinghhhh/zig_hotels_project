import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translations/translations.dart';
import 'package:zig_assets/my_assets.dart';
import '../../model/models.dart';

class RoomServicesScreen extends StatelessWidget {
  const RoomServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    List<RoomServicesModel> items = [
      RoomServicesModel(
        image: ZigHotelsAssets.images.roomMakeUp
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        time: context.l10n.hours24,
        serviceName: context.l10n.roomMakeUp,
      ),
      RoomServicesModel(
        image: ZigHotelsAssets.images.laundry
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        time: context.l10n.time8To22,
        serviceName: context.l10n.laundryAndDry,
      ),
      RoomServicesModel(
          image: ZigHotelsAssets.images.minibarRefil
              .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
          time: context.l10n.hours24,
          serviceName: context.l10n.minibarRefill),
      RoomServicesModel(
        image: ZigHotelsAssets.images.extraPillow
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        time: context.l10n.hours24,
        serviceName: context.l10n.extraPillow,
      ),
      RoomServicesModel(
        image: ZigHotelsAssets.images.trayRemoval
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        time: context.l10n.hours24,
        serviceName: context.l10n.trayRemoval,
      ),
      RoomServicesModel(
        image: ZigHotelsAssets.images.luggageServices
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        time: context.l10n.hours24,
        serviceName: context.l10n.luggageService,
      ),
    ];
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppbarWidget(
          backgroundColor: theme.zigHotelsColors.darkBlue,
          title: context.l10n.roomServices,
          onBackButtonPressed: () => _onBackButtonPressed(context),
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
              items: items,
              theme: theme,
              index: index,
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
