import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_delivery/business/authSignInSignUp.dart';
import 'package:school_delivery/data/preparations_model.dart';

import '../../Provider/provider_Data_Manager.dart';

class DataTableStudentList extends StatefulWidget {
  @override
  State<DataTableStudentList> createState() => _DataTableStudentListState();
}

class _DataTableStudentListState extends State<DataTableStudentList> {
  List<String> selectedStudents = [];
  bool isReturnTrip = false;
  List<String> selectedIsHomecoming = [];
  bool isHomecoming = false;
  bool ok=false;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _updateFirestore() {
    var today = DateTime.now();
    var goCollection ='prepare_schedule';
        // 'prepare_schedule_${today.year}_${today.month}_${today.day}';
    for (var student in selectedStudents) {
      firestore.collection(goCollection).doc(student).set({
        'name': student,
        'isReturnTrip': false,
        'isHomecoming': false,
        'date': today,
      });
    }

    for (var student in selectedStudents) {
      firestore.collection(goCollection).doc(student).set({
        'name': student,
        'isReturnTrip': isReturnTrip,
        'isHomecoming': isHomecoming,
        'date': today,
      });
    }
    AuthSignInSignUp.showAlertDialog(context, 'لقد تم حفظ التحضير بنجاح', 'حسناً');

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderDataStudent>(
        builder: (context, dataStudent, child) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            // الحاوية البيضاء وما في داخلها من الطلاب وتحديد الذهاب والاياب
            StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('StudentsG').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                var students =
                    snapshot.data!.docs.map((doc) => doc['fullName']).toList();
                return DataTable(
                  columnSpacing: 40,
                  dividerThickness: 5,
                  columns: const [
                    DataColumn(
                        label: Text('الاسم',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ))),
                    DataColumn(
                        label: Text('الحضور',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ))),
                    DataColumn(
                        label: Text('الانصراف',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ))),
                  ],
                  rows: students.map((student) {
                    return DataRow(cells: [
                      DataCell(Text(student,style: TextStyle(fontWeight: FontWeight.bold),)),
                      DataCell(Checkbox(
                        value: selectedStudents.contains(student),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              selectedStudents.add(student);
                            } else {
                              selectedStudents.remove(student);
                            }
                          });
                        },
                      )),
                      DataCell(Checkbox(
                        value: selectedIsHomecoming.contains(student),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              selectedIsHomecoming.add(student);
                            } else {
                              selectedIsHomecoming.remove(student);
                            }
                          });
                        },
                      )),
                    ]);
                  }).toList(),
                );
              },
            ),
            // جول التحضير والحفظ
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xff3b4c9f),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              padding: EdgeInsets.only(top: 10,left: 5,right: 5,bottom: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'الحضور ؟',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        Checkbox(
                          value: isReturnTrip,
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors
                                      .blue; // Color when the checkbox is selected
                                }
                                return Colors.red;
                              }),
                          onChanged: (value) {
                            setState(() {
                              isReturnTrip = value!;
                            });
                          },

                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (selectedStudents.isNotEmpty) {
                              _updateFirestore();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: Text('حفظ تحضير الصباح',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xff3b4c9f)
                              )),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'الانصراف؟',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        Checkbox(
                          value: isHomecoming,
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors
                                  .blue; // Color when the checkbox is selected
                            }
                            return Colors.red;
                          }),
                          onChanged: (value) {
                            setState(() {
                              isHomecoming = value!;
                            });
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (selectedIsHomecoming.isNotEmpty) {
                              _updateFirestore();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white
                          ),
                          child: Text('حفظ تحضير الظهر ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xff3b4c9f)
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            // حاوية الملاحظة
            Container(
              width: MediaQuery.of(context).size.width,
              padding:EdgeInsets.only(top: 5,right: 10,left: 10,bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.indigo
              ),
              child:Text('اولاً حدد على كل الطلاب واحفظ دون تحديد الحضور او الانصراف من اجل حفظ قيم اولية ثم بعدها تأشر على التحضير وتحفظ بشرط يكون الطلاب الي تريد تحضيرهم محددين',style: TextStyle(color: Colors.white),),
            ),
            // ...............................................  section show report
          ],
        ),
      );
    });
  }
}
