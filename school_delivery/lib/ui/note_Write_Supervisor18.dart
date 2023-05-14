import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:school_delivery/ui/users_Interface5.dart';
import 'package:school_delivery/ui/widgets/floatActionButtonSupervisor.dart';
import '../Provider/provider_Data_Manager.dart';
import 'Core/Animation/Fade_Animation.dart';

class NoteWriteSuprvisor18 extends StatefulWidget {
  @override
  State<NoteWriteSuprvisor18> createState() => _NoteWriteSuprvisor18State();
}

class _NoteWriteSuprvisor18State extends State<NoteWriteSuprvisor18> {
  DateTime today = DateTime.now();

  TextEditingController noteController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    Provider.of<ProviderDataManager>(context).getStudentsDetailsList();
    final noteManager = Provider.of<ProviderDataManager>(context);
    noteManager.NoteManager();

    final user = FirebaseAuth.instance.currentUser!;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<ProviderDataManager>(
        builder: (context,dataStudent,child){
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton:FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  noteManager.addNote('${noteController.text}');
                  noteController.text="";
                  childMethod(context);

                },
                backgroundColor: Colors.indigo[300],
                child: const Icon(Icons.send_outlined),
              ),
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
                                              // FirebaseAuth.instance.signOut();
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
                            // نص عنوان الصفحة " التنبيهات "
                            const Text(
                              'كتابة ملاحظات وتنبيهات لوالد الطالب',
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
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
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
                                width: 3,
                              ),
                              // Text(
                              //   'المشرف: ${user.email}',
                              //   style: const TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 14,
                              //   ),
                              // ),

                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // هنا جزء الحاوية الخاصة بالتنبيهات الي تاتي من اولياً الامور
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height,
                          height: 180,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child:  TextField(
                            controller: noteController,
                            textAlign: TextAlign.right,
                            // minLines: 1,
                            maxLength: 200,
                            maxLines: 8,
                            mouseCursor: MaterialStateMouseCursor.textable,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            textDirection: TextDirection.rtl,

                          ),
                        ),
                      ),
                      // تصميم مكان الشعار
                      FadeAnimation(
                        delay: 0.8,
                        child: Image.asset(
                          'assets/images/schooldelivery.png',
                          width: 350,
                          height: 350,
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
        content: const Text('تم بنجاح ارسال رسالة لأولياء الامور ..'),
        actions: [
          TextButton(
            child: const Text(''),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}








