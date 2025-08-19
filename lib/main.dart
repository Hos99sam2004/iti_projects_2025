import 'package:flutter/material.dart';
// import 'package:iti_projects/Iti.dart';
import 'package:iti_projects/widgets/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Portfolio',
      debugShowCheckedModeBanner: false,
      home:  SettingsPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset('assets/me.png', fit: BoxFit.cover),
                ),
                Container(color: Colors.black.withOpacity(0.4)),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Hello I am",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Hossam Nasr",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Mobile Flutter Developer",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 13,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Hire Me"),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.facebook, color: Colors.white),
                          SizedBox(width: 14),
                          Icon(Icons.linked_camera, color: Colors.white),
                          SizedBox(width: 14),
                          Icon(Icons.grade_rounded, color: Colors.white),
                          SizedBox(width: 14),
                          Icon(Icons.webhook, color: Colors.white),
                          SizedBox(width: 14),
                          Icon(
                            Icons.account_balance_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
