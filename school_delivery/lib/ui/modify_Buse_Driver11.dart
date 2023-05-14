
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../business/authSignInSignUp.dart';
import 'Core/Animation/Fade_Animation.dart';
import 'Core/Colors/Hex_Color.dart';
enum FormData {
  name,
  phone,
  address,
  plateNumber,
  idCardNumber
}

class ModifyBusDriver11 extends StatefulWidget {
  final DocumentSnapshot document;

  ModifyBusDriver11({required this.document});

  @override
  State<StatefulWidget> createState() {
    return _ModifyBusDriver11();
  }

// Read from Firebase
}

class _ModifyBusDriver11 extends State<ModifyBusDriver11> {
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('Buses');

  String? name;
  int? phone;
  String? address;
  String? plateNumber;
  String? idCardNumber;

  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;

  @override
  void initState() {
    super.initState();
    name = (widget.document.data() as Map<String, dynamic>)['fullName'];
    phone = (widget.document.data()as Map<String, dynamic>)['phone'];
    address=(widget.document.data()as Map<String, dynamic>)['busOwnerAddress'];
    plateNumber=(widget.document.data() as Map<String, dynamic>)['plateNumber'];
    idCardNumber=(widget.document.data()as Map<String, dynamic>)['idCardNumber'];

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffecefe4),
        body: Container(
          decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(80)
          ),

          child: Directionality(
            textDirection: TextDirection.rtl,
            child:Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        HexColor("#fff").withOpacity(0.2), BlendMode.dstATop),
                    image: AssetImage('assets/images/img.jpg'),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 5,
                        color:
                        const Color.fromARGB(255, 171, 211, 250).withOpacity(0.4),
                        child: Container(
                          width: 365,
                          padding: const EdgeInsets.all(40.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //image logo
                              FadeAnimation(
                                delay: 0.8,
                                child:Image.asset('assets/images/schooldelivery.png',width: 220,height: 220,),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //نص عنوان الصفحة
                              FadeAnimation(
                                delay: 1,
                                child: const Text(
                                  "تعديل بيانات سائقي الباصات",
                                  style: TextStyle(
                                      color: Colors.white, letterSpacing: 0.5),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              //الاسم كاملاً
                              FadeAnimation(
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
                                    controller: TextEditingController(text: name),
                                    onTap: () {
                                      setState(() {
                                        selected = FormData.name;
                                      });
                                    },
                                    onChanged: (value) => name = value,
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
                                      hintText: 'اسم سائق الباص / الحافلة كاملاً',
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
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              //  رقم الهاتف
                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: selected == FormData.phone
                                          ? enabled
                                          : backgroundColor),
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    controller: TextEditingController(text: phone.toString()),
                                    keyboardType: TextInputType.number,
                                    onTap: () {
                                      setState(() {
                                        selected = FormData.phone;
                                      });
                                    },
                                    onChanged: (value) => phone = int.parse(value),
                                    decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none,

                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: selected == FormData.phone
                                              ? enabledtxt
                                              : deaible,
                                          size: 20,
                                        ),
                                        hintText: 'رقم الهاتف',
                                        hintStyle: TextStyle(
                                            color: selected == FormData.phone
                                                ? enabledtxt
                                                : deaible,
                                            fontSize: 12)),
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        color: selected == FormData.phone
                                            ? enabledtxt
                                            : deaible,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              //  عنوان سائق الباص
                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: selected == FormData.address
                                          ? enabled
                                          : backgroundColor),
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    controller: TextEditingController(text: address),
                                    keyboardType: TextInputType.text,
                                    onTap: () {
                                      setState(() {
                                        selected = FormData.address;
                                      });
                                    },
                                    onChanged: (value) => address = value,
                                    decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.home,
                                          color: selected == FormData.address
                                              ? enabledtxt
                                              : deaible,
                                          size: 20,
                                        ),
                                        hintText: 'عنوان سائق الباص/الحافلة',
                                        hintStyle: TextStyle(
                                            color: selected == FormData.address
                                                ? enabledtxt
                                                : deaible,
                                            fontSize: 12)),
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        color: selected == FormData.address
                                            ? enabledtxt
                                            : deaible,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // رقم لوحة الباص / الحافلة
                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: selected == FormData.plateNumber
                                          ? enabled
                                          : backgroundColor),
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    controller: TextEditingController(text: plateNumber.toString()),
                                    keyboardType: TextInputType.number,
                                    onTap: () {
                                      setState(() {
                                        selected = FormData.plateNumber;
                                      });
                                    },
                                    onChanged: (value) => plateNumber =value,
                                    decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.car_rental,
                                          color: selected == FormData.plateNumber
                                              ? enabledtxt
                                              : deaible,
                                          size: 20,
                                        ),
                                        hintText: 'رقم لوحة الباص/الحافلة',
                                        hintStyle: TextStyle(
                                            color: selected == FormData.phone
                                                ? enabledtxt
                                                : deaible,
                                            fontSize: 12)),
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        color: selected == FormData.plateNumber
                                            ? enabledtxt
                                            : deaible,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // بطاقة شخصيةالسائق
                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: selected == FormData.idCardNumber
                                          ? enabled
                                          : backgroundColor),
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    controller: TextEditingController(text: idCardNumber.toString()),
                                    keyboardType: TextInputType.number,
                                    onTap: () {
                                      setState(() {
                                        selected = FormData.idCardNumber;
                                      });
                                    },
                                    onChanged: (value) => idCardNumber = value,
                                    decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.card_travel,
                                          color: selected == FormData.phone
                                              ? enabledtxt
                                              : deaible,
                                          size: 20,
                                        ),
                                        hintText: 'رقم البطاقة الشخصية',
                                        hintStyle: TextStyle(
                                            color: selected == FormData.idCardNumber
                                                ? enabledtxt
                                                : deaible,
                                            fontSize: 12)),
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        color: selected == FormData.idCardNumber
                                            ? enabledtxt
                                            : deaible,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // تصميم الزر
                              FadeAnimation(
                                delay: 1,
                                child: TextButton(
                                    onPressed: () {
                                      collectionReference.doc(widget.document.id).update({
                                        'fullName': name,
                                        'phone': phone,
                                        'busOwnerAddress':address,
                                        'plateNumber':plateNumber,
                                        'idCardNumber':idCardNumber
                                      });
                                      Navigator.pop(context);
                                      AuthSignInSignUp.showAlertDialog(context, 'لقد تم تعديل البيانات', 'نجحت');
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: const Color(0xFF2697FF),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14.0, horizontal: 80),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(12.0))),
                                    child: const Text(
                                      "تعديل",
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.5,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //End of Center Card
                      //Start of outer card
                      const SizedBox(
                        height: 10,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
