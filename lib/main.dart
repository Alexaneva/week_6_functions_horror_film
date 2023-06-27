import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.indigo),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int age = 0;

  horrorAge(int age) {
    if (age < 16) {
      return ("You can't watch this movie");
    } else if (age >= 18) {
      return ("You can watch this film");
    } else {
      return ("You can watch this film with adult");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Can you watch this film?"),
        ),
        body: Center(
          child: Container(
            height: 800,
            width: 430,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/forest.jpg'), fit: BoxFit.fill),
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontStyle: FontStyle.italic),
                    border: OutlineInputBorder(),
                    labelText: 'Enter your age',
                  ),
                  onSubmitted: (value) {
                    var myage = int.parse(value);
                    setState(() {
                      age = myage;
                    });
                  },
                  keyboardType: TextInputType.number,
                ),
                Text(horrorAge(age)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
