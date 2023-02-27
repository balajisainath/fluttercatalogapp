import 'package:flutter/material.dart';
import 'package:flutterapp1/widgets/MyDrawer.dart';

class Homepage extends StatelessWidget {
  final int days = 30;
  final String name = "catalogApp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Catalog App",style: TextStyle(color: Colors.black),),
        ),
      ),
      body: Container(
        child: Center(child: Text("$name app in $days days")),
      ),
      drawer: MyDrawer(),
    );
  }
}
