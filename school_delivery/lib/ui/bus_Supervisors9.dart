import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../business/authSignInSignUp.dart';
import 'add_bus_supervisor_account12.dart';
import 'modify_bus_supervisor_account12.dart';


class BusSupervisors9 extends StatefulWidget {
  const BusSupervisors9({Key? key}) : super(key: key);

  @override
  State<BusSupervisors9> createState() => _BusSupervisors9();
}

class _BusSupervisors9 extends State<BusSupervisors9> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List SupervisorListObject = [];
  // late QuerySnapshot snap;
  CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('Supervisor');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getSupervisorDetailsList();
  }
  var supervisor;
  @override
  Widget build(BuildContext context) {
    getSupervisorDetailsList();
    final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('Supervisor');

    Stream<QuerySnapshot> getDocuments() {
      return collectionReference.snapshots();
    }
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: const Color(0xff3b4c9f), // make the Scaffold background transparent
            body: Container(
              padding: EdgeInsets.only(top: 40,right: 10,left: 10,bottom: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 800,
                decoration: BoxDecoration(
                    color: Color(0xfffdfdfd),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: RefreshIndicator(
                            onRefresh: () async {
                              setState(() {});
                            },
                            child: StreamBuilder(
                              stream: getDocuments(),
                              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text(' حدث خطأ  ${snapshot.hasError}'),
                                  );
                                }
                                print("snapshot in streamBuilder : ${snapshot.hasData}");
                                print("Supervisor from in  :${supervisor}");

                                return DataTable(
                                  columnSpacing: 15,
                                  dividerThickness: 3,
                                  columns: const [
                                    DataColumn(label: Text('الاسم',style: TextStyle(fontWeight: FontWeight.bold,fontSize:12),),),
                                    DataColumn(label: Text('البريد الالكتروني',style: TextStyle(fontWeight: FontWeight.bold,fontSize:12),)),
                                    DataColumn(label: Text('تعديل',style: TextStyle(fontWeight: FontWeight.bold,fontSize:12),)),
                                    DataColumn(label: Text('حذف',style: TextStyle(fontWeight: FontWeight.bold,fontSize:12),)),
                                  ],
                                  rows: snapshot.data!.docs.map((DocumentSnapshot document)  {
                                    return DataRow(
                                        color: MaterialStateColor.resolveWith((states) => Colors.grey),
                                        cells: [
                                          DataCell(Text((document.data() as Map<String, dynamic>)['name'] ?? '',style: TextStyle(fontWeight: FontWeight.bold,fontSize:12))),
                                          DataCell(Text((document.data() as Map<String, dynamic>)['email'] ?? '',style: TextStyle(fontWeight: FontWeight.bold,fontSize:12))),
                                          DataCell(IconButton(
                                            icon: const Icon(
                                              Icons.edit,
                                            ),
                                            onPressed: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => ModifyBusSupervisor12(document:document)),
                                              );
                                            },
                                          )),
                                          DataCell(IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                            ),
                                            onPressed: (){
                                              AuthSignInSignUp.showAlertDialog(context, 'لقد تم حذف المشرف بنجاح', 'نجحت');
                                              collectionReference.doc(document.id).delete();
                                              deleteUserByEmail(document['email'],document['password']);
                                            },
                                          )),
                                        ]);
                                  }).toList(),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBusSupervisor12()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  Future getSupervisorDetailsList() async {
    final snapshot = await collectionReference.get();
    SupervisorListObject = snapshot.docs;

    print('Snapshot = ${snapshot.size}');

    setState(() {
      SupervisorListObject = snapshot.docs;
      if (SupervisorListObject.isNotEmpty) {
        print('USERLIST IS NOT EMPTY');
      } else {
        print('user is empty');
      }
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
