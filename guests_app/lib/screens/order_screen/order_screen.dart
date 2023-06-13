import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:network/core/shared_preferences/helper.dart';
import 'package:network/core/shared_preferences/preferences.dart';

class OrderSheet extends StatefulWidget {
  final ServicesModel servicesModel;

  const OrderSheet({Key? key, required this.servicesModel}) : super(key: key);

  @override
  _OrderSheetState createState() => _OrderSheetState();
}

class _OrderSheetState extends State<OrderSheet> {
  late DateTime selectedDateTime;
  final dateFormatter = DateFormat('EEE dd MMM, hh:mm a');
  bool isDateSelected = false;
  final _specialRequestController = TextEditingController();
  final db = FirebaseFirestore.instance;
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper(Preference());

  @override
  void initState() {
    super.initState();
    selectedDateTime = DateTime.now();
  }

  Future<void> _showDateTimePicker() async {
    showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              Expanded(
                child: CupertinoTheme(
                  data: const CupertinoThemeData(brightness: Brightness.dark,),
                  child: CupertinoDatePicker(
                    backgroundColor: Colors.black,
                    mode: CupertinoDatePickerMode.dateAndTime,
                    minimumDate: DateTime.now(),
                    onDateTimeChanged: (DateTime dateTime) {
                      setState(() {
                        selectedDateTime = dateTime;
                      });
                    },
                  ),
                ),
              ),
              CupertinoButton(
                child: Text(
                  'Confirm',
                  style: TextStyle(color: CupertinoColors.activeBlue),
                ),
                onPressed: () {
                  if (isDateSelected) {
                    Navigator.of(context).pop();
                  } else {
                    setState(() {
                      isDateSelected = true;
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.zigHotelsColors.darkBlue,
      body: Padding(
        padding: padding.symmetric(horizontal: Dimensions.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Space(Dimensions.small),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: SizedBox(
                    height: 80.h,
                    width: 80.w,
                    child: widget.servicesModel.image,
                  ),
                ),
                const Space(Dimensions.small),
                Text(
                  widget.servicesModel.serviceName,
                  style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.zigHotelsColors.onPrimary, fontSize: 16.sp),
                )
              ],
            ),
            const Space(Dimensions.medium),
            Divider(
              color: theme.zigHotelsColors.onPrimary,
              thickness: 0.3,
            ),
            const Space(Dimensions.medium),
            Text(
              "Delivery Time",
              style: theme.textTheme.titleMedium
                  ?.copyWith(color: theme.zigHotelsColors.onPrimary),
            ),
            const Space(Dimensions.smaller),
            Row(
              children: [
                Padding(
                  padding: padding.only(left: Dimensions.medium),
                  child: Icon(
                    Icons.lock_clock,
                    color: theme.zigHotelsColors.onPrimary,
                  ),
                ),
                const Space(Dimensions.medium),
                GestureDetector(
                  onTap: ()=>_showDateTimePicker(),
                  child: Text(
                    isDateSelected
                        ? dateFormatter.format(selectedDateTime)
                        : 'Select Time',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.zigHotelsColors.onPrimary,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: padding.only(right: Dimensions.medium),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size:16.sp,
                    color: theme.zigHotelsColors.onPrimary,
                  ),
                ),
              ],
            ),
            const Space(Dimensions.small),
            TextFormField(
              controller: _specialRequestController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Special request',
                filled: true,
                fillColor: theme.zigHotelsColors.onPrimary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            const Space(Dimensions.medium),
            RegularActionButton(
              buttonText: 'CONFIRM ORDER',
              buttonTextColor: theme.zigHotelsColors.onPrimary,
              buttonColor: theme.zigHotelsColors.teal,
              onButtonTap: () => _onButtonTapped(context),
            )
          ],
        ),
      ),
    );
  }

  void _onButtonTapped(BuildContext context) {
    ServiceBookingModel serviceBookingModel = ServiceBookingModel(
      serviceName: widget.servicesModel.serviceName,
      bookingTime: Timestamp.now(),
      servingTime: Timestamp.fromMillisecondsSinceEpoch(
          selectedDateTime.millisecondsSinceEpoch),
      specialRequest: _specialRequestController.text.trim(),
    );
    _onServiceBooked(serviceBookingModel, context);
  }

  void _onServiceBooked(
      ServiceBookingModel serviceBookingModel, BuildContext context) {
    isShowLoadingDialog(context, true);
    final appointmentRef = db
        .collection('appointments')
        .doc(_sharedPreferenceHelper.roomNo.toString());

    appointmentRef.get().then((snapshot) {
      if (snapshot.exists) {
        // Document already exists, update the 'service_booked' array
        appointmentRef.update({
          'serviceBooked': FieldValue.arrayUnion([
            {
              serviceBookingModel.serviceName: {
                "bookingTime": serviceBookingModel.bookingTime,
                "servingTIme": serviceBookingModel.servingTime,
                "specialRequest": serviceBookingModel.specialRequest,
              }
            }
          ]),
        }).then((_) {
          print('Service added to existing document');
          isShowLoadingDialog(context, false);
          Navigator.pop(context);
        }).catchError((error) {
          print('Failed to update document: $error');
          isShowLoadingDialog(context, false);
        });
      } else {
        // Document doesn't exist, create a new document with the 'service_booked' array
        appointmentRef.set({
          'serviceBooked': [
            {
              serviceBookingModel.serviceName: {
                "bookingTime": serviceBookingModel.bookingTime,
                "servingTIme": serviceBookingModel.servingTime,
                "specialRequest": serviceBookingModel.specialRequest,
              }
            }
          ],
        }).then((_) {
          print('New document created');
          isShowLoadingDialog(context, false);
          Navigator.pop(context);
        }).catchError((error) {
          print('Failed to create document: $error');
          isShowLoadingDialog(context, false);
        });
      }
    }).catchError((error) {
      print('Failed to check document existence: $error');
      isShowLoadingDialog(context, false);
    });
  }
}

class ServiceBookingModel {
  final String? serviceName;
  final Timestamp? bookingTime;
  final Timestamp? servingTime;
  final OrderDetailsModel? orderDetailsModel;
  final String? specialRequest;

  ServiceBookingModel({
    this.serviceName,
    this.bookingTime,
    this.servingTime,
    this.orderDetailsModel,
    this.specialRequest,
  });
}

class OrderDetailsModel {}
