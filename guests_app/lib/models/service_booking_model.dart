import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'models.dart';

class ServiceBookingModel {
  final String? serviceName;
  final Timestamp? bookingTime;
  final Timestamp? servingTime;
  final List<OrderDetailsModel?>? orderDetailsModel;
  final String? specialRequest;

  ServiceBookingModel({
    this.serviceName,
    this.bookingTime,
    this.servingTime,
    this.orderDetailsModel,
    this.specialRequest,
  });

  toFirestoreMap(){
    return {
      FirebaseConstants.bookingTime: bookingTime,
      FirebaseConstants.servingTime: servingTime,
      FirebaseConstants.specialRequest: specialRequest,
      "serviceName": serviceName,
      "orders":orderDetailsModel?.map((e) => {
        'price': e?.price,
        'quantity': e?.quantity,
        'itemName':e?.itemName,
      }).toList()
    };
  }
}