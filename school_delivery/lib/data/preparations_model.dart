import 'package:cloud_firestore/cloud_firestore.dart';

class Preparations {
  String? id;
  String? todayDate;
  String? studentID;
  String? studentName;
  String? supervisorID;
  bool? isGo;
  bool? isBack;
  bool? isSelect;
  static final _db = FirebaseFirestore.instance;

  Preparations(
      {this.id,
      this.todayDate,
      this.studentID,
      required this.studentName,
      this.supervisorID,
      this.isGo=false,
      this.isBack=false,
      this.isSelect=false
      });

  bool doneChangeGo(){
     isGo=!isGo!;
     return isGo!;
  }

  bool doneChangeBack(){
     isBack=!isBack!;
     return isBack!;
  }

  bool doneChangeSelect(){
     isSelect=!isSelect!;
     return isSelect!;
  }
  // void doneChangeGo(){
  //    isGo=!isGo!;
  // }
  //
  // void doneChangeBack(){
  //    isBack=!isBack!;
  // }
  //
  // void doneChangeSelect(){
  //    isSelect=!isSelect!;
  // }

  Map<String, dynamic> toJson() => {
        'id': id,
        'todayDate': todayDate,
        'studentID': studentID,
        'studentName': studentName,
        'supervisorID': supervisorID,
        'supervisorID': supervisorID,
        'isGo': isGo,
        'isBack': isBack,
        'adminId': isSelect,
      };

  factory Preparations.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    print("data Supervisor drivers is : ${data}");
    print("data Supervisor drivers of name ${data["name"]}");
    return Preparations(
        id: data['id'],
        todayDate: data['todayDate'],
        studentID: data['studentID'],
        studentName: data['studentName'],
        supervisorID: data['supervisorID'],
        isGo: data['isGo'],
        isBack: data['isBack'],
        isSelect: data['isSelect']);
  }

  static Future createSupervisor(Preparations object) async {
    /// Reference to document
    final docBuses = FirebaseFirestore.instance.collection('Preparations').doc();

    final preparing = Preparations(
        id: docBuses.id,
        todayDate:object.todayDate,
        studentID: object.studentID,
        studentName: object.studentName,
        supervisorID: object.supervisorID,
        isGo: object.isGo,
        isBack: object.isBack,
        isSelect: object.isSelect);
    final json = preparing.toJson();

    ///Create document and write data to Firebase
    await docBuses.set(json);
  }

// Fetch All uer Or User Details
  static Future<Preparations> getPreparationsDetails(String todayDate) async {
    final snapshot = await _db
        .collection('Preparations')
        .where('supervisorID', isEqualTo: todayDate)
        .get();
    final userData =
        snapshot.docs.map((e) => Preparations.fromSnapshot(e)).single;
    return userData;
  }

  static Future<List<Preparations>> getAllPreparations() async {
    final snapshot = await _db.collection('Preparations').get();
    final userData =
        snapshot.docs.map((e) => Preparations.fromSnapshot(e)).toList();
    return userData;
  }
}
