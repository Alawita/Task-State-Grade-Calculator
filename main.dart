import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final gradesController = TextEditingController();

  String letterGrade = "";

  calcLetter() {
    double grade = double.parse(gradesController.text);

    if (grade >= 90) {
      setState(() {
        letterGrade = "A";
      });
    } else if (grade >= 80) {
      setState(() {
        letterGrade = "B";
      });
    } else if (grade >= 70) {
      setState(() {
        letterGrade = "C";
      });
    } else if (grade >= 60) {
      setState(() {
        letterGrade = "D";
      });
    } else {
      setState(() {
        letterGrade = "F";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Grade Calculator"),
          backgroundColor: Colors.lightBlueAccent),
      drawer: Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(50),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: gradesController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.percent,
                    color: Colors.lightBlueAccent,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 15.0),
                      borderRadius: BorderRadius.circular(50)),
                  hintText: 'enter your grade here :3',
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: calcLetter,
            child: Text(
              "Calulate!",
              style: TextStyle(color: const Color.fromRGBO(0, 0, 0, 1)),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent),
          ),
          Text(
            "$letterGrade",
            style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent),
          )
        ],
      ),
    );
  }
}
