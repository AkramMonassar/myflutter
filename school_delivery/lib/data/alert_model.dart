import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '';

class Alert {
  final String? message;
  final DateTime? timestamp;

  Alert(this.message, {required DateTime timestamp})
      : this.timestamp = timestamp ;
      // : this.timestamp = timestamp ?? DateTime.now();

  Alert.fromSnapshot(DocumentSnapshot snapshot)
      : message = snapshot['message'],
        timestamp = (snapshot['timestamp'] as Timestamp).toDate();

}