import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_delivery/ui/add_New_Student17.dart';
import 'package:school_delivery/ui/modify_New_Student17.dart';

import '../users_Interface5.dart';

class MenuSettingLogoutAddDelete extends StatelessWidget {
  const MenuSettingLogoutAddDelete({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          showMenu(
            context: context,
            position: const RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
            items: [
              PopupMenuItem(
                value: 'Option 1',
                child: GestureDetector(
                    onTap: (){
                      FirebaseAuth.instance.signOut();
                      // Navigator.pop(context);
                      // Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserInterface5()));
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.logout_outlined),
                        SizedBox(width: 8,),
                        Text('تسجيل خروج'),
                      ],
                    )),
              ),
              PopupMenuItem(
                value: 'Option 2',
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStudentsG17()));
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.add),
                      SizedBox(width: 8,),
                      Text('اضافة طالب'),
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                value: 'Option 2',
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ModifyStudentsG17()));
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.edit_outlined),
                      SizedBox(width: 8,),
                      Text('تعديل طالب'),
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                value: 'Option 3',
                child: Row(
                  children: const [
                    Icon(Icons.delete_outlined),
                    SizedBox(width: 8,),
                    Text('حذف طالب'),
                  ],
                ),
              ),
            ],
            elevation: 8.0,
          );
        },
        child: const Icon(Icons.more_vert,color: Colors.white,));
  }
}