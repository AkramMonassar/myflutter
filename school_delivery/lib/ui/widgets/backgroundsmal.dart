import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';

class BackgroundSmall extends StatelessWidget {
  const BackgroundSmall({Key? key}) : super(key: key);

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
          ]),
    );
  }
}
