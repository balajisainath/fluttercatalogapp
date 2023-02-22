import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {

  final int days=30;
  final String name="catalogApp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("catalog App")),
      ),
       body: Container(
        child: Center(child: Text("$name app in $days days")),
      ),
      drawer: Drawer(
        child: Center(
          child: Text("hello"),
        ),
      ),
    );
  }
}
