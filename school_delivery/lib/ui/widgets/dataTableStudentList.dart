import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_delivery/business/authSignInSignUp.dart';
import 'package:school_delivery/data/preparations_model.dart';
import 'package:school_delivery/ui/modify_New_Student17.dart';

import '../../Provider/provider_Data_Manager.dart';

class DataTableStudentList extends StatefulWidget {
  @override
  State<DataTableStudentList> createState() => _DataTableStudentListState();
}

class _DataTableStudentListState extends State<DataTableStudentList> {
  // bool isReturnTrip = false;
  // List<String> selectedSt = [];
  List<String> selectedStudents = [];
  bool isReturnTrip = false;
  List<String> selectedIsHomecoming = [];
  bool isHomecoming = false;
  // bool ok=false;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // String? _selectedValue;

  void _updateFirestore() {
    var today = DateTime.now();
    var goCollection = 'prepare_schedule';
    // 'prepare_schedule_${today.year}_${today.month}_${today.day}';
    for (var student in selectedStudents) {
      firestore.collection(goCollection).doc(student).set({
        'name': student,
        'isReturnTrip': isReturnTrip,
        'isHomecoming': isHomecoming,
        'date': today,
      });
    }

    for (var student in selectedIsHomecoming) {
      firestore.collection(goCollection).doc(student).set({
        'name': student,
        'isReturnTrip': isReturnTrip,
        'isHomecoming': isHomecoming,
        'date': today,
      });
    }
    AuthSignInSignUp.showAlertDialog(
        context, 'لقد تم حفظ التحضير بنجاح', 'حسناً');
  }

  @override
  Widget build(BuildContext context) {
    final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('StudentsG');
    final CollectionReference collectionReferencePrepare =
    FirebaseFirestore.instance.collection('prepare_schedule');
    Stream<QuerySnapshot> getDocuments() {
      return collectionReference.snapshots();
    }


    return Consumer<ProviderDataManager>(
        builder: (context, dataStudent, child) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            // الحاوية البيضاء وما في داخلها من الطلاب وتحديد الذهاب والاياب
            StreamBuilder<QuerySnapshot>(
              stream: getDocuments(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                var students =
                    snapshot.data!.docs.map((doc) => doc['fullName']).toList();
                return DataTable(
                  columnSpacing: 7,
                  dividerThickness: 3,
                  dataRowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) => Colors.white),
                  columns: const [
                    DataColumn(
                        label: Text('الاسم',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ))),
                    DataColumn(
                        label: Text('اياب',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ))),
                    DataColumn(
                        label: Text('ذهاب',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ))),
                    DataColumn(
                        label: Text('تعديل',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ))),
                    DataColumn(
                        label: Text('حذف',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ))),
                  ],
                  rows: snapshot.data!.docs.map((DocumentSnapshot document)  {
                    // print('email user : ${document['email']}');
                    return DataRow(
                        cells: [
                          DataCell(Text((document.data() as Map<String, dynamic>)['fullName'] ?? '',style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataCell(Theme(
                            data: ThemeData(
                              checkboxTheme: const CheckboxThemeData(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                            child: Checkbox(
                              value: selectedStudents.contains(document['fullName']),
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    selectedStudents.add(document['fullName']);
                                  } else {
                                    selectedStudents.remove(document['fullName']);
                                  }
                                });
                              },
                            ),
                          )),
                          DataCell(Theme(
                            data: ThemeData(
                              checkboxTheme: const CheckboxThemeData(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                            child: Checkbox(
                              value: selectedIsHomecoming.contains(document['fullName']),
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    selectedIsHomecoming.add(document['fullName']);
                                  } else {
                                    selectedIsHomecoming.remove(document['fullName']);
                                  }
                                });
                              },
                            ),
                          )),
                          DataCell(IconButton(
                            icon: const Icon(
                              Icons.edit,
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ModifyStudentsG17(document:document)),
                              );
                            },
                          )),
                          DataCell(IconButton(
                            icon: const Icon(
                              Icons.delete,
                            ),
                            onPressed: (){
                              AuthSignInSignUp.showAlertDialog(context, 'لقد تم حذف الطالب بنجاح', 'نجحت');
                              collectionReference.doc(document.id).delete();
                              collectionReferencePrepare.doc(document['fullName']).delete();
                              deleteUserByEmail(document['email'],document['password']);
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
              decoration: const BoxDecoration(
                  color: Color(0xff3b4c9f),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
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
                          child: const Text('حفظ تحضير الصباح',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xff3b4c9f))),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
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
                        // زر الحفظ الخاص بتحضير الظهر " الاياب " الانصراف
                        ElevatedButton(
                          onPressed: () {
                            if (selectedIsHomecoming.isNotEmpty) {
                              _updateFirestore();
                            }
                          },
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          child: const Text('حفظ تحضير الظهر ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xff3b4c9f))),
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
            // SizedBox(height: 10,),
          ],
        ),
      );
    });
  }


  Future<void> deleteUserByEmail(String email,String password) async {
    try {
      List<String> signInMethods = await _auth.fetchSignInMethodsForEmail(email);
      if (signInMethods.isNotEmpty) {
        User? user = (await _auth.signInWithEmailAndPassword(email: email, password:password)).user;
        await user?.delete();
      }
    } catch (e) {
      print("Failed to delete user account: $e");
    }
  }



}
