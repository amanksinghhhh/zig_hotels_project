import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guests_app/models/models.dart';
import 'package:intl/intl.dart';
import 'package:network/network.dart';
import '../../utils/utils.dart';

class OrderSheet extends ConsumerStatefulWidget {
  final ServicesModel servicesModel;

  const OrderSheet({Key? key, required this.servicesModel}) : super(key: key);

  @override
  ConsumerState<OrderSheet> createState() => _OrderSheetState();
}

class _OrderSheetState extends ConsumerState<OrderSheet> {
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

  Future<void> _showDateTimePicker(ThemeData theme) async {
    showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        DateFormat outputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
        DateTime dateTime =
            outputFormat.parse(_sharedPreferenceHelper.checkOut ?? "");
        return SizedBox(
          height: 300.h,
          child: Column(
            children: [
              Expanded(
                child: CupertinoTheme(
                  data: const CupertinoThemeData(
                    brightness: Brightness.dark,
                  ),
                  child: CupertinoDatePicker(
                    backgroundColor: Colors.black,
                    mode: CupertinoDatePickerMode.dateAndTime,
                    minimumDate: DateTime.now(),
                    maximumDate: dateTime,
                    onDateTimeChanged: (DateTime dateTime) {
                      setState(() {
                        selectedDateTime = dateTime;
                      });
                    },
                  ),
                ),
              ),
              TextButton(
                child: Text(
                  'Confirm',
                  style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.zigHotelsColors.onPrimary, fontSize: 16.sp),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    isDateSelected = true;
                  });
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
      backgroundColor: theme.zigHotelsColors.darkBlue,
      body: Padding(
        padding: padding.symmetric(horizontal: Dimensions.medium),
        child: SingleChildScrollView(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.servicesModel.serviceName,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.zigHotelsColors.onPrimary,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        widget.servicesModel.time ?? "",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.zigHotelsColors.teal,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
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
              GestureDetector(
                onTap: () => _showDateTimePicker(theme),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: theme.zigHotelsColors.onPrimary),
                  ),
                  child: Padding(
                    padding: padding.symmetric(vertical: Dimensions.small),
                    child: Row(
                      children: [
                        Padding(
                          padding: padding.only(left: Dimensions.medium),
                          child: Icon(
                            Icons.access_time_outlined,
                            color: theme.zigHotelsColors.onPrimary,
                          ),
                        ),
                        const Space(Dimensions.medium),
                        Text(
                          isDateSelected
                              ? dateFormatter.format(selectedDateTime)
                              : 'Select Time',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.zigHotelsColors.onPrimary,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: padding.only(right: Dimensions.medium),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16.sp,
                            color: theme.zigHotelsColors.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Space(Dimensions.small),
              Text(
                'Optional',
                style: theme.textTheme.titleMedium
                    ?.copyWith(color: theme.zigHotelsColors.onPrimary),
              ),
              const Space(Dimensions.smaller),
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
      ),
    );
  }

  bool isTimeInRange(String selectedServiceTime, String serviceTimeRange) {
    if (serviceTimeRange == "24 hours") {
      return true;
    }
    // Split the service time range into start time and end time strings
    List<String> timeRangeParts = serviceTimeRange.split('-');
    String serviceStartTime = timeRangeParts[0];
    String serviceEndTime = timeRangeParts[1];

    // Extract the time part from the selected service time
    String selectedTimePart = selectedServiceTime.split(' ')[1].substring(0, 5);
    // Format the selected service time and service time range to match the given string format
    DateFormat formatter = DateFormat('HH:mm');
    DateTime selectedTime = formatter.parse(selectedTimePart);
    DateTime startTime = formatter.parse(serviceStartTime);
    DateTime endTime = formatter.parse(serviceEndTime);

    // Check if the selected service time is within the given time range
    if (selectedTime.isAfter(startTime) && selectedTime.isBefore(endTime)) {
      return true;
    } else {
      return false;
    }
  }

  void _onButtonTapped(BuildContext context) {
    if (isDateSelected) {
      if (isTimeInRange(
        selectedDateTime.toString(),
        widget.servicesModel.time ?? '',
      )) {
        ServiceBookingModel serviceBookingModel = ServiceBookingModel(
          serviceName: widget.servicesModel.serviceName,
          bookingTime: Timestamp.now(),
          servingTime: Timestamp.fromMillisecondsSinceEpoch(
              selectedDateTime.millisecondsSinceEpoch),
          specialRequest: _specialRequestController.text.trim(),
        );
        bool internetStatus = ref.watch(internetConnectionProvider);
        internetStatus
            ? _onServiceBooked(serviceBookingModel, context)
            : showConfirmationToast(msg: 'Internet not available');
      } else {
        showConfirmationToast(
          msg:
              "Service will be available for this ${widget.servicesModel.time} time only",
        );
      }
    } else {
      showConfirmationToast(msg: 'Please select a date and time');
    }
  }

  void _onServiceBooked(
      ServiceBookingModel serviceBookingModel, BuildContext context) {
    isShowLoadingDialog(context, true);
    final appointmentRef = db
        .collection(FirebaseConstants.appointments)
        .doc(_sharedPreferenceHelper.roomNo.toString());
    appointmentRef.collection(FirebaseConstants.serviceBooked).add({
      FirebaseConstants.bookingTime: serviceBookingModel.bookingTime,
      FirebaseConstants.servingTime: serviceBookingModel.servingTime,
      FirebaseConstants.specialRequest: serviceBookingModel.specialRequest,
      "serviceName": serviceBookingModel.serviceName,
    }).then((value) {
      isShowLoadingDialog(context, false);
      Navigator.pop(context);
      showConfirmationToast(msg: "Service Booked", success: true);
    });
  }
}
