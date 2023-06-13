import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guests_app/screens/order_screen/order.dart';
import 'package:translations/translations.dart';
import 'package:zig_assets/my_assets.dart';

class RoomServicesScreen extends StatelessWidget {
  const RoomServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    List<ServicesModel> items = [
      ServicesModel(
        image: ZigHotelsAssets.images.roomMakeUp
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        time: context.l10n.hours24,
        serviceName: context.l10n.roomMakeUp,
      ),
      ServicesModel(
        image: ZigHotelsAssets.images.laundry
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        time: context.l10n.time8To22,
        serviceName: context.l10n.laundryAndDry,
      ),
      ServicesModel(
          image: ZigHotelsAssets.images.minibarRefil
              .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
          time: context.l10n.hours24,
          serviceName: context.l10n.minibarRefill),
      ServicesModel(
        image: ZigHotelsAssets.images.extraPillow
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        time: context.l10n.hours24,
        serviceName: context.l10n.extraPillow,
      ),
      ServicesModel(
        image: ZigHotelsAssets.images.trayRemoval
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        time: context.l10n.hours24,
        serviceName: context.l10n.trayRemoval,
      ),
      ServicesModel(
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
              vertical: DimensionToken.smallest,
            ),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.r),
                          topLeft: Radius.circular(20.r)),
                      child: OrderSheet(servicesModel: items[index])),
                );
              },
              child: ServicesCard(
                items: items[index],
              ),
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
