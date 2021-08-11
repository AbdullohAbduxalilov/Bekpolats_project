import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:imtixon/roots/bag.dart';
import 'package:imtixon/roots/details.dart';
import 'package:imtixon/roots/explore.dart';
import 'package:imtixon/roots/home.dart';
import 'package:imtixon/roots/menu.dart';
import 'package:imtixon/roots/saved.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      onGenerateRoute: (RouteSettings settings){
        List<String> _path = settings.name.toString().split('/');
        if(_path[1]=='Details'){
          return MaterialPageRoute(builder: (context)=>Details(int.parse(_path[2])));
        }
      },

      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  List<Widget>? _listPage;
  Home? _home;
  Saved? _saved;
  Menu? _menu;
  Explore? _explore;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _home = Home();
    _saved = Saved();
    _menu = Menu();
    _explore = Explore();
    _listPage = [_home!,_explore!,_saved!,_menu!];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _listPage![_index],
      bottomNavigationBar: Container(
        height: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0,-0.5),
            ),
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _index,
            selectedItemColor: Colors.black87,
            unselectedItemColor: Colors.black12,
            unselectedLabelStyle: TextStyle(color: Colors.black26,fontWeight: FontWeight.bold),
            selectedLabelStyle: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),
            showUnselectedLabels: true,
            selectedFontSize: 16.0,
            onTap: (e){
              setState(() {
                _index = e;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                label: 'Explore',
                activeIcon: Icon(Icons.explore),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.save_alt_outlined),
                label: 'Saved',
                activeIcon: Icon(Icons.save_alt_sharp),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_outlined),
                label: 'Menu',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
