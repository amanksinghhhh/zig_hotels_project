import 'package:cloud_firestore/cloud_firestore.dart';
import 'models.dart';

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