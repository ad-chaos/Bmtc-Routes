import 'dart:async';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(const BmtcApp());
}

class BmtcApp extends StatelessWidget {
  const BmtcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BmtcHomepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BmtcHomepage extends StatefulWidget {
  const BmtcHomepage({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<BmtcHomepage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('opening.png');
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String validatePassword(String password, String usrName) {
    return "Always valid lol";
  }

  final _formkey = GlobalKey<FormState>();

  TextFormField passwordField = TextFormField(
    obscureText: true,
    decoration: const InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Password',
    ),
    validator: (input) {
      if (input == "") {
        return "Can't be null mate :)";
      } else if (input == "password" || input == "Password") {
        return "Bruh, you serious?";
      }
      return null;
    },
  );
  TextFormField usernameField = TextFormField(
    decoration: const InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Username',
    ),
    validator: (input) {
      if (input == "") {
        return "You Sure you don't have a name?";
      }
      return null;
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMTC Route Finder')),
      body: Form(
        key: _formkey,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: usernameField),
            Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: passwordField),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }
                  },
                  child: const Text('Login'),
                )),
          ]),
        ),
      ),
    );
  }
}

/*
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 500;

    return Scaffold(
        appBar: AppBar(
          title: const Text('BMTC Route Finder'),
        ),
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
              constraints: const BoxConstraints(maxWidth: maxWidth),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: maxWidth),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                )),
          ]),
        ));
  }
}
*/
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      "recharge.jpeg",
      "fare.jpeg",
      "TripPlanner.jpeg",
      "bus.jpeg",
      "live.jpeg"
    ];
    List<String> buttons = [
      "Recharge/Bus Pass",
      "Fare",
      "Trip Planner",
      "Nearby Bus Stop",
      "Live Tracking"
    ];
    List<Row> entries = [];
    for (final iButton in IterableZip([icons, buttons])) {
      entries.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Image.asset(iButton[0], width: 50, height: 50)),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
                child: Text(iButton[1]),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Catto()));
                }))
      ]));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMTC Route Finder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: entries,
        ),
      ),
    );
  }
}

class Catto extends StatelessWidget {
  const Catto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TODO")),
        body: Center(child: Image.asset('cat.webp')));
  }
}
