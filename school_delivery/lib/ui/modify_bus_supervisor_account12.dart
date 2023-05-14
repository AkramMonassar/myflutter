
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../business/authSignInSignUp.dart';
import 'Core/Animation/Fade_Animation.dart';
import 'Core/Colors/Hex_Color.dart';
enum FormData {
  name,
  phone,
  address,
  email,
  password,
  confirmPassword
}

class ModifyBusSupervisor12 extends StatefulWidget {
  final DocumentSnapshot document;

  ModifyBusSupervisor12({required this.document});

  @override
  State<StatefulWidget> createState() {
    return _ModifyBusSupervisor12();
  }

// Read from Firebase
}

class _ModifyBusSupervisor12 extends State<ModifyBusSupervisor12> {
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('Supervisor');

  String? name;
  int? phone;
  String? address;
  String? email;
  String? password;
  String? confirmPassword;



  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;

  @override
  void initState() {
    super.initState();
    name = (widget.document.data() as Map<String, dynamic>)['name'];
    phone = (widget.document.data()as Map<String, dynamic>)['phone'];
    address=(widget.document.data()as Map<String, dynamic>)['address'];
    email=(widget.document.data() as Map<String, dynamic>)['email'];
    password=(widget.document.data() as Map<String, dynamic>)['password'];
    confirmPassword=(widget.document.data()as Map<String, dynamic>)['confirmPassword'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffecefe4),
        body: Container(
          decoration:  BoxDecoration(
              image: const DecorationImage(
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
                              //image logo صورة الشعار
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
                                  "تعديل بيانات مشرف",
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
                                      hintText: 'اسم المشرف كاملاً',
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
                              //  عنوان المشرفين
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
                                        hintText: 'عنوان المشرف',
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
                              //  البريد الالكتروني
                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: selected == FormData.email
                                          ? enabled
                                          : backgroundColor),
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    controller: TextEditingController(text: email),
                                    keyboardType: TextInputType.text,
                                    onTap: () {
                                      setState(() {
                                        selected = FormData.email;
                                      });
                                    },
                                    onChanged: (value) => email = value,
                                    decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: selected == FormData.email
                                              ? enabledtxt
                                              : deaible,
                                          size: 20,
                                        ),
                                        hintText: 'البريد الالكتروني',
                                        hintStyle: TextStyle(
                                            color: selected == FormData.email
                                                ? enabledtxt
                                                : deaible,
                                            fontSize: 12)),
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        color: selected == FormData.email
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
                              // كلمة السر
                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: selected == FormData.password
                                          ? enabled
                                          : backgroundColor),
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    controller: TextEditingController(text: password),
                                    onTap: () {
                                      setState(() {
                                        selected = FormData.password;
                                      });
                                    },
                                    onChanged: (value) => password = value,
                                    decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.lock_open_outlined,
                                          color: selected == FormData.password
                                              ? enabledtxt
                                              : deaible,
                                          size: 20,
                                        ),
                                        suffixIcon: IconButton(
                                          icon: ispasswordev
                                              ? Icon(
                                            Icons.visibility_off,
                                            color: selected == FormData.password
                                                ? enabledtxt
                                                : deaible,
                                            size: 20,
                                          )
                                              : Icon(
                                            Icons.visibility,
                                            color: selected == FormData.password
                                                ? enabledtxt
                                                : deaible,
                                            size: 20,
                                          ),
                                          onPressed: () => setState(
                                                  () => ispasswordev = !ispasswordev),
                                        ),
                                        hintText: 'كلمة السر',
                                        hintStyle: TextStyle(
                                            color: selected == FormData.password
                                                ? enabledtxt
                                                : deaible,
                                            fontSize: 12)),
                                    obscureText: ispasswordev,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        color: selected == FormData.password
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
                              // تاكيد كلمة المرور
                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: selected == FormData.confirmPassword
                                          ? enabled
                                          : backgroundColor),
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    controller: TextEditingController(text: confirmPassword),
                                    onTap: () {
                                      setState(() {
                                        selected = FormData.confirmPassword;
                                      });
                                    },
                                    onChanged: (value) => confirmPassword = value,
                                    decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.lock_open_outlined,
                                          color: selected == FormData.confirmPassword
                                              ? enabledtxt
                                              : deaible,
                                          size: 20,
                                        ),
                                        suffixIcon: IconButton(
                                          icon: ispasswordev
                                              ? Icon(
                                            Icons.visibility_off,
                                            color: selected == FormData.confirmPassword
                                                ? enabledtxt
                                                : deaible,
                                            size: 20,
                                          )
                                              : Icon(
                                            Icons.visibility,
                                            color: selected == FormData.confirmPassword
                                                ? enabledtxt
                                                : deaible,
                                            size: 20,
                                          ),
                                          onPressed: () => setState(
                                                  () => ispasswordev = !ispasswordev),
                                        ),
                                        hintText: 'تاكيد كلمة المرور',
                                        hintStyle: TextStyle(
                                            color: selected == FormData.confirmPassword
                                                ? enabledtxt
                                                : deaible,
                                            fontSize: 12)),
                                    obscureText: ispasswordev,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        color: selected == FormData.confirmPassword
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
                                      setState((){
                                        collectionReference.doc(widget.document.id).update({
                                          'name': name,
                                          'phone': phone,
                                          'address':address,
                                          'email':email,
                                          'password':password,
                                          'confirmPassword':confirmPassword
                                        });
                                        Navigator.pop(context);
                                        AuthSignInSignUp.showAlertDialog(context, 'لقد تم تعديل البيانات', 'نجحت');
                                      });
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
