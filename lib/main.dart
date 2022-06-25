import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen());
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String initailButtonValue = "Coding";
  Map<int, String> bbmap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        future: getBloodBanksFromCloud(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            return ListView(
              children: [...convertToWidget(snapshot.data as List<String>)],
            );
          }

          if (snapshot.hasError) return Text(snapshot.error.toString());

          return Container();
        },
      ),
    ));
  }

  void makeBbMap() {
    Map<int, String> bbmap = {};
    final bb = <int, String>{1: "Red Cross", 2: "Blue Cross"};
    bbmap.addAll(bb);
  }

  List<Widget> convertToWidget(List<String> bloodBanks) {
    List<Widget> myWidgets = [];
    for (int i = 0; i < bloodBanks.length; i++) {
      myWidgets.add(myCustomWidget(bloodBanks[i]));
    }
    return myWidgets;
  }

  Widget myCustomWidget(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(child: Text(text)),
    );
  }

  Future<List<String>> getBloodBanksFromCloud() async {
    // faking bringing data from cloud
    var time = await Future.delayed(Duration(seconds: 2));
    Random random = Random();
    int randomNumber = random.nextInt(3);

    if (randomNumber == 0)
      return [
        "Red Cross Blood Bank",
        "Rajiv Gandi Blood Bank",
        "Modi ji Blood Bank"
      ];
    else if (randomNumber == 1)
      throw Exception("Network exception");
    else
      throw Exception("Server Exception");
  }
}

List<BloodBank> getAllBloodBanks() {
  BloodBank modiJiBloodBank = BloodBank( name: "Modi Ji", id : 3);

  BloodBank rahulBloodBank = BloodBank(name: "Rahul", id: 2);


  return [modiJiBloodBank, rahulBloodBank];
}

class BloodBank {
  int? id;
  String? name;
  String? address;
  int? lat;
  int? long;
  double? minEmergencyBlood;
  //"B+", "B-", "O+", "AB-"
  Map<String, double>? currentBloodStatus;

  BloodBank(
      {required this.id,
      required this.name,
      this.address,
      this.lat,
      this.long,
      this.minEmergencyBlood});

  bool donateBlood(String bloodGroup, double quantity) {
    return true;
  }

  bool acceptBlood(String bloodGroup, double quantity) {
    return true;
  }

  String testBloodGroup(String patientReport) {
    return "AB-";
  }

  bool validateBlood() {
    return true;
  }
}
