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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> iconsName = [
      "TripPlanner.jpeg",
      "recharge.jpeg",
      "fare.jpeg",
      "bus.jpeg",
      "live.jpeg"
    ];
    List<String> buttonsName = [
      "Trip Planner",
      "Recharge/Bus Pass",
      "Fare",
      "Nearby Bus Stop",
      "Live Tracking"
    ];
    List<Padding> icons = <Padding>[];
    List<Padding> buttons = <Padding>[];
    for (final iButton in IterableZip([iconsName, buttonsName])) {
      icons.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Image.asset(iButton[0], width: 75, height: 75)));
      buttons.add(Padding(
        padding: const EdgeInsets.all(25),
        child: SizedBox(
            height: 50,
            child: ElevatedButton(
                child: Text(iButton[1], style: const TextStyle(fontSize: 25),),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Catto()));
                })),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMTC Route Finder'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Center(
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: icons,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buttons,
                )
              ],
            ),
          ),
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
        body: Center(child: Image.asset('opening.png')));
  }
}

class FareScreen extends StatelessWidget {
  const FareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
