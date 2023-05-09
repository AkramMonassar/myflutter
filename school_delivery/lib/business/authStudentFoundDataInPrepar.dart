import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_delivery/ui/Feature/Login%20Screen/Login_Screen_Admin.dart';
import 'package:school_delivery/ui/Feature/Login%20Screen/Login_Screen_Supervisor.dart';
import 'package:school_delivery/ui/options_Admin_Drivers8.dart';

import '../ui/preparing_Students16.dart';

class AuthStudentFoundDataInPrepare extends StatelessWidget {
  const AuthStudentFoundDataInPrepare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context,snapshot){
          if(snapshot.hasData){
            print("data in has data : ${snapshot.data}");
            return PreparingStudents16();
          }else {
            print("data in has not  data : ${snapshot.data}");
            return LoginScreenSupervisor();
          }
        }),
      ),
    );
  }
}
