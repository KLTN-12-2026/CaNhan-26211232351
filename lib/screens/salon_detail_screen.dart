import 'package:flutter/material.dart';

import '../models/salon.dart';
import 'service_catalog_screen.dart';

class SalonDetailScreen extends StatelessWidget {
  const SalonDetailScreen({required this.salon, super.key});

  final Salon salon;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5EFE5),
        appBar: AppBar(
          title: Text(salon.name),
          backgroundColor: const Color(0xFF090E14),
          foregroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: Color(0xFFF0C36A),
            unselectedLabelColor: Colors.white70,
            indicatorColor: Color(0xFFF0C36A),
            tabs: [Tab(text: 'Thông tin salon'), Tab(text: 'Dịch vụ')],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const Icon(
                  Icons.storefront_rounded,
                  size: 72,
                  color: Color(0xFF9B6B24),
                ),
                const SizedBox(height: 20),
                Text(salon.name,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.location_on_outlined),
                  title: const Text('Địa chỉ'),
                  subtitle: Text(salon.address),
                ),
                ListTile(
                  leading: const Icon(Icons.schedule),
                  title: const Text('Giờ mở cửa'),
                  subtitle: Text('${salon.openingTime} – ${salon.closingTime}'),
                ),
                ListTile(
                  leading: const Icon(Icons.phone_outlined),
                  title: const Text('Hotline'),
                  subtitle: SelectableText(salon.hotline),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Thông tin salon và hotline là dữ liệu mẫu dùng để minh họa.',
                ),
              ],
            ),
            ServiceCatalogList(services: salon.services),
          ],
        ),
      ),
    );
  }
}
