import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_projects/widgets/counter.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  List<String> my_Artists = [
    'assets/1.png',
    'assets/me.png',
    'assets/انا.jpg',
    'assets/انا.jpg',
    'assets/me.png',
    'assets/1.png',
    'assets/1.png',
    'assets/me.png',
    'assets/انا.jpg',
  ];
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(43, 12, 12, 1),
              Color.fromRGBO(43, 12, 12, 1),
              Color.fromRGBO(0, 0, 0, 1),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_alert_outlined),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Choose 3 More Artist You Like !',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(height: 10),
              Text(
                'This is a placeholder for the Screens widget \nThis is a music center.',
                style: TextStyle(
                  color: Color.fromARGB(255, 145, 140, 140),
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 13),
                    Icon(Icons.search, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'search for artist',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 135,
                  ),
                  itemCount: my_Artists.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: Grid(
                        my_Artists: my_Artists[index],
                        name: 'Hossam',
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Counter()));
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class Grid extends StatefulWidget {
  const Grid({super.key, required this.my_Artists, required this.name});

  final String my_Artists;
  final String name;

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipOval(
                    child: Image.asset(widget.my_Artists, fit: BoxFit.fill),
                  ),
                ),

                if (isSelected)
                  Positioned(
                    top: 0,
                    right: 5,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red[400],
                      child: Icon(Icons.check, color: Colors.white, size: 20),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.name,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
