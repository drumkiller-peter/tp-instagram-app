import 'package:cloud_firestore/cloud_firestore.dart';

class AppSerializer {
  static DateTime timeStampToDateTime(Timestamp timeStamp) {
    return timeStamp.toDate();
  }
}
