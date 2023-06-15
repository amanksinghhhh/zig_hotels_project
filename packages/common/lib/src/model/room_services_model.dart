import 'package:flutter/material.dart';

class ServicesModel {
  final Widget image;
  final String? time;
  final String serviceName;

  ServicesModel({
    required this.image,
    this.time,
    required this.serviceName,
  });
}
