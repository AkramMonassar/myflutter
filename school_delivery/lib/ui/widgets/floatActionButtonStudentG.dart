import 'package:flutter/material.dart';
import '../note_Write_StudentGuardian21.dart';
import '../notifications_Parent22.dart';


class FloatActionButtonGuardiansStudent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
