import 'package:cloud_firestore/cloud_firestore.dart';

class Buses {
  String? id;
  String? fullName;
  int? phone;
  String? busOwnerAddress;
  String? plateNumber;
  String? idCardNumber;
  int? adminId;
  static final _db=FirebaseFirestore.instance;


  Buses(
      {this.id,
      this.fullName,
      this.phone,
      this.busOwnerAddress,
      this.plateNumber,
      this.idCardNumber,
      this.adminId});
  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'phone': phone,
        'busOwnerAddress': busOwnerAddress,
        'plateNumber': plateNumber,
        'idCardNumber': idCardNumber,
        'adminId': adminId,
      };

  factory Buses.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    print("data Bus drivers is : ${data}");
    print("data Bus drivers of name ${data["name"]}");
    return Buses(
        id: document.id,
        fullName: data["name"],
        phone: data["age"],
        busOwnerAddress: data["busOwnerAddress"],
        plateNumber: data["plateNumber"],
        idCardNumber: data["idCardNumber"],
        adminId: data["adminId"]);
  }

  static Future createBuses(Buses object) async {
    /// Reference to document
    final docBuses = FirebaseFirestore.instance.collection('Buses').doc();

    final buses = Buses(
      id: docBuses.id,
      fullName: object.fullName,
      phone: object.phone,
      busOwnerAddress: object.busOwnerAddress,
      plateNumber: object.plateNumber,
      idCardNumber: object.idCardNumber,
      adminId: object.adminId,
    );
    final json = buses.toJson();

    ///Create document and write data to Firebase
    await docBuses.set(json);
  }

// Fetch All uer Or User Details
  static Future<Buses> getBusesDetails(String name) async {
    final snapshot =
        await _db.collection('users').where('name', isEqualTo: name).get();
    final userData = snapshot.docs.map((e) => Buses.fromSnapshot(e)).single;
    return userData;
  }

  static Future<List<Buses>> getAllBuses() async {
    final snapshot = await _db.collection('users').get();
    final userData = snapshot.docs.map((e) => Buses.fromSnapshot(e)).toList();
    return userData;
  }
}
