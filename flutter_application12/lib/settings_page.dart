import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue),
            title: Text('Account'),
            onTap: () {
              // Navigate to Account Settings
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.orange),
            title: Text('Notifications'),
            onTap: () {
              // Navigate to Notification Settings
            },
          ),
          ListTile(
            leading: Icon(Icons.security, color: Colors.red),
            title: Text('Privacy & Security'),
            onTap: () {
              // Navigate to Privacy & Security Settings
            },
          ),
          ListTile(
            leading: Icon(Icons.language, color: Colors.green),
            title: Text('Language'),
            onTap: () {
              // Navigate to Language Settings
            },
          ),
          ListTile(
            leading: Icon(Icons.palette, color: Colors.purple),
            title: Text('Theme'),
            onTap: () {
              // Navigate to Theme Settings
            },
          ),
          ListTile(
            leading: Icon(Icons.backup, color: Colors.indigo),
            title: Text('Backup & Restore'),
            onTap: () {
              // Navigate to Backup & Restore Settings
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.teal),
            title: Text('About'),
            onTap: () {
              // Navigate to About Settings
            },
          ),
        ],
      ),
    );
  }
}
