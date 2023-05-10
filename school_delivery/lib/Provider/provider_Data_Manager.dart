import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_delivery/data/notes_StudentG_model.dart';
import 'package:school_delivery/data/students_Guardians_model.dart';

import '../data/alert_model.dart';
import '../data/notes_StudentG_model.dart';
import '../data/notes_Supervisor_model.dart';
import '../data/preparations_model.dart';

class ProviderDataManager extends ChangeNotifier{
  // student infor
  List studentsGListObject = [];
  CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('StudentsG');


  final user = FirebaseAuth.instance.currentUser!;


  bool? isChecked=false;

  Future getStudentsDetailsList() async {
    collectionReference =
        FirebaseFirestore.instance.collection('StudentsG');

    final snapshot = await collectionReference.get();
    studentsGListObject = snapshot.docs;

    notifyListeners();
  }

  // from use select
  StudentsGuardians? _selectedItem;

  List get data => studentsGListObject;

  set data(List newData) {
    studentsGListObject = newData;
    notifyListeners();
  }

  void updateData(bool isCheck) {
    isChecked=isCheck;
    notifyListeners();

  }

  void selectItem(StudentsGuardians item) {
    _selectedItem = item;
    studentsGListObject.forEach((model) => model.selected = (model == item));
    notifyListeners();
  }

  bool isItemSelected(StudentsGuardians item) {
    return item == _selectedItem;
  }


  // // praparion
  //
  // List preparingListObject = [];
  // CollectionReference collectionReferencePreparing =
  // FirebaseFirestore.instance.collection('Preparations');
  //
  //
  //
  // List<Preparations>  preparationList=[];
  //
  // Future preparingDetailsList() async {
  //   collectionReference =
  //       FirebaseFirestore.instance.collection('Preparations');
  //
  //   final snapshot = await collectionReference.get();
  //   preparingListObject = snapshot.docs;
  //
  //   notifyListeners();
  // }


  // provider Alert Manager

  CollectionReference _alertsCollection =
  FirebaseFirestore.instance.collection('alerts');

  List<Alert> _alerts = [];

  List<Alert> get alerts => _alerts;

  StreamSubscription<QuerySnapshot>? _subscription;

  AlertsManager() {
    _subscription = _alertsCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((querySnapshot) {
      _alerts = querySnapshot.docs.map((doc) => Alert.fromSnapshot(doc)).toList();
      notifyListeners();
    });
  }

  Future<void> addAlert(String message) async {
    await _alertsCollection.add({
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  void clearAlerts() {
    _alertsCollection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }



  // provider note Supervisor Manager ------------------------------------------------

  CollectionReference _notesCollection =
  FirebaseFirestore.instance.collection('notesSupervisor');

  List<NotesSupervisor> _notes = [];

  List<NotesSupervisor> get notes => _notes;

  StreamSubscription<QuerySnapshot>? _subscription2;

  NoteManager() {
    _subscription2 = _notesCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((querySnapshot) {
      _notes = querySnapshot.docs.map((doc) => NotesSupervisor.fromSnapshot(doc)).toList();
      notifyListeners();
    });
  }

  Future<void> addNote(String message) async {
    await _notesCollection.add({
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  void clearNote() {
    _notesCollection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }

  // provider note Student Guardian Manager ------------------------------------------------

  CollectionReference _notesStudentGCollection =
  FirebaseFirestore.instance.collection('notesStudentG');

  List<NotesStudentG> _notesStudentG = [];

  List<NotesStudentG> get notesStudentG => _notesStudentG;

  StreamSubscription<QuerySnapshot>? _subscription3;

  notesStudentGManager() {
    _subscription2 = _notesStudentGCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((querySnapshot) {
      _notesStudentG = querySnapshot.docs.map((doc) => NotesStudentG.fromSnapshot(doc)).toList();
      notifyListeners();
    });
  }

  Future<void> addNoteStudentG(String message) async {
    await _notesStudentGCollection.add({
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  void clearNoteStudentG() {
    _notesStudentGCollection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }


  @override
  void dispose() {
    _subscription2?.cancel();
    _subscription?.cancel();
    _subscription3?.cancel();
    super.dispose();
  }

  // المتغير حق الواجهات في البداية
  // int? selectManager;
  int _myVariable = 0;

  int get myVariable => _myVariable;

  void setMyVariable(int newValue) {
    _myVariable = newValue;
    notifyListeners();
  }



  // List<String> selectedSt = [];
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  // void _updateFirestore() {
  //   var today = DateTime.now();
  //   var goCollection ='prepare_schedule';
  //   // 'prepare_schedule_${today.year}_${today.month}_${today.day}';
  //   for (var student in selectedSt) {
  //     firestore.collection(goCollection).doc(student).set({
  //       'name': student,
  //       'isReturnTrip': false,
  //       'isHomecoming': false,
  //       'date': today,
  //     });
  //   }
  //
  // }
}