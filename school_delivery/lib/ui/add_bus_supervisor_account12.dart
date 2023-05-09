import 'package:flutter/material.dart';
import '../data/supervisor_model.dart';
import 'Core/Animation/Fade_Animation.dart';
import 'Core/Colors/Hex_Color.dart';
import 'package:school_delivery/business/authSignInSignUp.dart';

enum FormData {
  name,
  phone,
  address,
  userName,
  password,
  confirmPassword
}

class AddBusSupervisor12 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddBusSupervisor12();
  }

// Read from Firebase
}

class _AddBusSupervisor12 extends State<AddBusSupervisor12> {
  final controllerName = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerSupervisorAddress = TextEditingController();
  final controllerSupervisorEmail=TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();


  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;

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
                                  "اضافة مشرف جديد",
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
                                      hintText: '* اسم المشرف كاملاً',
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
                                    controller: controllerPhone,
                                    keyboardType: TextInputType.number,
                                    onTap: () {
                                      setState(() {
                                        selected = FormData.phone;
                                      });
                                    },
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
                                        hintText: '* رقم الهاتف',
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
                                    controller: controllerSupervisorAddress,
                                    keyboardType: TextInputType.text,
                                    onTap: () {
                                      setState(() {
                                        selected = FormData.address;
                                      });
                                    },
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
                                        hintText: '* عنوان المشرف',
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
                                      color: selected == FormData.userName
                                          ? enabled
                                          : backgroundColor),
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    controller: controllerSupervisorEmail,
                                    keyboardType: TextInputType.text,
                                    onTap: () {
                                      setState(() {
                                        selected = FormData.userName;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: selected == FormData.userName
                                              ? enabledtxt
                                              : deaible,
                                          size: 20,
                                        ),
                                        hintText: '* البريد الالكتروني',
                                        hintStyle: TextStyle(
                                            color: selected == FormData.userName
                                                ? enabledtxt
                                                : deaible,
                                            fontSize: 12)),
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        color: selected == FormData.userName
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
                                    controller: controllerPassword,
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
                                        hintText: '* كلمة السر',
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
                                    controller: controllerConfirmPassword,
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
                                        hintText: '* تاكيد كلمة المرور',
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
                                      AuthSignInSignUp.signUpSupervisor(context, controllerName.text, controllerPhone.text, controllerSupervisorAddress.text, controllerSupervisorEmail.text, controllerPassword.text, controllerConfirmPassword.text);
                                      if(controllerPassword.text==controllerConfirmPassword.text)
                                        {
                                          if(controllerName.text.isNotEmpty
                                              &&controllerPhone.text.isNotEmpty &&
                                              controllerSupervisorAddress.text.isNotEmpty &&
                                              controllerSupervisorEmail.text.isNotEmpty &&
                                              controllerPassword.text.isNotEmpty &&
                                              controllerConfirmPassword.text.isNotEmpty
                                              && AuthSignInSignUp.isEmail(controllerSupervisorEmail.text))
                                            {
                                              setState((){
                                                final supervisor = Supervisor(
                                                    name: controllerName.text,
                                                    phone:int.parse(controllerPhone.text) ,
                                                    address: controllerSupervisorAddress.text,
                                                    email: controllerSupervisorEmail.text,
                                                    password: controllerPassword.text,
                                                    confirmPassword: controllerConfirmPassword.text
                                                );
                                                Supervisor.createSupervisor(supervisor);
                                              });
                                                controllerName.text="";
                                                controllerPhone.text="";
                                                controllerSupervisorAddress.text="";
                                                controllerSupervisorEmail.text="";
                                                controllerPassword.text="";
                                                controllerConfirmPassword.text="";

                                            }
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
                                      "اضافة",
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
