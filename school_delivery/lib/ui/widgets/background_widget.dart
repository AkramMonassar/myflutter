import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffecefe4),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
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
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffecefe4),
                borderRadius: BorderRadius.circular(150)
            ),
          ),
          Pinned.fromPins(
            Pin(start: 78.0, end: 77.0),
            Pin(size: 280.0, start: 60.0),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/schoolbus.png'),
                  fit: BoxFit.cover,
                ),

              ),
            ),
          ),
                 ]),
      );
  }
}
