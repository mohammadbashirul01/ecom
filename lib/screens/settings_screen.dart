import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Account', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildSettingsItem(Icons.person, 'Profile'),
          _buildSettingsItem(Icons.location_on, 'Addresses'),
          _buildSettingsItem(Icons.payment, 'Payment Methods'),
          
          const SizedBox(height: 24),
          const Text('Preferences', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildSettingsItem(Icons.notifications, 'Notifications'),
          _buildSettingsItem(Icons.dark_mode, 'Dark Mode'),
          
          const SizedBox(height: 24),
          const Text('Support', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildSettingsItem(Icons.help, 'Help Center'),
          _buildSettingsItem(Icons.info, 'About Us'),
          
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[100],
                foregroundColor: Colors.red,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}