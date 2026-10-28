import 'package:flutter/material.dart';

import '../data/sample_salons.dart';
import '../models/hair_service.dart';
import '../services/hair_service_catalog.dart';

String formatServicePrice(int price) {
  final raw = price.toString();
  final output = StringBuffer();
  for (var i = 0; i < raw.length; i++) {
    if (i > 0 && (raw.length - i) % 3 == 0) output.write('.');
    output.write(raw[i]);
  }
  return '$outputđ';
}

void showHairServiceDetails(BuildContext context, HairService service) {
  showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (context) => SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(service.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text(service.description),
            const SizedBox(height: 16),
            Text('Giá: ${formatServicePrice(service.price)}'),
            Text('Thời gian dự kiến: ${service.durationMinutes} phút'),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Đóng'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class ServiceCatalogScreen extends StatelessWidget {
  const ServiceCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EFE5),
      appBar: AppBar(
        title: const Text('Danh mục dịch vụ'),
        backgroundColor: const Color(0xFF090E14),
        foregroundColor: Colors.white,
      ),
      body: const ServiceCatalogList(),
    );
  }
}

class ServiceCatalogList extends StatelessWidget {
  const ServiceCatalogList({this.services, super.key});

  final List<HairService>? services;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<HairService>>(
      stream: HairServiceCatalog().watchActive(),
      builder: (context, snapshot) {
        final allowedIds = services?.map((service) => service.id).toSet();
        final items = (snapshot.data ?? services ?? commonServices)
            .where((service) => allowedIds == null || allowedIds.contains(service.id))
            .toList();
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (snapshot.connectionState == ConnectionState.waiting)
              const LinearProgressIndicator(),
            if (snapshot.hasError)
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  'Chưa tải được dữ liệu trực tuyến. Đang hiển thị danh mục mẫu.',
                ),
              ),
            if (items.isEmpty) const Text('Hiện chưa có dịch vụ đang hoạt động.'),
            for (final service in items)
              Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: const Icon(Icons.content_cut_rounded),
                  title: Text(service.name),
                  subtitle: Text(
                    '${formatServicePrice(service.price)} • '
                    '${service.durationMinutes} phút',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => showHairServiceDetails(context, service),
                ),
              ),
          ],
        );
      },
    );
  }
}
