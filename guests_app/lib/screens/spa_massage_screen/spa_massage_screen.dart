import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translations/translations.dart';
import 'package:zig_assets/my_assets.dart';

class SpaAndMassageScreen extends StatelessWidget {
  const SpaAndMassageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    List<ServicesModel> items = [
      ServicesModel(
        image: ZigHotelsAssets.images.spaRitual
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        serviceName: context.l10n.massageAndBeauty,
      ),
      ServicesModel(
        image: ZigHotelsAssets.images.massageBeauty
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        serviceName: context.l10n.spaRitualBy,
      ),
      ServicesModel(
          image: ZigHotelsAssets.images.gym
              .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
          serviceName: context.l10n.gym),
      ServicesModel(
        image: ZigHotelsAssets.images.sauna
            .image(height: 170.h, width: double.infinity, fit: BoxFit.cover),
        serviceName: context.l10n.sauna,
      ),
    ];
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppbarWidget(
          backgroundColor: theme.zigHotelsColors.darkBlue,
          title: context.l10n.spaAndFitness,
          leadingIcon: ZigHotelsAssets.images.arrowLongLeft
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
}
