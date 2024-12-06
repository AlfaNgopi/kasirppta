// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:kasirppta/view/anothertestpage_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  late List<Widget> _widgetOptions;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomePage(),
      AnothertestpageView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
    );
  }

  Widget HomePage() {
    return Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home Page',
            ),
            TextButton(onPressed: () {
              setState(() {
                selectedIndex = 1;
              });
              
            }, child: Text('Go to Another Page'))
           
          ],
        ),
      ),
    );
  }
}