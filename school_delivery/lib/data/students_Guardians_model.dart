import 'package:cloud_firestore/cloud_firestore.dart';

class StudentsGuardians {
  String?  id;
  String? fullName;
  int? phone;
  String? address;
  String? email;
  String? password;
  String? confirmPassword;
  int? busId;
  int? supervisorId;
  bool? isGo;
  bool? isBack;
  bool? selected;
  static final _db=FirebaseFirestore.instance;


  StudentsGuardians({this.id, this.fullName, this.phone, this.address,this.email,this.password,this.confirmPassword,this.busId,this.supervisorId,this.isGo,this.isBack,this.selected});

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullName': fullName,
    'phone': phone,
    'address': address,
    'email':email,
    'password': password,
    'confirmPassword': confirmPassword,
    'busId':busId,
    'supervisorId': supervisorId,
    'isGo':isGo,
    'isBack':isBack,
    'selected':selected
  };

  factory StudentsGuardians.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    print("data StudentsG drivers is : ${data}");
    print("data StudentsG drivers of name ${data["fullName"]}");
    return StudentsGuardians(
        id: document.id,
        fullName: data["fullName"],
        phone: data["phone"],
        address: data["address"],
        password: data["password"],
        confirmPassword: data["confirmPassword"],
        busId: data["busId"],
        supervisorId:data['supervisorId'],
        isGo: data['isGo'],
        isBack: data['isBack'],
        selected: data['selected']
    );
  }

  static Future createStudentsGuardians(StudentsGuardians object) async {
    /// Reference to document
    final docsStudentGuardians = FirebaseFirestore.instance.collection('StudentsG').doc();

    final studentG = StudentsGuardians(
      id: docsStudentGuardians.id,
      fullName: object.fullName,
      phone: object.phone,
      address: object.address,
      email: object.email,
      password: object.password,
      confirmPassword: object.confirmPassword,
      busId: object.busId,
      supervisorId: object.supervisorId,
      isGo: object.isGo,
      isBack: object.isBack,
      selected: object.selected
    );
    final json = studentG.toJson();

    ///Create document and write data to Firebase
    await docsStudentGuardians.set(json);

  }

// Fetch All uer Or User Details
  static Future<StudentsGuardians> getStudentsGuardians(String name) async {
    final snapshot =
    await _db.collection('StudentsG').where('email', isEqualTo: name).get();
    final userData = snapshot.docs.map((e) => StudentsGuardians.fromSnapshot(e)).single;
    return userData;
  }

  static Future<List<StudentsGuardians>> getAllSupervisor() async {
    final snapshot = await _db.collection('StudentsG').get();
    final userData = snapshot.docs.map((e) => StudentsGuardians.fromSnapshot(e)).toList();
    return userData;
  }
}