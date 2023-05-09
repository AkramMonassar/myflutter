import 'package:cloud_firestore/cloud_firestore.dart';

class Supervisor {
  String? id;
  String? name;
  int? phone;
  String? address;
  String? email;
  String? password;
  String? confirmPassword;
  int? adminId;
  static final _db = FirebaseFirestore.instance;

  Supervisor(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.email,
      this.password,
      this.confirmPassword,
      this.adminId});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'address': address,
        'email':email,
        'password': password,
        'confirmPassword': confirmPassword,
        'adminId': adminId,
      };

  factory Supervisor.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    print("data Supervisor drivers is : ${data}");
    print("data Supervisor drivers of name ${data["name"]}");
    return Supervisor(
        id: document.id,
        name: data["name"],
        phone: data["phone"],
        address: data["address"],
        email: data["email"],
        password: data["password"],
        confirmPassword: data["confirmPassword"],
        adminId: data["adminId"]);
  }

  static Future createSupervisor(Supervisor object) async {
    /// Reference to document
    final docBuses = FirebaseFirestore.instance.collection('Supervisor').doc();

    final buses = Supervisor(
      id: docBuses.id,
      name: object.name,
      phone: object.phone,
      address: object.address,
      email: object.email,
      password: object.password,
      confirmPassword: object.confirmPassword,
      adminId: object.adminId,
    );
    final json = buses.toJson();

    ///Create document and write data to Firebase
    await docBuses.set(json);
  }

// Fetch All uer Or User Details
  static Future<Supervisor> getSupervisorDetails(String name) async {
    final snapshot =
        await _db.collection('Supervisor').where('email', isEqualTo: name).get();
    final userData =
        snapshot.docs.map((e) => Supervisor.fromSnapshot(e)).single;
    return userData;
  }

  static Future<List<Supervisor>> getAllSupervisor() async {
    final snapshot = await _db.collection('Supervisor').get();
    final userData =
        snapshot.docs.map((e) => Supervisor.fromSnapshot(e)).toList();
    return userData;
  }
}
