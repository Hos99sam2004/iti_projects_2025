import 'package:flutter/material.dart';

class Varificatios extends StatelessWidget {
  const Varificatios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 70),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade800,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(Icons.person, color: Colors.white, size: 35),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Column(
                children: [
                  Text(
                    "ID:: 992004",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Hossam Nasr",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Varified",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      backgroundColor: Colors.green.shade200,
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.edit, color: Colors.white, size: 35),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 50),
          ListTile(
            title: Text(
              "Varifictions",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            trailing: Icon(Icons.arrow_forward, color: Colors.white),
            leading: Icon(Icons.verified, color: Colors.white),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text(
              "Security",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            leading: Icon(Icons.security, color: Colors.white),
            trailing: Icon(Icons.arrow_forward, color: Colors.white),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            leading: Icon(Icons.settings, color: Colors.white),
            trailing: Icon(Icons.arrow_forward, color: Colors.white),
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
