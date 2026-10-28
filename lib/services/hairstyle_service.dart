import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/hairstyle.dart';

class HairstyleService {
  HairstyleService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;
  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('hairstyles');

  Stream<List<Hairstyle>> watchHairstyles({bool activeOnly = false}) {
    return _collection.snapshots().map((snapshot) {
      final items = snapshot.docs
          .where((document) => document.id != '_catalog')
          .map(Hairstyle.fromDocument)
          .where((item) => !activeOnly || item.isActive)
          .toList();
      items.sort((a, b) {
        final aTime = a.createdAt?.millisecondsSinceEpoch ?? 0;
        final bTime = b.createdAt?.millisecondsSinceEpoch ?? 0;
        return bTime.compareTo(aTime);
      });
      return items;
    });
  }

}
