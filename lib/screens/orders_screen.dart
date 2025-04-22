import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildOrderCard('Delivered', 'June 12, 2023', '\$599', 'https://picsum.photos/200?random=8'),
          _buildOrderCard('Shipped', 'June 5, 2023', '\$129', 'https://picsum.photos/200?random=9'),
          _buildOrderCard('Cancelled', 'May 28, 2023', '\$249', 'https://picsum.photos/200?random=10'),
        ],
      ),
    );
  }

  Widget _buildOrderCard(String status, String date, String amount, String imageUrl) {
    Color statusColor = status == 'Delivered' 
      ? Colors.green 
      : status == 'Shipped' 
        ? Colors.orange 
        : Colors.red;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(status, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
                      Text(date, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 8),
                      Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('View Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}