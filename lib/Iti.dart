import 'package:flutter/material.dart';
// import 'package:iti/custom_cont.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Text(
                        "Total Balance",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(height: 6),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Text(
                        "0.00",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "EGP",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      RotatedBox(
                        child: Icon(Icons.arrow_right_outlined),
                        quarterTurns: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 34),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      CustomCont(
                        quarterTurns: 1,
                        color: Color(0xffD9FBE7),
                        status: "Withdrawel",

                        amount: "2000.00.00",
                      ),
                      SizedBox(width: 13),
                      CustomCont(
                        quarterTurns: 3,
                        color: Color(0xffFBE7D9),
                        status: "Dissposit",

                        amount: "1500.00.00",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Text(
                        "History Transaction",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}
// import 'package:flutter/material.dart';

class CustomCont extends StatelessWidget {
  const CustomCont({
    super.key,
    required this.status,

    required this.amount,
    required this.color,
    required this.quarterTurns,
  });
  final String status;

  final String amount;
  final Color color;
  final int quarterTurns;
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: color,
              child: RotatedBox(quarterTurns: quarterTurns, child: Icon(Icons.arrow_back),),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text("EGP", style: TextStyle(fontSize: 14)),
                SizedBox(width: 4),
                Text(
                  amount,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(status, style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}