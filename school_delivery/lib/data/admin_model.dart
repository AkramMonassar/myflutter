
import 'package:cloud_firestore/cloud_firestore.dart';

class Administrator {
  String?  id;
  String? fullName;
  int? phone;
  String? email;
  String? password;
  String? confirmPassword;
  static final _db=FirebaseFirestore.instance;

  Administrator({this.id, this.fullName, this.phone, this.email,this.password,this.confirmPassword});

  Map<String,dynamic> toJson()=>{
    'id':id,
    'fullName':fullName,
    'phone':phone,
    'email':email,
    'password':password,
    'confirmPassword':confirmPassword,
  };
  factory Administrator.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document ) {
    final data = document.data()!;
    print("data is : ${data}");
    print("data of name ${data["name"]}");
    return Administrator(
        id: document.id,
        fullName: data["fullName"],
        phone: data["phone"],
        email: data["email"],
        password: data["password"],
        confirmPassword: data["confirmPassword"]
    );
  }

  static Future createAdministrator(Administrator object) async{
    /// Reference to document
    final docAdministrator=FirebaseFirestore.instance.collection('administrators').doc();

    final admin=Administrator(
      id:docAdministrator.id,
      fullName:object.fullName,
      phone:object.phone,
      email:object.email,
      password: object.password,
      confirmPassword:object.confirmPassword,
    );
    final json=admin.toJson();
    ///Create document and write data to Firebase
    await docAdministrator.set(json);
  }
// Fetch All uer Or User Details
  static  Future<Administrator> getUserDetails(String name) async{
    final snapshot=await _db.collection('Administrator').where('email',isEqualTo: name).get();
    final userData=snapshot.docs.map((e) => Administrator.fromSnapshot(e)).single;
    return userData;
  }

  static Future<List<Administrator>> getAllUser() async{
    final snapshot=await _db.collection('Administrator').get();
    final userData=snapshot.docs.map((e) => Administrator.fromSnapshot(e)).toList();
    return userData;
  }
}


