
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_delivery/ui/student_Parent20.dart';

import '../ui/preparing_Students16.dart';

class AuthSignInSignUp {

  static Future signIn(
      BuildContext context, String email, String password) async {
    String message = '';

    try {
      UserCredential? userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // handle successful login
      message = ' تم الدخول بنجاح اهلاً وسهلا /${userCredential.user!.email}';
      // Show an error dialog
      showAlertDialog(context, message, "مرحبا");
      print("user in Sign In :${userCredential.user}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // handle user not found
        message = 'لم يتم العثور على المستخدم الرجاء التاكد ومعاودة الدخول';
        print("Error : Invalid user not found");
        // Show an error dialog
        showAlertDialog(context, message, "خطأ");
        print(" خطأ:${e.code}");
      } else if (e.code == 'wrong-password') {
        // handle wrong password error
        message = ' حاول التاكد من كلمة المرور ';
        print("Error : Invalid wrong password error");
        print("Wrong password : ${e.code}");
        showAlertDialog(context, message, "خطأ");
      }else if(e.code=='user-not-found' || e.code == 'wrong-password'){
        // handle wrong password error
        message = ' حاول التاكد من كلمة المرور او البريد الالكتروني بطريقة صحيحية';
        print("Error : Invalid wrong password error or email wrong");
        print("Wrong password : ${e.code}");
        showAlertDialog(context, message, "خطأ");
      }
      else {
        message = 'اذا لم تستيطع الدخول فحاول ادخل البيانات او حاول التاكد من اتصالك بالانترنت !  ';
        print("Error : An error occurred. Please try again later");
        showAlertDialog(context, message, "تنبية");
        return const CircularProgressIndicator();
      }
    }
  }

