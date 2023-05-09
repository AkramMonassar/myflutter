import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotesStudentG{
  int?  id;
  final String? message;
  final DateTime? timestamp;
  // supervisor or studentGuardian
  String? writer;
  int? studentGuardianId;
  int? supervisorId;


  NotesStudentG(this.message,this.writer,this.studentGuardianId,this.supervisorId, {required DateTime timestamp})
      : this.timestamp = timestamp ;

  NotesStudentG.fromSnapshot(DocumentSnapshot snapshot)
      : message = snapshot['message'],
        // writer=snapshot['writer'],
        // studentGuardianId=snapshot['writer'],
        // supervisorId=snapshot['supervisorId'],
        timestamp = (snapshot['timestamp'] as Timestamp).toDate();
}