import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttendanceReport extends StatelessWidget {
  final Map<String, Map<String, int>> attendance;

  const AttendanceReport(this.attendance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Report'),
      ),
      body: ListView.builder(
        itemCount: attendance.length,
        itemBuilder: (context, index) {
          var student = attendance.keys.elementAt(index);
          var daysAttended = attendance[student]!['daysAttended']!;
          var daysAbsent = attendance[student]!['daysAbsent']!;
          return ListTile(
            title: Text(student),
            subtitle: Text('Days attended: $daysAttended, Days absent: $daysAbsent'),
          );
        },
      ),
    );
  }
}