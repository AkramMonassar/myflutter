import 'package:flutter/material.dart';

import '../add_New_Student17.dart';
import '../note_Write_Supervisor18.dart';
import '../notifications_Note_Supervisor23.dart';
import '../notifications_Supervisor23.dart';

class FloatActionButton extends StatelessWidget {
  const FloatActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // زر note
        FloatingActionButton(
          heroTag: null,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteWriteSuprvisor18()));
          },
          backgroundColor: Colors.indigo[300],
          child: const Icon(Icons.note_add_outlined),
        ),
        Stack(
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsSupervisor23()));
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
      ],
    );
  }
}
