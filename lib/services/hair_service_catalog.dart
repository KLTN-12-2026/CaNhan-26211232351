import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/sample_salons.dart';
import '../models/hair_service.dart';

class HairServiceCatalog {
  HairServiceCatalog({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('services');

  Stream<List<HairService>> watchActive() {
    return _watchAll().map(
      (items) => items
          .where((item) => item.isActive)
          .map((item) => item.service)
          .where(
            (service) =>
                service.name.isNotEmpty &&
                service.price >= 0 &&
                service.durationMinutes > 0,
          )
          .toList(),
    );
  }

  Stream<List<_ServiceCatalogItem>> _watchAll() {
    return _collection.snapshots().map((snapshot) {
      final remote = {
        for (final doc in snapshot.docs)
          doc.id: _ServiceCatalogItem(
            service: HairService.fromMap(doc.id, doc.data()),
            isActive: doc.data()['isActive'] as bool? ?? true,
            order: (doc.data()['order'] as num?)?.toInt() ?? 999,
          ),
      };
      final result = <_ServiceCatalogItem>[];
      for (var index = 0; index < commonServices.length; index++) {
        final fallback = commonServices[index];
        result.add(
          remote.remove(fallback.id) ??
              _ServiceCatalogItem(
                service: fallback,
                isActive: true,
                order: index,
              ),
        );
      }
      result.addAll(remote.values);
      result.sort((a, b) => a.order.compareTo(b.order));
      return result;
    });
  }

}

class _ServiceCatalogItem {
  const _ServiceCatalogItem({
    required this.service,
    required this.isActive,
    required this.order,
  });

  final HairService service;
  final bool isActive;
  final int order;
}
