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
                child: Text("Red"),
                onPressed: () {
                  print(5);
                  color = Colors.red;
                  print(color);
                },
              ),
              SizedBox(width: 20),
              ElevatedButton(
                child: Text("Black"),
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
  @override
  State<StatefulWidget> createState() {
    return ToggleWorkingState();
  }
}

class ToggleWorkingState extends State<ToggleWorking> {
  Color color = Colors.white;
  int counterValue = 0;
  TextEditingController nameController = TextEditingController(text: "no data");

  getEmail() {
    return "email@gmail.com";
  }

  @override
  void initState() {
    
    nameController.text = getEmail();
    // do some computaion
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Add"),
                onPressed: () {
                  setState(() {});

                  counterValue = counterValue + 1;

                  print(counterValue);
                },
              ),
              SizedBox(width: 20),
              Text(counterValue.toString()),
              SizedBox(width: 20),
              ElevatedButton(
                child: Text("Sub"),
                onPressed: () {
                  counterValue = counterValue - 1;
                  setState(() {});
                  print(counterValue);
                },
              ),
              SizedBox(width: 20),
              Text("Please type your name"),
              SizedBox(width: 20),
              TextField(
                controller: nameController,
              ),
              if (counterValue < 10)
                ElevatedButton(
                  child: Text("I am here"),
                  onPressed: () {
                    setState(() {});
                    print(nameController.text);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
