import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ExpressTrackingPage extends StatelessWidget {
  const ExpressTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildTrackingSearch(),
            const SizedBox(height: 32),
            _buildActivePackageCard(),
            const SizedBox(height: 32),
            _buildStatusTimeline(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text('Track Package', style: TextStyle(color: Color(0xFF1E3A8A), fontWeight: FontWeight.bold)),
      leading: IconButton(icon: const Icon(LucideIcons.menu, color: Color(0xFF1E3A8A)), onPressed: () {}),
      actions: [
        IconButton(icon: const Icon(LucideIcons.scanLine, color: Color(0xFF1E3A8A)), onPressed: () {}),
      ],
    );
  }

  Widget _buildTrackingSearch() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))]),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(hintText: 'Enter Tracking Number', hintStyle: TextStyle(color: Colors.blue.withOpacity(0.3)), border: InputBorder.none),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFF2563EB), borderRadius: BorderRadius.circular(16)),
            child: const Icon(LucideIcons.search, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildActivePackageCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF2563EB), Color(0xFF1E3A8A)]),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('In Transit', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  SizedBox(height: 4),
                  Text('MacBook Pro M3', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const Icon(LucideIcons.package, color: Colors.white, size: 32),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLocationPoint('NY, USA', 'Sender'),
              const Icon(LucideIcons.arrowRight, color: Colors.white24),
              _buildLocationPoint('London, UK', 'Receiver'),
            ],
          ),
          const SizedBox(height: 32),
          const Divider(color: Colors.white12),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Estimate Delivery', style: TextStyle(color: Colors.white70, fontSize: 12)),
              Text('May 24, 2026', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationPoint(String city, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(city, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildStatusTimeline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Tracking History', style: TextStyle(color: Color(0xFF1E3A8A), fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        _buildTimelineStep('Arrived at Customs', 'Heathrow Airport, UK', 'Today, 10:42 AM', true),
        _buildTimelineStep('In Transit to London', 'Atlantic Ocean', 'Yesterday, 04:15 PM', false),
        _buildTimelineStep('Shipped from Facility', 'JFK Airport, NY', 'May 20, 09:00 AM', false),
      ],
    );
  }

  Widget _buildTimelineStep(String title, String location, String time, bool isActive) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(width: 20, height: 20, decoration: BoxDecoration(color: isActive ? const Color(0xFF2563EB) : Colors.white, border: Border.all(color: const Color(0xFF2563EB), width: 3), shape: BoxShape.circle)),
            Container(width: 2, height: 60, color: const Color(0xFF2563EB).withOpacity(0.2)),
          ],
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: isActive ? const Color(0xFF1E3A8A) : Colors.black45, fontWeight: FontWeight.bold)),
              Text(location, style: const TextStyle(color: Colors.black26, fontSize: 12)),
              const SizedBox(height: 4),
              Text(time, style: const TextStyle(color: Colors.black26, fontSize: 10)),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(LucideIcons.layoutGrid, color: Color(0xFF2563EB)),
          Icon(LucideIcons.history, color: Colors.black26),
          Icon(LucideIcons.map, color: Colors.black26),
          Icon(LucideIcons.settings, color: Colors.black26),
        ],
      ),
    );
  }
}
