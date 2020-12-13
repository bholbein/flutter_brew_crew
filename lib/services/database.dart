import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // create collection reference to Firebase Firestore
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  // method to udpate UserData given several input. Firestore will
  // create new documents if nothing has been created for this uid
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}
