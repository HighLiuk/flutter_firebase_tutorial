import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  final CollectionReference brews =
      FirebaseFirestore.instance.collection('brews');

  DatabaseService(this.uid);

  Future updateUserData(
    String sugars,
    String name,
    int strength,
  ) async {
    await brews.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}