  static void showAlertDialog(
      BuildContext context, String message, String head) {
    // Create an AlertDialog
    AlertDialog alert = AlertDialog(
      alignment: AlignmentDirectional.center,
      backgroundColor: const Color(0xffecefe4),
      title: Directionality(
          textDirection: TextDirection.rtl, child: Text("${head}")),
      content: Directionality(
          textDirection: TextDirection.rtl, child: Text(message)),
      actions: [
        Container(
          alignment: AlignmentDirectional.bottomStart,
          child: MaterialButton(
            child: Text(""),
            onPressed: () {
              // Close the dialog
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );

    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static Future signUp(BuildContext context, String name, String phone,
      String email, String password, String confirm) async {
    String message = '';
    if (name.isNotEmpty &&
        phone.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirm.isNotEmpty) {
      if (passwordConfirmed(password, confirm)) {
        print("------------in create user---------");
        // انشاء مستخدم جديد في جدول التحقق الايميل وكلمة المرور فقط على فايربيس
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.trim(), password: email.trim());
        message = "تم بنجاح انشاء مستخدم جديد";
        showAlertDialog(context, message, "مبروك");
      } else {
        message = "لم تتطابق كلمتا المرور الرجاء المراجعة ثم الاشتراك";
        showAlertDialog(context, message, "تحذير");
      }
    } else {
      message = "هناك حقل لم يتم تعبئته الرجاء مراجعة جميع الحقول ثم الاشتراك";
      showAlertDialog(context, message, 'انتبه');
    }
  }

  static bool passwordConfirmed(String password, String confirm) {
    if (password.trim() == confirm.trim()) {
      print("------------in true equal password the same ---------");

      return true;
    } else {
      print("------------in false equal password the same ---------");
      return false;
    }

    return true;
  }

  static Future signInSupervisor(
      BuildContext context, String email, String password) async {
    String message = '';
    try {
      UserCredential? userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // handle successful login
      message = ' تم الدخول بنجاح اهلاً وسهلا /${userCredential.user!.email}';

      Navigator.push(context, MaterialPageRoute(builder: (context)=> PreparingStudents16()));
      // Show an error dialog
      showAlertDialog(context, message, "مرحبا");
      // print("user in Sign In :${userCredential.user}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // handle user not found
        message = 'لم يتم العثور على المستخدم الرجاء التاكد ومعاودة الدخول';
        print("Error : Invalid user not found");
        // Show an error dialog
        showAlertDialog(context, message, "خطأ");
        print(" خطأ:${e.code}");
      } else if (e.code == 'wrong-password') {
        // handle wrong password error
        message = ' حاول التاكد من كلمة المرور يابطل';
        print("Error : Invalid wrong password error");
        print("Wrong password : ${e.code}");
        showAlertDialog(context, message, "خطأ");
      }else if(e.code=='user-not-found' || e.code == 'wrong-password'){
        // handle wrong password error
        message = ' حاول التاكد من كلمة المرور او البريد الالكتروني بطريقة صحيحية';
        print("Error : Invalid wrong password error or email wrong");
        print("Wrong password : ${e.code}");
        showAlertDialog(context, message, "خطأ");
      }
      else {
        message = 'اذا لم تستيطع الدخول فحاول ادخل البيانات او حاول التاكد من اتصالك بالانترنت !  ';
        print("Error : An error occurred. Please try again later");
        showAlertDialog(context, message, "تنبية");
        return const CircularProgressIndicator();
      }
    }
  }

  static Future signInStudents(
      BuildContext context, String email, String password) async {
    String message = '';
    try {

      UserCredential? userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      message = ' تم الدخول بنجاح اهلاً وسهلا }';
      AuthSignInSignUp.showAlertDialog(context, message, "مرحبا");
      // handle successful login
      Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentParent20()));
      // Show an error dialog
      // showAlertDialog(context, message, "مرحبا");
      print("user in Sign In :${userCredential.user}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // handle user not found
        message = 'لم يتم العثور على المستخدم الرجاء التاكد ومعاودة الدخول';
        print("Error : Invalid user not found");
        // Show an error dialog
        showAlertDialog(context, message, "خطأ");
        print(" خطأ:${e.code}");
      } else if (e.code == 'wrong-password') {
        // handle wrong password error
        message = ' حاول التاكد من كلمة المرور يابطل';
        print("Error : Invalid wrong password error");
        print("Wrong password : ${e.code}");
        showAlertDialog(context, message, "خطأ");
      }else if(e.code=='user-not-found' || e.code == 'wrong-password'){
        // handle wrong password error
        message = ' حاول التاكد من كلمة المرور او البريد الالكتروني بطريقة صحيحية';
        print("Error : Invalid wrong password error or email wrong");
        print("Wrong password : ${e.code}");
        showAlertDialog(context, message, "خطأ");
      }
      else {
        message = 'اذا لم تستيطع الدخول فحاول ادخل البيانات او حاول التاكد من اتصالك بالانترنت !  ';
        print("Error : An error occurred. Please try again later");
        showAlertDialog(context, message, "تنبية");
        return const CircularProgressIndicator();
      }
    }
  }

  static Future signUpSupervisor(
      BuildContext context,
      String name,
      String phone,
      String address,
      String email,
      String password,
      String confirm,) async {
    String message = '';
    if (name.isNotEmpty &&
        phone.isNotEmpty &&
        address.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirm.isNotEmpty && isEmail(email)) {
      if (passwordConfirmed(password, confirm)) {
        print("------------in create user---------");
        // انشاء مستخدم جديد في جدول التحقق الايميل وكلمة المرور فقط على فايربيس
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim());
        message = "تم بنجاح انشاء مستخدم جديد";
        showAlertDialog(context, message, "مبروك");
      } else {
        message = "لم تتطابق كلمتا المرور الرجاء المراجعة ثم الاشتراك";
        showAlertDialog(context, message, "تحذير");
      }
    } else {
      message = "هناك حقل لم يتم تعبئته او تم تعبئته بطريقة خاطئة يرجى مراجعة جميع الحقول ثم الاشتراك";
      showAlertDialog(context, message, 'انتبه');
    }
  }
  static Future signUpStudents(
      BuildContext context,
      String name,
      String phone,
      String address,
      String email,
      String password,
      String confirm,
      String busId,
      String superId
      ) async {
    String message = '';
    if (name.isNotEmpty &&
        phone.isNotEmpty &&
        address.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirm.isNotEmpty &&
        busId.isNotEmpty&&
        superId.isNotEmpty&&
        isEmail(email)) {
      if (passwordConfirmed(password, confirm)) {
        print("------------in create user---------");
        // انشاء مستخدم جديد في جدول التحقق الايميل وكلمة المرور فقط على فايربيس
        UserCredential? userCredential;
         await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim());
        //      .then((value) => {
        //    // update then user's display name
        //     userCredential?.user?.updateProfile(
        //     displayName: name
        // )


            // });

        FirebaseAuth.instance.currentUser?.updateDisplayName(name);

        print('Name from create user : ${name}');


        // FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        message = "تم بنجاح انشاء مستخدم جديد";
        showAlertDialog(context, message, "مبروك");
      } else {
        message = "لم تتطابق كلمتا المرور الرجاء المراجعة ثم الاشتراك";
        showAlertDialog(context, message, "تحذير");
      }
    } else {
      message = "هناك حقل لم يتم تعبئته او تم تعبئته بطريقة خاطئة يرجى مراجعة جميع الحقول ثم الاشتراك";
      showAlertDialog(context, message, 'انتبه');
    }
  }

static  bool isEmail(String text) {
    // Define a regular expression pattern to match email addresses
    // This is a simple pattern and may not match all valid email addresses
    // You can adjust the pattern to fit your needs
    RegExp emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    // Test the text against the pattern and return the result
    return emailRegex.hasMatch(text);
  }
}
