
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_delivery/business/authSignInSignUp.dart';
import 'package:school_delivery/ui/options_Admin_Drivers8.dart';

import '../../../data/admin_model.dart';
import '../../Core/Animation/Fade_Animation.dart';
import '../../Core/Colors/Hex_Color.dart';
import '../Login Screen/Login_Screen_Admin.dart';

enum FormData {id, Name, Phone, email, password, confirmPassword }

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;

  FormData? selected;

  final _nameController = TextEditingController();
  final _phoneController =  TextEditingController();
  final _emailController =  TextEditingController();
  final _passwordController =  TextEditingController();
  final _confirmPasswordController =  TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.1, 0.4, 0.7, 0.9],
              colors: [
                HexColor("#4b4293").withOpacity(0.8),
                HexColor("#4b4293"),
                HexColor("#08418e"),
                HexColor("#08418e")
              ],
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  HexColor("#fff").withOpacity(0.2), BlendMode.dstATop),
              image: const NetworkImage(
                'https://mir-s3-cdn-cf.behance.net/project_modules/fs/01b4bd84253993.5d56acc35e143.jpg',
              ),
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    color:
                        const Color.fromARGB(255, 171, 211, 250).withOpacity(0.4),
                    child: Container(
                      width: 400,
                      padding: const EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FadeAnimation(
                            delay: 0.8,
                            child: Image.asset(
                              'assets/images/schoolbus.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: Container(
                              child: Text(
                                "انشاء حساب جديد",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    letterSpacing: 0.5),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: Container(
                              width: 300,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: selected == FormData.email
                                    ? enabled
                                    : backgroundColor,
                              ),
                              padding: const EdgeInsets.all(5.0),
                              child: TextField(
                                controller: _nameController,
                                onTap: () {
                                  setState(() {
                                    selected = FormData.Name;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.title,
                                    color: selected == FormData.Name
                                        ? enabledtxt
                                        : deaible,
                                    size: 20,
                                  ),
                                  hintText: '* اكتب اسمك كاملاً',
                                  hintStyle: TextStyle(
                                      color: selected == FormData.Name
                                          ? enabledtxt
                                          : deaible,
                                      fontSize: 12),
                                ),
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(
                                    color: selected == FormData.Name
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
                          FadeAnimation(
                            delay: 1,
                            child: Container(
                              width: 300,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: selected == FormData.Phone
                                    ? enabled
                                    : backgroundColor,
                              ),
                              padding: const EdgeInsets.all(5.0),
                              child: TextField(
                                controller: _phoneController,
                                keyboardType: TextInputType.number,
                                onTap: () {
                                  setState(() {
                                    selected = FormData.Phone;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.phone_android_rounded,
                                    color: selected == FormData.Phone
                                        ? enabledtxt
                                        : deaible,
                                    size: 20,
                                  ),
                                  hintText: '* رقم الهاتف',
                                  hintStyle: TextStyle(
                                      color: selected == FormData.Phone
                                          ? enabledtxt
                                          : deaible,
                                      fontSize: 12),
                                ),
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(
                                    color: selected == FormData.Phone
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
                          FadeAnimation(
                            delay: 1,
                            child: Container(
                              width: 300,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: selected == FormData.email
                                    ? enabled
                                    : backgroundColor,
                              ),
                              padding: const EdgeInsets.all(5.0),
                              child: TextField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                onTap: () {
                                  setState(() {
                                    selected = FormData.email;
                                  });
                                },
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: selected == FormData.email
                                        ? enabledtxt
                                        : deaible,
                                    size: 20,
                                  ),
                                  hintText: '* البريد الالكتروني',
                                  hintStyle: TextStyle(
                                      color: selected == FormData.email
                                          ? enabledtxt
                                          : deaible,
                                      fontSize: 12),
                                ),
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
                                controller: _passwordController,
                                onTap: () {
                                  setState(() {
                                    selected = FormData.password;
                                  });
                                },
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
                                    hintText: '* كلمة المرور',
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
                                controller: _confirmPasswordController,
                                onTap: () {
                                  setState(() {
                                    selected = FormData.confirmPassword;
                                  });
                                },
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
                                              color: selected ==
                                                      FormData.confirmPassword
                                                  ? enabledtxt
                                                  : deaible,
                                              size: 20,
                                            )
                                          : Icon(
                                              Icons.visibility,
                                              color: selected ==
                                                      FormData.confirmPassword
                                                  ? enabledtxt
                                                  : deaible,
                                              size: 20,
                                            ),
                                      onPressed: () => setState(
                                          () => ispasswordev = !ispasswordev),
                                    ),
                                    hintText: '* تاكيد كلمة المرور',
                                    hintStyle: TextStyle(
                                        color:
                                            selected == FormData.confirmPassword
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
                            height: 25,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: TextButton(
                                onPressed: () {
                                  AuthSignInSignUp.signUp(context,_nameController.text,_phoneController.text,_emailController.text,_passwordController.text,_confirmPasswordController.text);
                                  if(_passwordController.text==_confirmPasswordController.text) {
                                    setState(() {
                                      final admin = Administrator(
                                        fullName: _nameController.text,
                                        phone: int.parse(_phoneController.text),
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        confirmPassword: _confirmPasswordController
                                            .text,
                                      );
                                      Administrator.createAdministrator(admin);
                                    });
                                    _nameController.text="";
                                    _phoneController.text="";
                                    _emailController.text="";
                                    _passwordController.text="";
                                    _confirmPasswordController.text="";
                                  }else{

                                  }
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFF2697FF),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14.0, horizontal: 80),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0))),
                                child: const Text(
                                  "اشتراك",
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
                    height: 20,
                  ),

                  FadeAnimation(
                    delay: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(" اذا كنت تملك حساب  ",
                            style: TextStyle(
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return LoginScreenAdmin();
                            }));
                          },
                          child: Text("تسجيل الدخول",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
