
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/Animation/Fade_Animation.dart';
enum FormData {
  name,
  phone,
  address,
  plateNumber,
  idCardNumber
}
class TextFieldAnimation extends StatefulWidget {
  const TextFieldAnimation({Key? key}) : super(key: key);

  @override
  State<TextFieldAnimation> createState() => TextFieldAnimationState();
}

class TextFieldAnimationState extends State<TextFieldAnimation> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;
  final controllerName = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerBusOwnerAddress = TextEditingController();
  final controllerPlateNumber = TextEditingController();
  final controllerIdCardNumber = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 1,
      child: Container(
        width: 300,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: selected == FormData.name
              ? enabled
              : backgroundColor,
        ),
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          controller: controllerName,
          onTap: () {
            setState(() {
              selected = FormData.name;
            });
          },
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.person_outline,
              color: selected == FormData.name
                  ? enabledtxt
                  : deaible,
              size: 20,
            ),
            hintText: 'اسم المستخدم',
            hintStyle: TextStyle(
                color: selected == FormData.name
                    ? enabledtxt
                    : deaible,
                fontSize: 12),
          ),
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
              color: selected == FormData.name
                  ? enabledtxt
                  : deaible,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ),
    );
  }
}
