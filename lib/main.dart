import 'package:farm_dev_tech/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './pages/homepage.dart';
import './pages/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  print(email);
  runApp(Routes());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class Button1 extends StatefulWidget {
  const Button1({Key? key}) : super(key: key);

  @override
  State<Button1> createState() => _Button1State();
}

class _Button1State extends State<Button1> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text("Data added"));
  }
}

class Textcontrol extends StatelessWidget {
  const Textcontrol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  String texttwo = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Username',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Submit ')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString("email", "useremail@gmail.com");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) {
                  return Home();
                }));
              },
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.remove("email");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
              return Login();
            }));
          },
          child: Text(
            "Logout",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: email == null ? Login() : Home(),
        initialRoute: Homepage.id,
        routes: {
          LoginPage.id: (context) => const LoginPage(),
          Homepage.id: (context) => const Homepage()
        });
  }
}

class RouteStart extends StatelessWidget {
  const RouteStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: email == null ? Login() : Home(),
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id: (context) => const LoginPage(),
          Homepage.id: (context) => const Homepage()
        });
  }
}
