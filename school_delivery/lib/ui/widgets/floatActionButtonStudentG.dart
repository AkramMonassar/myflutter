import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../note_Write_StudentGuardian21.dart';
import '../notifications_Parent22.dart';


class FloatActionButtonGuardiansStudent extends StatefulWidget {

  @override
  State<FloatActionButtonGuardiansStudent> createState() => _FloatActionButtonGuardiansStudentState();
}

class _FloatActionButtonGuardiansStudentState extends State<FloatActionButtonGuardiansStudent> {
  // int count=0;
  @override
  Widget build(BuildContext context) {
    // getCount();
    // print("count : ${ count}");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // زر التقرير
        FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteWriteStudentGuardian21()));
          },
          backgroundColor: Colors.indigo[300],
          child: const Icon(Icons.note_add_outlined),
        ),
        Stack(
          children: [
            FloatingActionButton(
              onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsParent22()));
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
      ],
    );
  }

  // void getCount() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('notesSupervisor')
  //       .get();
  //
  //   setState(() {
  //     count = snapshot.size;
  //   });
  // }
}
