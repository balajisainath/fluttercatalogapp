import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp1/models/catalogs.dart';
import 'package:flutterapp1/pages/home_widgets/catalog_header.dart';
import 'package:flutterapp1/pages/home_widgets/catalog_list.dart';
import 'package:flutterapp1/widgets/MyDrawer.dart';
import 'package:flutterapp1/widgets/themes.dart';
import '../widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: mythemes.creamcolour,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items !=null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
