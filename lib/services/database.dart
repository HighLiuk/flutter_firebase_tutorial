import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:net_ninja_firebase/models/brew.dart';

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

  Stream<List<Brew>> get brewsStream =>
      brews.snapshots().map(_brewListFromSnapshot);

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data() ?? {};

      return Brew.fromMap(data as Map<String, dynamic>);
    }).toList();
  }
}
