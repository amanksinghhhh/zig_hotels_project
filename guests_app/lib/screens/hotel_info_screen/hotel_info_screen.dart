import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zig_assets/my_assets.dart';

class HotelInfoScreen extends StatelessWidget {
  const HotelInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ServicesModel> items = [
      ServicesModel(
        image: ZigHotelsAssets.images.aboutHotel.image(
          height: 170.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        serviceName: "About Hotel",
      ),
      ServicesModel(
        image: ZigHotelsAssets.images.hotelRoom.image(
          height: 170.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        serviceName: "Hotel Rooms",
      ),
      ServicesModel(
          image: ZigHotelsAssets.images.hotelAddress.image(
            height: 170.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          serviceName: "Address"),
      ServicesModel(
        image: ZigHotelsAssets.images.hotelServices.image(
          height: 170.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        serviceName: "Hotel Services",
      ),
    ];
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppbarWidget(
          title: "Hotel Information",
          leadingIcon: ZigHotelsAssets.images.arrowLongLeft.svg(
            color: theme.zigHotelsColors.onPrimary,
          ),
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
            child: ServicesCard(
              items: items[index],
            ),
          );
        },
      ),
    );
  }
}
