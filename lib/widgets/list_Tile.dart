import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String? value;

  SettingsTile({required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value != null)
            Text(value!, style: TextStyle(color: Colors.white)),
          Icon(Icons.chevron_right),
        ],
      ),
      onTap: null,
    );
  }
}
