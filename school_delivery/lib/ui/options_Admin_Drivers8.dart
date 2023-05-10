import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:provider/provider.dart';
import 'package:school_delivery/business/authSignInSignUp.dart';
import 'package:school_delivery/ui/Feature/Login%20Screen/Login_Screen_Supervisor.dart';
import 'package:school_delivery/ui/users_Interface5.dart';
import 'package:school_delivery/ui/widgets/background_widget.dart';
import '../Provider/provider_Data_Manager.dart';
import './bus_Supervisors9.dart';
import './bus_Drivers10.dart';
import 'package:adobe_xd/page_link.dart';
import './settings23.dart';
// صفحة خيارات الادمن ( انشاء حساب مشرف ، انشاء سائق )
class OptionsAdminDrivers8 extends StatefulWidget {
  const OptionsAdminDrivers8({
    Key? key,
  }) : super(key: key);

  @override
  State<OptionsAdminDrivers8> createState() => _OptionsAdminDrivers8State();
}

class _OptionsAdminDrivers8State extends State<OptionsAdminDrivers8> {
  final user=FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final providerManager = Provider.of<ProviderDataManager>(context);

    return Scaffold(
      backgroundColor: const Color(0xffecefe4),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children:  <Widget>[
            // تصميم الخلفية والشعار
            BackgroundWidget(),
            Positioned(
                top: 340,
                right: 80,
                left: 80,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Text("مرحبا   ${user.email}  ",style: TextStyle(fontSize: 13),),
                      Row(
                        children: [
                          const Text("هل تريد الخروج؟"),
                          MaterialButton(onPressed: ()
                          { FirebaseAuth.instance.signOut();
                            },
                          child: Text("تسجيل الخروج",style: TextStyle(color: Colors.grey),))
                        ],
                      ),
                    ],
                  ),
                )),
            // تصميم زر المشرفين
            Positioned(
              top: 400,
              right: 80,
              left: 80,
              child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: MaterialButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>BusSupervisors9()));
                      },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        padding:  EdgeInsets.symmetric(horizontal: 0,vertical: 7),
                        child:  Text('المشرفين',style: TextStyle(fontSize: 30,color: Colors.black),),
                      ),
                    )
                  ]),
            ),
            // تصميم زر السائقين
            Positioned(
              top: 500,
              right: 80,
              left: 80,
              child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: MaterialButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>BusDrivers10()));
                      },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 7),
                        child: const Text('السائقين',style: TextStyle(fontSize: 30,color: Colors.black),),
                      ),
                    )

                  ]),
            ),
            // تصميم زر الاعدادت
            Pinned.fromPins(
              Pin(size: 42.0, start: 38.0),
              Pin(size: 34.0, start: 57.0),
              child: PageLink(
                links: [
                  PageLinkInfo(
                    transition: LinkTransition.Fade,
                    ease: Curves.easeOut,
                    duration: 0.3,
                    pageBuilder: () => Settings23(),
                  ),
                ],
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 8.0, start: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff707070)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 7.0, end: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff707070)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 10.0, middle: 0.5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff707070)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
