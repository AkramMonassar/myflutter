import 'dart:async';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:school_delivery/ui/users_Interface5.dart';

import '../main.dart';

class TemporaryStartInterface1  extends State<TemporaryStartUI1> {

  @override
    void initState() {
      super.initState();
      navigateToMainInterface();
    }

  Future<Timer> navigateToMainInterface() async {
    return Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserInterface5()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffbac494),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(0),
            ),
            // margin:  EdgeInsets.fromLTRB(-43.0, -139.0, -43.0, 136.0),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          ),
          Pinned.fromPins(
            Pin(start: 20, end: 20.0),
            Pin(size: 480.0, middle: 0.6015),
            child: Container(
              width: 3,
              height: 3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/schooldelivery.png'),
                  fit: BoxFit.cover,

                ),

              ),
            ),
          ),

        ],
      ),
    );
  }
}
