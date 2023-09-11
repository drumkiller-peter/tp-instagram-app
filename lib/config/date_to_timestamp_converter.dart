import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimeStampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimeStampConverter();
  @override
  DateTime fromJson(Timestamp json) {
    log("I am time stamp fromJson $json");
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime object) {
    return Timestamp.fromDate(object);
  }
}
