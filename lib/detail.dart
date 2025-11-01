import 'package:flutter/material.dart';
import 'home.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String position;
  final int number;
  final String nation;
  final int age;
  final double height;
  final String gender;

  const DetailPage({
    super.key,
    required this.name,
    required this.position,
    required this.number,
    required this.nation,
    required this.age,
    required this.height,
    required this.gender,
  });

  

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late double heightM;

  @override
  void initState() {
    super.initState();
    heightM = widget.height / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text("Name: ${widget.name}"),
            SizedBox(height: 10),
            Text("Position: ${widget.position}"),
            SizedBox(height: 10),
            Text("Number: ${widget.number}"),
            SizedBox(height: 10),
            Text("Nation: ${widget.nation}"),
            SizedBox(height: 10),
            Text("Age: ${widget.age}"),
            SizedBox(height: 10),
            Text("Height: ${heightM} Meter."),
            SizedBox(height: 10),
            Text("Gender: ${widget.gender}"),

            SizedBox(height: 30),

            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
            ),

            SizedBox(height: 10),

             SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                },
                child: Text("Save Data"),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
