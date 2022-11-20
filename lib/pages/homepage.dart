import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:farm_dev_tech/pages/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var vegetables = ['tomato', 'carrot', 'rice', 'potato', 'cereals'];
  var vegetablePrice = ['25', '40', '31', '11', '15'];

  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Sell',
      style: optionStyle,
    ),
    Text(
      'Index 2: Options',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Farm Dev')),
      ),
      backgroundColor: Colors.lightBlue,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("groceries").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.requireData;
            print("this is something i dont know ${data.size}");
            return FirestoreListView(data.docs);
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Text("No connection");
          }
          var borderRadius = const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12));
          return ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: borderRadius),
                      tileColor: Colors.transparent,
                      selectedTileColor: Colors.orange[100],
                      leading: Image.asset("assets/${vegetables[index]}.png"),
                      trailing: Text(
                        "${vegetablePrice[index]}",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      title: Text("${vegetables[index]}")),
                  onTap: () => {Navigator.of(context).pushNamed(LoginPage.id)},
                );
              });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class FirestoreListView extends StatelessWidget {
  FirestoreListView(this.documents);
  final List<DocumentSnapshot> documents;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      itemExtent: 90.0,
      itemBuilder: (BuildContext context, int index) {
        String name = documents[index].data().toString();

        return Text(name);
      },
    );
  }
}
