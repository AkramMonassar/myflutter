import 'package:flutter/material.dart';
import 'package:school_delivery/main.dart';
import 'package:school_delivery/ui/student_Parent20.dart';
import 'package:school_delivery/ui/options_Admin_Drivers8.dart';

import '../../../business/authSignInSignUp.dart';
import '../../Core/Animation/Fade_Animation.dart';
import '../../Core/Colors/Hex_Color.dart';
import '../Sign Up Screen/SignUp_Screen.dart';

enum FormData {
  email,
  password,
}

class LoginScreenGuardian extends StatefulWidget {
  @override
  State<LoginScreenGuardian> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenGuardian> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;
  final message = "يرجى مراجعة ادخال البيانات او مراجعة البريد الالكتروني وكتابته بطريقة صحيحية";


  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
                            child:Image.asset('assets/images/schooldelivery.png',width: 250,height: 250,),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: const Text(
                              "تكرماً سجل الدخول للاستمرار",
                              style: TextStyle(
                                  color: Colors.white, letterSpacing: 0.5),
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
                                controller: emailController,
                                onTap: () {
                                  setState(() {
                                    selected = FormData.email;
                                  });
                                },
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
                                controller: passwordController,
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
                                    hintText: 'كلمة المرور',
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
                            child: TextButton(
                                onPressed: () {
                                  //
                                  if(AuthSignInSignUp.isEmail(emailController.text)) {
                                    AuthSignInSignUp.signInStudents(
                                        context, emailController.text,
                                        passwordController.text);
                                  }else{
                                    AuthSignInSignUp.showAlertDialog(context, message, 'انتبه');
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
                                  "دخول",
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
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


