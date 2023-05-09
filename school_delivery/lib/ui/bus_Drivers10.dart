import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_delivery/ui/add_Bus_Driver11.dart';

import 'modify_Buse_Driver.dart';


class BusDrivers10 extends StatefulWidget {
  const BusDrivers10({Key? key}) : super(key: key);

  @override
  State<BusDrivers10> createState() => _BusDrivers10();
}

class _BusDrivers10 extends State<BusDrivers10> {
  List BusesListObject = [];
  // late QuerySnapshot snap;
  CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('Buses');
  //  final db=FirebaseFirestore.instance;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getBusesDetailsList();

  }

  @override
  Widget build(BuildContext context) {
    getBusesDetailsList();

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Color(0xff3b4c9f), // make the Scaffold background transparent
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.only(top: 40,right: 5,left: 10,bottom: 20),
                  child: Column(
                    children: [
                      RefreshIndicator(
                        onRefresh: () async {
                          setState(() {});
                        },
                        child: StreamBuilder(
                          stream: collectionReference.snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(' حدث خطأ  ${snapshot.hasError}'),
                              );
                            }
                            print("snapshot in streamBuilder : ${snapshot.hasData}");

                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 600,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(20)),

                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columnSpacing: 15,
                                  columns: const [
                                    DataColumn(label: Text('الاسم',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),),),
                                    DataColumn(label: Text('رقم الهاتف',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),)),
                                    DataColumn(label: Text('تعديل',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),)),
                                    DataColumn(label: Text('حذف',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),)),
                                  ],
                                  rows: BusesListObject.map((row) {
                                    return DataRow(
                                        color: MaterialStateColor.resolveWith((states) => Colors.grey),
                                        cells: [
                                      DataCell(Text(row['fullName'])),
                                      DataCell(Text(row['phone'].toString())),
                                      DataCell(IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => ModifyBusDriver11()),
                                          );
                                        },
                                      )),
                                      DataCell(IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: (){

                                        },
                                      )),
                                    ]);
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBusDriver11()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future getBusesDetailsList() async {
    final snapshot = await collectionReference.get();
    BusesListObject = snapshot.docs;

    print('Snapshot = ${snapshot.size}');

    setState(() {
      BusesListObject = snapshot.docs;
      if (BusesListObject.isNotEmpty) {
        print('USERLIST IS NOT EMPTY');
      } else {
        print('user is empty');
      }
    });
  }
}
