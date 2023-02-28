import 'package:flutter/material.dart';
import 'package:flutterapp1/models/catalogs.dart';
import 'package:flutterapp1/widgets/MyDrawer.dart';

import '../widgets/item_widget.dart';

class Homepage extends StatelessWidget {
  final List dummylist=List.generate(12, (index) => CatalogModel.items[0]);
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummylist.length,
            itemBuilder: (context,index){
              return ItemWidget(item: dummylist[index],);
            }
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
