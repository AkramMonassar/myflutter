import 'package:flutter/material.dart';
import 'package:school_delivery/ui/temporary_Start_Interface1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:provider/provider.dart';


import 'Provider/provider_Data_Manager.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderDataStudent(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        home: TemporaryStartUI1(),
      ),
    );
  }
}

class TemporaryStartUI1 extends StatefulWidget {
  @override
  TemporaryStartInterface1 createState() => TemporaryStartInterface1();
}


