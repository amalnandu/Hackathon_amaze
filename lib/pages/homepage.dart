import 'package:flutter/material.dart';
import 'LoginPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var vegetables = ['tomato', 'carrot', 'rice', 'potato', 'cereals'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: ListTile(
                  leading: Image.asset('assets/${vegetables[index]}.png'),
                  trailing: const Text(
                    "Price",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text("${vegetables[index]}")),
              onTap: () => {Navigator.of(context).pushNamed(LoginPage.id)},
            );
          }),
    );
  }
}
