import 'package:flutter/material.dart';

import './page_computer.dart' as computer;
import './page_smartphone.dart' as smartphone;
import './page_printer.dart' as printer;
import './page_headset.dart' as headset;

void main() {
  runApp(MaterialApp(
    title: 'Tab Bar',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Electronic Centre'),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.computer),
              text: 'Computer',
            ),
            Tab(
              icon: Icon(Icons.smartphone),
              text: 'Smartphone',
            ),
            Tab(
              icon: Icon(Icons.print),
              text: 'Printer',
            ),
            Tab(
              icon: Icon(Icons.headset),
              text: 'Headset',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          computer.Computer(),
          smartphone.Smartphone(),
          printer.Printer(),
          headset.Headset(),
        ],
      ),
    );
  }
}
