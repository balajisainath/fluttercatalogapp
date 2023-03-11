import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp1/models/catalogs.dart';
import 'package:flutterapp1/widgets/MyDrawer.dart';

import '../widgets/item_widget.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
//  final List dummylist=List.generate(12, (index) => CatalogModel.items[0]);
  final int days = 30;
  final String name = "Product Dekho";
  @override
  void initState() {
    super.initState();
    LoadData();
  }
  LoadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogjson = await rootBundle.loadString(
        "assets/files/catalog.json");
    final decodeddata = jsonDecode(catalogjson);
    var productsdata=decodeddata["Products"];
    CatalogModel.items=List.from(productsdata).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Product Dekho",style: TextStyle(color: Colors.black),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty) ?ListView.builder(
          itemCount: CatalogModel.items.length,
            itemBuilder: (context,index){
              return ItemWidget(item: CatalogModel.items[index],);
            }
        ): Center(child:
          CircularProgressIndicator(),)
      ),
      drawer: MyDrawer(),
    );
  }
}
