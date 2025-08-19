import 'package:flutter/material.dart';
import 'package:iti_projects/widgets/Abaut%20US.dart';
import 'package:iti_projects/widgets/Screens.dart';
// import 'package:iti_projects/widgets/Abaut%20US.dart';
import 'package:iti_projects/widgets/Sections.dart';
import 'package:iti_projects/widgets/Varificatios.dart';
import 'package:iti_projects/widgets/list_Tile.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Settings', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          iconSize: 35,
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          SettingsSection(
            title: 'General',
            items: [
              SettingsTile(title: 'Currency', value: 'EGP'),
              SettingsTile(title: 'Language', value: 'English'),
            ],
          ),
          SettingsSection(
            title: 'Payment',
            items: [
              SettingsTile(title: 'Payment Currency', value: 'EGP'),
              SettingsTile(title: 'Payment Methods'),
            ],
          ),
          SettingsSection(
            title: 'Others',
            items: [
              InkWell( onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Varificatios()),
                  );
                },child: SettingsTile(title: 'Help & Support')),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()),
                  );
                },
                child: SettingsTile(title: ' About US'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screens()),
                  );
                },
                child: SettingsTile(title: 'Screens '),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        backgroundColor: Colors.grey.shade400,
        iconSize: 30,
        selectedFontSize: 20,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Trades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
