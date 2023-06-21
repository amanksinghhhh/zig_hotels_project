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
  List<OrderDetailsModel> minibarMenu = [];
  int totalMinibarBill = 0;

  @override
  void initState() {
    super.initState();
    selectedDateTime = DateTime.now();
    if (widget.servicesModel.serviceName == "Minibar Refill") {
      _getMinibarMenu();
    }
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
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        widget.servicesModel.time ?? "",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.zigHotelsColors.teal,
                          fontSize: 18.sp,
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
              _minibarMenuSection(padding, theme),
              Text(
                "Delivery Time",
                style: theme.textTheme.titleMedium
                    ?.copyWith(color: theme.zigHotelsColors.onPrimary),
              ),
              const Space(Dimensions.small),
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
              ),
              const Space(Dimensions.medium),
            ],
          ),
        ),
      ),
    );
  }

  Widget _minibarMenuSection(EdgeInsetsOf padding, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: minibarMenu.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: padding.symmetric(vertical: Dimensions.smaller),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    minibarMenu[index].itemName ?? "",
                    style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.zigHotelsColors.onPrimary,
                        fontSize: 18.sp),
                  ),
                  const Space(Dimensions.smallest),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (minibarMenu[index].quantity! >= 1) {
                              minibarMenu[index].quantity =
                                  minibarMenu[index].quantity! - 1;
                            }
                          });
                          _calculateMinibarBill();
                        },
                        child: Icon(
                          Icons.remove_circle,
                          color: theme.zigHotelsColors.onPrimary,
                        ),
                      ),
                      const Space(Dimensions.small),
                      Text(
                        minibarMenu[index].quantity.toString(),
                        style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.zigHotelsColors.onPrimary,
                            fontSize: 20.sp),
                      ),
                      const Space(Dimensions.small),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            minibarMenu[index].quantity =
                                minibarMenu[index].quantity! + 1;
                          });
                          _calculateMinibarBill();
                        },
                        child: Icon(
                          Icons.add_circle,
                          color: theme.zigHotelsColors.onPrimary,
                        ),
                      ),
                      const Space(Dimensions.medium),
                      Text(
                        'X   ₹ ${minibarMenu[index].price.toString()}',
                        style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.zigHotelsColors.onPrimary,
                            fontSize: 16.sp),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        (totalMinibarBill != 0)
            ? Column(
                children: [
                  const Space(Dimensions.small),
                  Text(
                    "Total bill : ₹ $totalMinibarBill",
                    style: theme.textTheme.headlineLarge?.copyWith(
                        color: theme.zigHotelsColors.teal, fontSize: 20.sp),
                  ),
                ],
              )
            : const SizedBox.shrink(),
        const Space(Dimensions.smaller),
      ],
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
        if (widget.servicesModel.serviceName == "Minibar Refill" && totalMinibarBill == 0) {
          showConfirmationToast(
            msg: "Add items to order",
          );
        } else {
          ServiceBookingModel serviceBookingModel = ServiceBookingModel(
              serviceName: widget.servicesModel.serviceName,
              bookingTime: Timestamp.now(),
              servingTime: Timestamp.fromMillisecondsSinceEpoch(
                  selectedDateTime.millisecondsSinceEpoch),
              specialRequest: _specialRequestController.text.trim(),
              orderDetailsModel: getOrderList(),
              totalBill: totalMinibarBill
          );
          bool internetStatus = ref.watch(internetConnectionProvider);
          internetStatus
              ? _onServiceBooked(serviceBookingModel, context)
              : showConfirmationToast(msg: 'Internet not available');
        }
      } else {
        showConfirmationToast(
          msg: "Service will be available for this ${widget.servicesModel.time} time only",
        );
      }
    } else {
      showConfirmationToast(msg: 'Please select a date and time');
    }
  }

  // void _onButtonTapped(BuildContext context) {
  //   if (isDateSelected) {
  //     if (isTimeInRange(
  //       selectedDateTime.toString(),
  //       widget.servicesModel.time ?? '',
  //     )) {
  //       if (widget.servicesModel.serviceName == "Minibar Refill") {
  //         if (totalMinibarBill == 0) {
  //           showConfirmationToast(
  //             msg: "Add items to order",
  //           );
  //         } else {
  //           ServiceBookingModel serviceBookingModel = ServiceBookingModel(
  //             serviceName: widget.servicesModel.serviceName,
  //             bookingTime: Timestamp.now(),
  //             servingTime: Timestamp.fromMillisecondsSinceEpoch(
  //                 selectedDateTime.millisecondsSinceEpoch),
  //             specialRequest: _specialRequestController.text.trim(),
  //             orderDetailsModel: getOrderList(),
  //             totalBill: totalMinibarBill
  //           );
  //           bool internetStatus = ref.watch(internetConnectionProvider);
  //           internetStatus
  //               ? _onServiceBooked(serviceBookingModel, context)
  //               : showConfirmationToast(msg: 'Internet not available');
  //         }
  //       }
  //       else {
  //         ServiceBookingModel serviceBookingModel = ServiceBookingModel(
  //             serviceName: widget.servicesModel.serviceName,
  //             bookingTime: Timestamp.now(),
  //             servingTime: Timestamp.fromMillisecondsSinceEpoch(
  //                 selectedDateTime.millisecondsSinceEpoch),
  //             specialRequest: _specialRequestController.text.trim(),
  //             orderDetailsModel: getOrderList(),
  //             totalBill: totalMinibarBill
  //         );
  //         bool internetStatus = ref.watch(internetConnectionProvider);
  //         internetStatus
  //             ? _onServiceBooked(serviceBookingModel, context)
  //             : showConfirmationToast(msg: 'Internet not available');
  //       }
  //     } else {
  //       showConfirmationToast(
  //         msg:
  //             "Service will be available for this ${widget.servicesModel.time} time only",
  //       );
  //     }
  //   } else {
  //     showConfirmationToast(msg: 'Please select a date and time');
  //   }
  // }

  void _onServiceBooked(
      ServiceBookingModel serviceBookingModel, BuildContext context) {
    isShowLoadingDialog(context, true);
    final appointmentRef = db
        .collection(FirebaseConstants.appointments)
        .doc(_sharedPreferenceHelper.roomNo.toString());
    appointmentRef
        .collection(FirebaseConstants.serviceBooked)
        .add(serviceBookingModel.toFirestoreMap())
        .then((value) {
      isShowLoadingDialog(context, false);
      Navigator.pop(context);
      showConfirmationToast(msg: "Service Booked", success: true);
    });
  }

  void _getMinibarMenu() {
    db.collection("minibar_menu").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          minibarMenu.add(
            OrderDetailsModel(
              itemName: docSnapshot.data()['itemName'],
              price: docSnapshot.data()['price'],
              quantity: 0,
            ),
          );
        }
        setState(() {});
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  List<OrderDetailsModel> getOrderList(){
    List<OrderDetailsModel> orderedList = [];
    for (int i = 0; i < minibarMenu.length; i++){
      if(minibarMenu[i].quantity !=0){
        orderedList.add(minibarMenu[i]);
      }
    }
    return orderedList;
  }

  int _calculateMinibarBill() {
    totalMinibarBill = 0;
    for (int i = 0; i < minibarMenu.length; i++) {
      totalMinibarBill =
          totalMinibarBill + (minibarMenu[i].price! * minibarMenu[i].quantity!);
    }
    setState(() {});
    return totalMinibarBill;
  }
}
