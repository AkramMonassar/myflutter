import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:school_delivery/ui/widgets/dataTableStudentList.dart';
import 'package:school_delivery/ui/widgets/floatActionButtonSupervisor.dart';
import 'package:school_delivery/ui/widgets/menuSettingLogoutAddDelete.dart';

import '../Provider/provider_Data_Manager.dart';
import 'modify_New_Student17.dart';

class PreparingStudents16 extends StatelessWidget {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {

    Provider.of<ProviderDataStudent>(context).getStudentsDetailsList();
    // final user = FirebaseAuth.instance.currentUser!;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<ProviderDataStudent>(
        builder: (context,dataStudent,child){
            return SafeArea(
              child: Scaffold(
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                floatingActionButton: FloatActionButton(),
                backgroundColor: const Color(0xff3b4c9f),
                body: Container(
                  padding:
                  const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 80),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // تصميم الرأس ( الثلاث النقاط فيها تسجيل خروج و اضافة اسم جديد ، حذف طالب ) ثم العنوان وزر التحديث
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const MenuSettingLogoutAddDelete(),
                              // زر البلاي لست الي يظهر معنى التحضير للطلاب
                              const Icon(
                                Icons.playlist_add_check,
                                size: 30,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              // نص عنوان الصفحة " التحضير اليومي للطلاب "
                              const Text(
                                'التحضير اليومي للطلاب',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('العدد : ${dataStudent.studentsGListObject.length}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 12),)
                            ],
                          ),
                        ),
                        // تصميم تاريخ اليوم واسم ا لمشرف كصفوف
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'تأريخ اليوم :${today.day}-${today.month}-${today.year} ',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'المشرف: ${dataStudent.user.email}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
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
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: SingleChildScrollView(
                              scrollDirection:Axis.vertical ,
                              child: StreamBuilder(
                                // stream: collectionReference.snapshots(),
                                stream: dataStudent.collectionReference.snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              ' حدث خطأ قد يكون بسبب ما او لعدم وجود بيانات ، اذا كان  ${snapshot.hasError}'),
                                          const Text(
                                            ' بسبب عدم وجود بيانات فعليك اضافة طلاب وستحتل المشكلة او اضغط على تحديث',
                                            style: TextStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                    );
                                  }else
                                    // هنا اهم جزء وهو الداتا تايبل الخاصة بالطلاب وتحضيرهم
                                    return DataTableStudentList();
                                },
                              ),
                            ),
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

  // Future getStudentsDetailsList() async {
  //   final snapshot = await collectionReference.get();
  //   studentsGListObject = snapshot.docs;
  // }
}








