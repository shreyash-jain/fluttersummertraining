import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToggleWorking(),
    );
  }
}

class Toggle extends StatelessWidget {
  Toggle({Key? key}) : super(key: key);
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Red1"),
                onPressed: () {
                  print(5);
                  color = Colors.red;
                  print(color);
                },
              ),
              SizedBox(width: 20),
              ElevatedButton(
                child: Text("Black2"),
                onPressed: () {
                  print(6);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToggleWorking extends StatefulWidget {
  ToggleWorking({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ToggleWorkingState();
}

class ToggleWorkingState extends State<ToggleWorking> {
  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Red"),
                onPressed: () {
                  print(5);
                  setState(() {
                    color = Colors.red;
                  });
                  print(color);
                },
              ),
              SizedBox(width: 20),
              ElevatedButton(
                child: Text("Black"),
                onPressed: () {
                  setState(() {
                    color = Colors.black;
                  });

                  print(6);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
