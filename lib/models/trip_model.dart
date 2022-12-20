import 'dart:convert';

import 'package:gotrip/models/user_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TripModel {
  final String from;
  final int id;
  final String to;
  final double fare;
  final String carNumber;
  final String carType;
  final DateTime departure;
  final bool isActive;
  final int seatAvailable;
  final UserModel driver;

  TripModel({
    required this.driver,
    required this.id,
    required this.from,
    required this.to,
    required this.fare,
    required this.carNumber,
    required this.carType,
    required this.departure,
    required this.seatAvailable,
    this.isActive = false,
  });

  TripModel copyWith({
    String? from,
    String? to,
    double? fare,
    String? carNumber,
    String? carType,
    DateTime? departure,
    bool? isActive,
    int? seatAvailable,
  }) {
    return TripModel(
      driver: driver,
      id: id,
      from: from ?? this.from,
      to: to ?? this.to,
      fare: fare ?? this.fare,
      carNumber: carNumber ?? this.carNumber,
      carType: carType ?? this.carType,
      departure: departure ?? this.departure,
      isActive: isActive ?? this.isActive,
      seatAvailable: seatAvailable ?? this.seatAvailable,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from,
      'to': to,
      'ownerID': driver.id,
      'fare': fare,
      'carNumber': carNumber,
      'carType': carType,
      'departure': departure.millisecondsSinceEpoch,
      'isActive': isActive,
      'seatAvailable': seatAvailable,
    };
  }

  factory TripModel.fromMap(Map<String, dynamic> map) {
    return TripModel(
      driver: UserModel.fromMap(map['driver'] as Map<String, dynamic>),
      id: map['id'] as int,
      from: map['from'] as String,
      to: map['to'] as String,
      fare: map['fare'] as double,
      carNumber: map['carNumber'] as String,
      carType: map['carType'] as String,
      departure: DateTime.parse(map['departure']),
      isActive: map['isActive'] as bool,
      seatAvailable: map['seatAvailable'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TripModel.fromJson(String source) =>
      TripModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
