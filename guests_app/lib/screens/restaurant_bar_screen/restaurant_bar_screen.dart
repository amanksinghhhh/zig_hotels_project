import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:translations/translations.dart';
import 'package:zig_assets/my_assets.dart';

class RestaurantBarScreen extends StatelessWidget {
  const RestaurantBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    List<ServicesModel> items = [
      ServicesModel(
        image: ZigHotelsAssets.images.indianRestaurant.image(
          height: 170.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        serviceName: context.l10n.indianRes,
      ),
      ServicesModel(
        image: ZigHotelsAssets.images.italianCafe.image(
          height: 170.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        serviceName: context.l10n.italianCafe,
      ),
      ServicesModel(
          image: ZigHotelsAssets.images.heavenBar.image(
            height: 170.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          serviceName: context.l10n.heavenBar),
      ServicesModel(
        image: ZigHotelsAssets.images.lobbyBar.image(
          height: 170.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
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
          leadingIcon: ZigHotelsAssets.images.arrowLongLeft.svg(
            color: theme.zigHotelsColors.onPrimary,
          ),
        ),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                horizontalOffset: 100,
                verticalOffset: 100,
                child: FadeInAnimation(
                  child: Padding(
                    padding: padding.symmetric(
                        horizontal: DimensionToken.medium,
                        vertical: DimensionToken.smallest),
                    child: ServicesCard(
                      items: items[index],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
