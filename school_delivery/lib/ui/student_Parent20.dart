import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:school_delivery/ui/users_Interface5.dart';
import 'package:school_delivery/ui/widgets/floatActionButtonSupervisor.dart';
import 'package:school_delivery/ui/widgets/floatActionButtonStudentG.dart';
import '../Provider/provider_Data_Manager.dart';
import 'note_Write_StudentGuardian21.dart';
import 'notifications_Parent22.dart';

class StudentParent20 extends StatelessWidget {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {

    Provider.of<ProviderDataManager>(context).getStudentsDetailsList();
    final alertsManager = Provider.of<ProviderDataManager>(context);

    final user = FirebaseAuth.instance.currentUser!;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<ProviderDataManager>(
        builder: (context,dataStudent,child){
          return SafeArea(
            child: Scaffold(
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton:  FloatActionButtonGuardiansStudent(),
              backgroundColor: const Color(0xff3b4c9f),
              body: Container(
                padding:
                const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 80),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // تصميم الرأس ( الثلاث النقاط فيها تسجيل خروج و اضافة اسم جديد ، حذف طالب ) ثم العنوان وزر التحديث
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // اعدادات الصفحة لتسجيل الخروج
                            GestureDetector(
                                onTap: (){
                                  showMenu(
                                    context: context,
                                    position: const RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
                                    items: [
                                      PopupMenuItem(
                                        value: 'Option 1',
                                        child: GestureDetector(
                                            onTap: (){
                                              FirebaseAuth.instance.signOut();
                                              // Navigator.pop(context);
                                              // Navigator.of(context).popUntil((route) => route.isFirst);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => UserInterface5()));
                                            },
                                            child: Row(
                                              children: const [
                                                Icon(Icons.logout_outlined),
                                                SizedBox(width: 8,),
                                                Text('تسجيل خروج'),
                                              ],
                                            )),
                                      ),
                                    ],
                                    elevation: 8.0,
                                  );
                                },
                                child: const Icon(Icons.more_vert,color: Colors.white,)),
                            const SizedBox(
                              width: 15,
                            ),
                            // نص عنوان الصفحة " التحضير اليومي للطلاب "
                            const Text(
                              'واجهة ولي الامر',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // تصميم تاريخ اليوم واسم ا لمشرف كصفوف
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'تأريخ اليوم :${today.day}-${today.month}-${today.year} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            // زر البلاي لست الي يظهر معنى التحضير للطلاب
                            const Icon(
                              Icons.person_pin_circle_outlined,
                              size: 18,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'اسم الطالب: ${user.displayName}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),

                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // هنا جزء الحاوية لتحضير الطلاب  ( الداتا تايبل وتحضير الطلاب ذهاب واياب)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height,
                        height: 480,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff3b4c9f),
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30)
                                ),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsParent22()));
                                },
                                child: const Text("الاطلاع على الإشعارات",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red.shade900,
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30)
                                ),
                                onPressed: (){
                                  alertsManager.addAlert(' طلب / عدم الذهاب الى المدرسة للطالب ${user.displayName} ');
                                  childMethod(context);                                },
                                child: const Text("طلب الغاء الذهاب",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red.shade900,
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30)
                                ),
                                onPressed: (){
                                  alertsManager.addAlert(' طلب / عدم الاياب من المدرسة للطالب ${user.displayName} ');
                                  childMethod(context);                                  },
                                child: const Text("طلب الغاء الاياب",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff3b4c9f),
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30)
                                ),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteWriteStudentGuardian21()));
                                },
                                child: const Text("ملاحظة سبب الغياب",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              )
                            ],
                          )

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  void childMethod(BuildContext? context) {
    showDialog(
      context: context!,
      builder: (context) => AlertDialog(
        title: const Text('تنبية'),
        content: const Text('تم بنجاح ارسال تنبية لمشرف الباص ..'),
        actions: [
          TextButton(
            child: const Text('اغلاق'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

}








