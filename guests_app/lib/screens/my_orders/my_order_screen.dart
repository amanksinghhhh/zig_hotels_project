import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guests_app/screens/order_screen/order.dart';
import 'package:network/core/core.dart';
import 'package:zig_assets/my_assets.dart';

class MyOrderScreen extends StatefulWidget {
  MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  List<ServiceBookingModel?> orderList = [];
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper(Preference());
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getOrdersList();
  }

  Future<void> getOrdersList() async {
    final list = await getOrders();
    orderList.addAll(list);
    setState(() {});
  }

  Future<List<ServiceBookingModel?>> getOrders() async {
    final result = await db
        .collection(FirebaseConstants.appointments)
        .doc(_sharedPreferenceHelper.roomNo.toString())
        .collection(FirebaseConstants.serviceBooked)
        .get();
    final ordersList = result.docs.map((e) {
      final data = e.data();
      if (data != null) {
        return ServiceBookingModel(
            serviceName: data['serviceName'],
            servingTime: data[FirebaseConstants.servingTime],
            specialRequest: data[FirebaseConstants.specialRequest],
            bookingTime: data[FirebaseConstants.bookingTime]);
      }
    }).toList();
    ordersList.forEach((order) {
      print("ServiceName: ${order?.serviceName}");
    });
    return ordersList;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.zigHotelsColors.darkBlue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppbarWidget(
          showBackIcon: true,
          isCenterTitle: true,
          title: 'My Order',
          leadingIcon: ZigHotelsAssets.images.arrowLongLeft
              .svg(color: theme.zigHotelsColors.onPrimary),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsOf(context).symmetric(horizontal: Dimensions.medium),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              //color: theme.zigHotelsColors.onPrimary,
              height: 10.h,
              //thickness: 0.5,
            );
          },
          shrinkWrap: true,
          itemCount: orderList.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              color: theme.zigHotelsColors.darkBlue,
              surfaceTintColor: theme.zigHotelsColors.teal,
              child: Padding(
                padding: EdgeInsetsOf(context).symmetric(
                    vertical: Dimensions.small, horizontal: Dimensions.small),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          orderList?[index]?.serviceName ?? "",
                          style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.zigHotelsColors.onPrimary),
                        ),
                        Text(
                          orderList?[index]?.servingTime?.toDate().toString() ??
                              "",
                          style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: theme.zigHotelsColors.onPrimary),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: theme.zigHotelsColors.teal,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding: EdgeInsetsOf(context).all(Dimensions.smaller),
                        child: Text(
                          'Details',
                          style: theme.textTheme.titleSmall?.copyWith(
                              color: theme.zigHotelsColors.onPrimary),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
