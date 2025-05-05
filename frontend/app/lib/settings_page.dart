import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final VoidCallback toggleThemeMode;

  SettingsPage({required this.toggleThemeMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color.fromARGB(255, 8, 145, 125),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text('Toggle Theme Mode'),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                toggleThemeMode();
              },
            ),
          ),
          // يمكنك إضافة المزيد من الخيارات هنا
        ],
      ),
    );
  }
}
