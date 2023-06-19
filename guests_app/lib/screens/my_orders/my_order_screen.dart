import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:guests_app/models/models.dart';
import 'package:intl/intl.dart';
import 'package:network/core/core.dart';
import 'package:zig_assets/my_assets.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  final db = FirebaseFirestore.instance
      .collection(FirebaseConstants.appointments)
      .doc(SharedPreferenceHelper(Preference()).roomNo.toString())
      .collection(FirebaseConstants.serviceBooked);

  final Stream<QuerySnapshot> _orderStream = FirebaseFirestore.instance
      .collection(FirebaseConstants.appointments)
      .doc(SharedPreferenceHelper(Preference()).roomNo.toString())
      .collection(FirebaseConstants.serviceBooked)
      .orderBy(FirebaseConstants.bookingTime, descending: true)
      .snapshots();
  final storageRef = FirebaseStorage.instance.ref();
  final gsRef = FirebaseStorage.instance
      .refFromURL("gs://zighotels.appspot.com/app/app-release.apk");

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
        child: StreamBuilder<QuerySnapshot>(
          stream: _orderStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            return AnimationLimiter(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    //color: theme.zigHotelsColors.onPrimary,
                    height: 10.h,
                    //thickness: 0.5,
                  );
                },
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 1000),
                    child: SlideAnimation(
                      horizontalOffset: 100,
                      verticalOffset: 100,
                      child: FadeInAnimation(
                        child: Card(
                          elevation: 10,
                          color: theme.zigHotelsColors.darkBlue,
                          surfaceTintColor: theme.zigHotelsColors.teal,
                          child: Padding(
                            padding: EdgeInsetsOf(context).symmetric(
                                vertical: Dimensions.small,
                                horizontal: Dimensions.small),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!.docs[index]
                                              ['serviceName'],
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                                  color: theme.zigHotelsColors
                                                      .onPrimary,
                                                  fontSize: 18.sp),
                                        ),
                                        Text(
                                          _getFormattedDate(
                                            snapshot
                                                .data!
                                                .docs[index][FirebaseConstants
                                                    .servingTime]
                                                .toDate()
                                                .toString(),
                                          ),
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: theme.zigHotelsColors
                                                      .onPrimary),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Space(Dimensions.medium),
                                Row(
                                  children: [
                                    Expanded(
                                      child: RegularActionButton(
                                          fontSize: 16.sp,
                                          buttonText: 'Details',
                                          buttonTextColor:
                                              theme.zigHotelsColors.onPrimary,
                                          buttonColor:
                                              theme.zigHotelsColors.teal,
                                          onButtonTap: () {}),
                                    ),
                                    const Space(Dimensions.medium),
                                    Expanded(
                                      child: RegularActionButton(
                                        fontSize: 16.sp,
                                        buttonText: 'Cancel Order',
                                        buttonTextColor:
                                            theme.zigHotelsColors.onPrimary,
                                        buttonColor:
                                            theme.zigHotelsColors.error,
                                        onButtonTap: () {
                                          print(gsRef);
                                          _onCancelOrder(
                                              context, snapshot, index);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _onCancelOrder(BuildContext context,
      AsyncSnapshot<QuerySnapshot<Object?>> snapshot, int index) {
    return showAnimatedDialog(
      context,
      DialogBox(
          context: context,
          confirmBtnText: "Cancel",
          declineBtnText: "Close",
          onYes: () {
            isShowLoadingDialog(context, true);
            final id = snapshot.data!.docs[index].id;
            db.doc(id).delete().then((value) {
              isShowLoadingDialog(context, false);
              Navigator.pop(context);
              showConfirmationToast(
                  msg: "Your order has been cancelled", success: true);
            });
          },
          content: "Are you sure you want to Cancel Order?"),
    );
  }

  String _getFormattedDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat outputFormat = DateFormat("dd MMM yyyy (hh:mm a)");
    String convertedDate = outputFormat.format(dateTime);
    return convertedDate;
  }
}
