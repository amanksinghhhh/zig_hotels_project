import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:guests_app/screens/hotel_info_screen/hotel_info_screen.dart';
import 'package:guests_app/screens/login_screen/login.dart';
import 'package:guests_app/screens/my_orders/my_order_screen.dart';
import 'package:network/core/core.dart';
import 'package:translations/translations.dart';
import 'package:zig_assets/my_assets.dart';

class MoreOptionsScreen extends StatelessWidget {
  const MoreOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<MoreOptionModel> option = [
      MoreOptionModel(
        title: context.l10n.hotelInfo,
        id: 0,
        icon: ZigHotelsAssets.images.hotelInfoPng.image(
          height: 24.h,
          width: 24.w,
          fit: BoxFit.cover,
        ),
      ),
      MoreOptionModel(
        title: context.l10n.myOrders,
        id: 1,
        icon: ZigHotelsAssets.images.myOrdersPng.image(
          height: 24.h,
          width: 24.w,
          fit: BoxFit.cover,
        ),
      ),
      MoreOptionModel(
        title: context.l10n.feedback,
        id: 2,
        icon: ZigHotelsAssets.images.feedback.image(
          height: 24.h,
          width: 24.w,
          fit: BoxFit.cover,
        ),
      ),
      MoreOptionModel(
        title: context.l10n.logout,
        id: 3,
        icon: ZigHotelsAssets.images.logout.image(
          height: 30.h,
          width: 30.w,
          fit: BoxFit.cover,
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      body: Padding(
        padding: EdgeInsetsOf(context).symmetric(
          horizontal: Dimensions.large,
          vertical: Dimensions.large,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimationLimiter(
              child: ListView.separated(
                itemCount: option.length,
                physics: const ScrollPhysics(
                  parent: NeverScrollableScrollPhysics(),
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      horizontalOffset: 100,
                      verticalOffset: 100.0,
                      child: FadeInAnimation(
                        child: OptionTile(
                          optionModel: option[index],
                          context: context,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      horizontalOffset: 100,
                      verticalOffset: 100.0,
                      child: FadeInAnimation(
                        child: Divider(
                          height: 1.h,
                          color: theme.zigHotelsColors.disabled,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            Text(
              context.l10n.app_title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.zigHotelsColors.onPrimary,
                fontSize: 25.sp,
              ),
            ),
            Text(
              context.l10n.slogan,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.zigHotelsColors.onPrimary,
                fontSize: 12.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MoreOptionModel {
  final String title;
  final Widget? icon;
  final int id;

  MoreOptionModel({
    required this.title,
    this.icon,
    required this.id,
  });
}

class OptionTile extends StatelessWidget {
  final MoreOptionModel optionModel;
  final BuildContext context;

  OptionTile({
    super.key,
    required this.optionModel,
    required this.context,
  });

  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper(Preference());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        switch (optionModel.id) {
          case 0:
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const HotelInfoScreen(),
                ));
            break;
          case 1:
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) =>  MyOrderScreen(),
                ));
            break;
          case 2:
            break;
          case 3:
            showAnimatedDialog(context, DialogBox(
                context: context,
                confirmBtnText: "Logout",
                declineBtnText: "Cancel",
                onYes: () {
                  _sharedPreferenceHelper.clear();
                  Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                        (route) => false,
                  );
                },
                content: "Are you sure you want to Logout?"));
            break;
        }
      },
      leading: optionModel.icon,
      minLeadingWidth: 45.w,
      visualDensity: const VisualDensity(
        horizontal: 0,
      ),
      title: Text(
        optionModel.title,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.zigHotelsColors.onPrimary,
          fontSize: 18.sp,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: theme.zigHotelsColors.teal,
        size: 16,
      ),
    );
  }
}
