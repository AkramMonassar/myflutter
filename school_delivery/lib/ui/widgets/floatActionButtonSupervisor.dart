import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../add_New_Student17.dart';
import '../note_Write_Supervisor18.dart';
import '../notifications_Note_Supervisor23.dart';
import '../notifications_Supervisor23.dart';

class FloatActionButton extends StatefulWidget {

  @override
  State<FloatActionButton> createState() => _FloatActionButtonState();
}

class _FloatActionButtonState extends State<FloatActionButton> {
  // int count=0;

  // @override
  @override
  Widget build(BuildContext context) {
    // getCount();
    // print("count : ${ count}");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // زر note التي تاتي من ولي الامر
        FloatingActionButton(
          heroTag: null,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteWriteSuprvisor18()));
          },
          backgroundColor: Colors.indigo[300],
          child: const Icon(Icons.note_add_outlined),
        ),
        // التنبيهات التي تاتي من ولي الامر زر
        Stack(
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsSupervisor23()));
              },
              child: const Icon(Icons.notifications,),
            ),
            // Positioned(
            //   right: 0,
            //   child: Container(
            //     padding: const EdgeInsets.all(2),
            //     decoration: BoxDecoration(
            //       color: Colors.red,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     constraints: const BoxConstraints(
            //       minWidth: 16,
            //       minHeight: 16,
            //     ),
            //     child:  Text(
            //       '${count}',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 10,
            //       ),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
          ],
        ),
        // زر كتابة الملاحظات لولي الامر
        FloatingActionButton(
          heroTag: null,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationsNoteSupervisor23()),
            );
          },
          backgroundColor: Colors.indigo[300],
          child: const Icon(Icons.message_outlined),
        ),
        // زر  اضافة طالب جديد
        FloatingActionButton(
          heroTag: null,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStudentsG17()));
          },
          backgroundColor: Colors.indigo[300],
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  // void getCount() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('alerts')
  //       .get();
  //
  //   setState(() {
  //     count = snapshot.size;
  //   });
  // }
}
